#!/usr/bin/perl

use strict;

use File::Basename qw(dirname);
use lib dirname(__FILE__).'/Libs/';
use lib dirname(__FILE__).'/Controllers/';
use lib dirname(__FILE__).'/Views/';

use Libs::Router;
use Libs::MyException;

eval
{
    my $router = Libs::Router->new();
    my $route = $router->getRoute('route','default/home');

    my $controller =  $route->{'controller'};
    my $action =  $route->{'action'};
    my $params =  $route->{'params'};
 
     require $controller.".pm";
     my $controller_class = "Controllers::$controller";
     $controller = $controller_class->new();
     $controller->setContainer();
    
     if($controller->can($action))
     {
         $controller->draw($controller->$action($params));
     }
     else
     {
         Libs::MyException->new()->getErrorPage('error/page_not_found.pl');
     }
};
if($@)
{	
    Libs::MyException->new()->getErrorPage('error/error_service.pl'); 
}  
   
1;


#create user_15