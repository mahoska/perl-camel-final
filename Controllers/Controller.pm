#create user_15
package Controllers::Controller;

use strict;
use DBI;

use File::Basename qw(dirname);
use lib '../'.dirname(__FILE__).'/Models/';
use lib '../'.dirname(__FILE__).'/Libs/';

use Libs::Configuration;
use Libs::Container;
use Models::DB;
use Libs::Session;

use vars qw($loyout $content $is_user $user_log $user_id);

sub new;
sub setContainer;
sub get;
sub readConfig;

my $container;

sub new{
    $container = ();
    my $class = ref($_[0])||$_[0];  
    return bless{}, $class;
}

sub setContainer
{
    my ($self) = @_;
    
    my $config = readConfig();
   
    #create container
    $container = Libs::Container->new();

    #save $dbh, $model in container
    my %dbMysql = (
                     'dbType' => $config->{'dbType'},
                     'dbName'=>$config->{'dbName'},
                     'dbHost'=>$config->{'dbHost'},
                     'dbUser'=>$config->{'dbUser'},
                     'dbPassword'=> $config->{'dbPassword'}
                  );
    my $dbModel = Models::DB->instance(\%dbMysql);
    $container->set('model', $dbModel);
     
    my $dbh  = $dbModel->connect();
    $container->set('db', $dbh);

    #is user login
    my $session =  Libs::Session->new(
                                        $config->{'cookiePath'},
                                        $config->{'cookieName'},
                                        $config->{'cookieLife'}
                                     );
    $container->set('session', $session);
    
    my $is_user = $session->check();
    $container->set('is_user',  $is_user);
    $container->set('user_id',  $is_user ?  $session->get('id') : "");
    $container->set('user_log',  $is_user ? $session->get('login') : "");  
}


sub get
{
   my ($self, $key) = @_;
   return $container->get($key);
}


sub readConfig
{
    my ($self) = @_;
    return  (Libs::Configuration->new())->readConfig('webroot/config.xml');
}


sub draw
{
     my ($self, $_content) = @_;
     $content = $_content;
     
     $is_user = $self->get('is_user');
     $user_log = $self->get('user_log');
     $user_id = $self->get('user_id');
     
     require 'layout.pl';
     print "Content-type: text/html; charset=utf-8\n\n";
     print $loyout;
     
}

1;
