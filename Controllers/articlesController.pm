#user 11
package Controllers::articlesController;

use strict;
use warnings;

use Data::Dumper;

use vars qw(@ISA  $content @data $form $error);
use Controller;
use Models::Articles;
use Libs::Request;
use Time::Piece;
use Libs::Session;

@ISA = qw(Controllers::Controller);


sub createAction;
sub editAction;
sub deleteAction;

sub createAction
{
    my ($self) = @_;
    my $request = Libs::Request->new();

    my $session =  $self->get('session');
    unless ( $session->check())
    {
        print "Location: index.pl\n\n";
    }


    if ($request->isPost())
    {
        my %data = (
            'title'=>   $request->getData('title'),
            'content'=>  $request->getData('content'),
            'user_id'=> $self->get('session')->get('id'),
            'date'=> localtime->strftime('%Y-%m-%d')
        );

        my $model = Models::Articles->new($self->get('model'), $self->get('db'));
        $model->createArticle(\%data);
        
        print "Location: index.pl?route=users/index \n\n";
        exit;

     }
    require "articles/create.pl";
    return $form;
}

sub editAction
{
    my ($self, $articleId) = @_;

    my $request = Libs::Request->new();
    my $model = Models::Articles->new($self->get('model'), $self->get('db'));

    my $session =  $self->get('session');
    unless ( $session->check())
    {
        print "Location: index.pl\n\n";
    }

    @data = $model->getOne($articleId);
    

    if ($data[0]->{'user_id'} != $session->get('id'))
    {
        $error = 1;
    }

    if ($request->isPost())
    {

        my %data = (
            'title'     =>  $request->getData("title"),
            'content'   =>  $request->getData("content"),
        );

        $model->updateArticle(\%data, $articleId);
        
        print "Location: index.pl?route=users/index \n\n";
        exit;
}

require "articles/edit.pl";
return $form;
}

sub deleteAction
{
    my ($self, $articleId) = @_;
    
    my $session =  $self->get('session');
    my $model = Models::Articles->new($self->get('model'), $self->get('db'));
    @data = $model->getOne($articleId);

    unless ( $session->check())
    {
        print "Location: index.pl\n\n";
        exit;
    }

    if($data[0]->{'user_id'} != $session->get('id'))
    {
        print "Location: index.pl\n\n";
        exit;
    }

    if ($articleId)
    {
        my $model = Models::Articles->new($self->get('model'), $self->get('db'));
        $model->deleteArticle($articleId);
    
        print "Location: index.pl?route=users/index \n\n";
        exit;
    }
        
}

1;
