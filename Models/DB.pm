#user11;
package Models::DB;
use strict;
use warnings FATAL => 'all';

use Data::Dumper;
use DBI;

my $dbh;
my $self;
my $sql;

sub instance;
sub connect;
sub rowsCount;
sub select;
sub insert;
sub update;
sub delete;
sub _join;
sub where;
sub _where;
sub _whereMd5;
sub limit;
sub orderBy;
sub execute;
sub getDataHash;
sub getOne;
sub getNumRows;
sub checkConnect;
sub validString;

sub instance
{
    my ($class, $args) = @_;

    $self = $args;

    bless $self, $class;
    return $self;
}

sub connect
{
    my ($self) = @_;
    $dbh = DBI->connect("DBI:$self->{'dbType'}:$self->{'dbName'}:$self->{'dbHost'}",$self->{'dbUser'}, $self->{'dbPassword'});
    if ($dbh)
    {
        return $dbh;
    }
}

sub rowsCount
{
    my ($self, $table) = @_;
    $self->checkConnect();

    my $sel_sql = "SELECT * FROM $table ";
    my $cnt = $dbh->do($sel_sql);

    return $cnt;
}

sub select
{
    my ($self, $table, $params) = @_;
    $self->checkConnect();

    my $param;
    if ($params)
    {
        $param = join(',', @$params);
    }
    else
    {
        $param = '*';
    }

    $sql .= "SELECT $param FROM $table ";
}

sub insert
{
    my($self, $table, $hash) = @_;
    $self->checkConnect();
    my @keys = ();
    my @values = ();

    foreach my $key (keys %{$hash})
    {
        my $val = $self->validString($hash->{$key});
        push @keys, $key;
        push @values, "'$val'";
    }

    my $keys = join(', ', @keys);
    my $values = join(', ', @values);

    my $sql = "INSERT INTO $table ($keys) VALUES ($values)";

    my $query = $dbh->prepare($sql);

    if ($query->execute())
    {
        $query->finish();
        return 1;
    }
    return 0;
}

sub update
{
    my($self, $table, $hash, $id) = @_;
    $self->checkConnect();

    my @values =();
    if ($id)
    {
        foreach my $key (keys %{$hash})
        {
            my $val = $self->validString($hash->{$key});
            push @values, join(' = ', $key, "'$val'");
        }

        my $values = join(', ', @values);

        my $sql = "UPDATE $table SET $values WHERE id = $id";

        my $query = $dbh->prepare( $sql );

        if ($query->execute())
        {
            $query->finish();
            return 1;
        }
    }
    return 0;
}

sub delete
{
    my($self, $table, $id) = @_;
    $self->checkConnect();

    if ($id)
    {
        my $sql = "DELETE FROM $table WHERE id = $id";
        my $query = $dbh->prepare($sql);

        if ($query->execute())
        {
            $query->finish();
            return 1;
        }
    }

    return 0;
}

sub _join
{
    my ($self, $type, $table, $on) = @_;
    $sql .= uc ($type)." JOIN $table ON $on";
}

sub where
{
    my ($self, $key, $value) = @_;
    $sql .= "WHERE $key = '".$value."'";
}

sub _where
{
    my ($self, $key, $value, $type) = @_;
    $type ||= " AND ";
    $sql .= " ".uc ($type)." $key = $value";
}

sub _whereMd5
{
    my ($self, $key, $value, $type) = @_;
    $type ||= " AND ";
    $sql .= " ".uc ($type)."$key = MD5('$value')";
}

sub limit
{
    my ($self, $num, $offset) = @_;
    $sql .= " LIMIT $num". ($offset ? ", ".$offset : '');
}

sub orderBy
{
    my ($self, $field, $sort) = @_;
    $sql .= " ORDER BY $field ". ($sort ? $sort : 'ASC');
}


sub execute
{
    my($self) = @_;

    my $query = $dbh->prepare($sql);

    if ($query->execute())
    {
        return $query;
    }
    return 0;
}

sub getDataHash
{
    my($self, $query) = @_;

    my @data = (); 
    while(my $row = $query->fetchrow_hashref())
    {
        push @data, $row; 
    }
 
    return @data;
}

sub getOne
{
    my($self, $query, $key) = @_;
    my $row = $query->fetchrow_hashref();
    return $row->{$key};
}

sub geNumRows
{
    my($self, $query) = @_;

    if ($query->rows)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

sub checkConnect
{
    my($self) = @_;
    if (!$dbh)
    {
        $dbh = $self->connect();
    }
}

sub DESTROY
{
    if (defined($dbh))
    {
        $dbh->disconnect;
    }
}

sub validString
{
    my ($self, $string) = @_;
    $string =~ s/<(?:[^>'"]*|(['"]).*?\1)*>//ig;
    $string =~ s/^\s+|\s+$//g;
    return $string;
}

1;
