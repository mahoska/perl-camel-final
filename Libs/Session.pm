#create user_10
package Libs::Session;

use strict;
use warnings;

use CGI::Session;
use CGI;

sub start;
sub check;
sub delete;
sub get;

my $cgi = CGI->new();
my %user_info;
my $session;
my $dirName;
my $cookieName;
my $cookieLife;

sub new
{
    my $class = ref($_[0])||$_[0];
    $cookieName = $_[2];
    $dirName = $_[1];
    $cookieLife = $_[3];
    %user_info = ();

    return bless{}, $class;
}


# Start the session (whith User data "login" and "id") and set the cookie
sub start
{
    my ($self, $login, $id, $path) = @_;
    if (! ( (-d 'webroot/tmp') and (-R 'webroot/tmp') and (-W 'webroot/tmp') and (-X 'webroot/tmp') ) )
    {
        die $@="problem with session file";
    }
    $session = new CGI::Session("driver:File", undef, {Directory=> $dirName });

    $session->expire($cookieLife);
    $session->param('login', $login);
    $session->param('id', $id);

    my $sid = $session->id();
    my $cookie = $cgi->cookie($cookieName => $sid);

    print $cgi->header( -cookie=>$cookie, -location=>$path );

    return 1;
}

# Checking the session (if true - get data from file)
sub check
{
    my ($self, $sid) = @_;
    %user_info = ();
    
    if(! ($sid = $cgi->cookie($cookieName)) )
    {
        return 0;
    }

    $session = CGI::Session->load(undef, $sid, {Directory=> $dirName});
    my $id = $session->id();
    
    if ($session->is_expired())
    {
        return 0;
    }

    if (! ( ($id == $sid) and $id and $sid ) )
    {
        return 0;
    }

    $user_info{'login'} = $session->param('login');
    $user_info{'id'} = $session->param('id');

    return 1;
}

# Getting User information from the session "login" or "id"
sub get
{
    my ($self, $param) = @_;

    return $user_info{$param};
}

# Deleting a session file and cookies
sub delete
{
    my ($self, $path) = @_;

    $session->delete();
    $session->flush();

    my $cookie = $cgi->cookie($cookieName => '');
    print $cgi->header( -cookie=>$cookie, -location=>$path );
}

1;