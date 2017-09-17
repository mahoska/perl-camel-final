#create user_15
package Libs::MyException;

use strict;
use warnings;

use vars qw($error);

sub new{
    my $class = ref($_[0])||$_[0];
    return bless{}, $class;
}


sub getErrorPage
{
    my ($self, $url)=@_;
    require $url;
    print "Content-type: text/html; charset=utf-8\n\n";
    print $error;
}

1;