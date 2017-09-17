#create user_15
package Controllers::authController;

use strict;
use warnings;

use vars qw(@ISA $regform $message %form);
use Controller;
@ISA = qw(Controllers::Controller);

use Libs::Request;
use Models::Validation;
use Models::Users;
use Libs::Session;

sub registrationAction;
sub loginAction;
sub logoutAction;

sub registrationAction
{
    
    my ($self) = @_;
    my ( $valid, %is_valid, $model,  $if_record, $user_id);
    my $request = Libs::Request->new();
 
    $message = "";
    
    my $session =  $self->get('session');
    if( $session->check())
    {
        
      print "Location: index.pl\n\n";
    }

 
    if($request->isPost())
    {
        %form = (
                'login'=>  $request->getData('login'),
                'password'=> $request->getData('password'),
                'password_v'=> $request->getData('password_v'),
                'email'=> $request->getData('email')
                ); 

    $valid = Models::Validation->new();
    %is_valid = $valid->checkRegForm(%form);
    
    if ($is_valid{'status'})
    {
       $model = Models::Users->new($self->get('model'), $self->get('db'));
       
       delete $form{'password_v'};
       $if_record = $model->createUser(\%form); 
       
       if ($if_record)
        {
            my %user_data = ('login'=> $form{'login'},  'password'=> $form{'password'});
            $user_id = $model->issetUser(\%user_data);
                 
            $session->start( $form{'login'}, $user_id,  "index.pl");            

        }

        $message = "sorry, but at the moment registration is impossible"; 
    }
    
    $message = $is_valid{'err'};
    require "users/registration.pl";    
    return $regform;

    }

   require "users/registration.pl";
   return $regform;
}


sub loginAction
{
    my ($self) = @_;
    my (%data, $valid, $isvalid, $model, $user_id);
    my $request = Libs::Request->new();
    
    my $session =  $self->get('session');

    if( $session->check() )
    {
        print "Location: index.pl\n\n";
    }

    if (! $session->check() )
    {
        %data = (
            'login'=> $request->getData('login'),
            'password'=> $request->getData('password')
        );

        $model = Models::Users->new($self->get('model'), $self->get('db'));
        $user_id =  $model->issetUser(\%data);

        if (!$user_id)
        {
            print "Location: index.pl\n\n";
        }
    
        if($user_id)
        { 
            $session->start( $data{'login'}, $user_id , 'index.pl');  
        }
    }
}

sub logoutAction
{
    my ($self) = @_;
    
    my $session =  $self->get('session');

    if( !$session->check())
    {
      print "Location: index.pl\n\n";
    } 
    
    $session->delete('index.pl');
}


1;
