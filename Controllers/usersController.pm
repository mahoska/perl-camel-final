#user 11;
package Controllers::usersController;
use strict;
use warnings FATAL => 'all';

use Data::Dumper;

use vars qw(@ISA $form @data $content $error);
use Controllers::Controller;
use Models::Users;
use Models::Articles;
use Models::Validation;
use Libs::Request;

@ISA = qw(Controllers::Controller);

sub rules;
sub indexAction;
sub editAction;

sub new
{
    my $class = ref($_[0])||$_[0];
    return bless{}, $class;
}

sub rules
{
    my ($self, $data) = @_;
    my ($model);

    $model = Models::Validation->new();
     
    unless ($model->clearEmail($data->{'email'}))
    {
        return ('status' => '0', 'message' => 'not valid email');
    }
    if ($model->clearWord($data->{'password_v'}) ne $model->clearWord($data->{'password'}))
    {
        return ('status' => 0, 'message' => 'password not equal'); 
    }

    return ('status' => 1, 'message' => 'success');
}

sub indexAction
{
    my ($self) = @_;
    my($model);
   
    my $session =  $self->get('session'); 
    unless( $session->check())
    {
        print "Location: index.pl\n\n";
        exit;
    }

    $model = Models::Articles->new($self->get('model'), $self->get('db'));

    @data = $model->getByUserId($session->get('id'));
    
    require 'articles/user_articles.pl';
    return $content;
}

sub editAction
{
    my ($self) = @_;
    my($request, $model, @fields, %result);
    
    my $session =  $self->get('session');
    unless( $session->check())
    {
        print "Location: index.pl\n\n";
        exit;
    }


    $request = Libs::Request->new();
    $model = Models::Users->new($self->get('model'), $self->get('db'));

    @fields = ('login','email');
    @data = $model->getUserById(\@fields, $session->get('id'));
    
    if ($request->isPost())
    {
        my %data = (
            'email'=>  $request->getData("email"),
            'password'=> $request->getData("password"),
            'password_v'=> $request->getData("password_v")
        );

        %result = $self->rules(\%data);

        if ($result{'status'})
        {
            delete $data{'password_v'};
            $model->updateUser(\%data, $session->get('id'));
            print "Location: index.pl?route=users/index \n\n";
            exit;
        }
    }
    
    $error = $result{'message'};
    require "users/edit.pl";
    return $form;
}


1;
