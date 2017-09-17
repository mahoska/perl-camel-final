#user 11
package Models::Articles;

use strict;
use warnings FATAL => 'all';

use Data::Dumper;

use Models::DB;

my $db;
my $model;
my $table = 'articles';

sub new
{
    my($self, $dbModel, $dbh) = @_;
    $model = $dbModel;
    $db = $dbh;
    my $class = ref($_[0])||$_[0];
    return bless {}, $class;
}

sub getAmount
{
    my ($self, $start, $count) = @_;

    $model->select($table);
    $model->_join('left', 'users', 'users.id = articles.user_id');
    $model->orderBy('articles.id', 'DESC');
    $model->limit($start, $count);
    my $query = $model->execute();

    return $model->getDataHash($query);
}

sub getAll
{
    my ($self) = @_;

    $model->select($table);
    $model->_join('left', 'users', 'users.id = articles.user_id');
    $model->orderBy('date');
    my $query = $model->execute();
    return $model->getDataHash($query);
}

sub getOne
{
    my ($self, $articleId) = @_;
    $model->select($table);
    $model->where('id', $articleId);
    my $query = $model->execute();
    return $model->getDataHash($query); 
}

sub getByUserId
{
    my ($self, $userId) = @_;

    $model->select($table);
    $model->where('user_id', $userId);
    $model->orderBy('id', 'desc');
    my $query = $model->execute();
    return $model->getDataHash($query);
}

sub createArticle
{
    my($self, $data) = @_;
    return $model->insert($table, \%$data);
}

sub updateArticle
{
    my ($self, $data, $articleId) = @_;
    return $model->update($table, \%$data, $articleId);
}



sub deleteArticle
{
    my($self, $articleId) = @_;
    return $model->delete($table, $articleId);
}



1;
