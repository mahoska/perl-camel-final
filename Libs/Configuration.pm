#create user_15
package Libs::Configuration;

use strict;
use warnings;
use XML::Simple;

sub new;
sub readConfig;

sub new{
    my $class = ref($_[0])||$_[0];
    return bless{}, $class;
}


sub readConfig
{
 my ($self, $filename) = @_;
 my $simple = XML::Simple->new();
 if (! ( (-e $filename) and (-R $filename) ) )
 {
    die $@="file not found!!!";
 }
 my $data = $simple->XMLin($filename);

 return $data;
}

1;
