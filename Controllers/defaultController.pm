#create user_10
package Controllers::defaultController;

use strict;
use warnings;

use vars qw($content @data);

use vars qw(@ISA);
use Controller;

@ISA = qw(Controllers::Controller);

use Models::Articles;
use Models::Pagination;
use Libs::Request;
sub homeAction;
sub authorsAction;

sub homeAction
{
    my ($self) = @_;

    my $limit = 2;
    my $start;

    my $pag = Models::Pagination->new($self->get('model'), $self->get('db'), $limit);
    our $pages = $pag->getCountPage('articles');

    my $request = Libs::Request->new();
    our $page = $request->getData('page');

    if( !($page) or ($page > $pages) )
    {
        $page = 1;
        $start = 0;
    }
    else
    {
        $start = $limit * ($page - 1);
    }

    @data = $pag->getArticlePage($start, $limit);

    require 'articles/articles.pl';
    return $content; 

}

sub authorsAction
{
    my ($self) = @_;
    require 'authors/camel_team.pl';
    return $content; 
}

1;
