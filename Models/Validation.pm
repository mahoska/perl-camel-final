# the package create user10 except for some methods
package Models::Validation;

use strict;
use warnings FATAL => 'all';
use Data::Dumper;


sub new
{
    my $class = ref($_[0])||$_[0];
    return bless {}, $class;
}

# Removes all HTML tags
sub clearHtml
{
    my($self, $string) = @_;

    if ($string)
    {
        $string =~ s/<([^>]|\n)*>//g;

        if (length($string) <= 3)
        {
            return 0;
        }

        return $string;
    }
    else
    {
        return 0;
    }
}

# Remove all spaces in word
sub clearWord
{
    my($self, $string) = @_;
    $string = $self->clearHtml($string);
    if ($string)
    {
        $string =~ s/[^-A-Za-z0-9_.]+?//g;

        if (length($string) <= 3)
        {
            return 0;
        }

        return $string;
    }
    else
    {
        return 0;
    }
}

# Remove all spaces before and after article
sub clearArticle
{
    my($self, $string) = @_;
    $string = $self->clearHtml($string);
    if ($string)
    {
        $string =~ s/^\s+//img;
        $string =~ s/\s+$//img;

        if (length($string) <= 3)
        {
            return 0;
        }

        return $string;
    }
    else
    {
        return 0;
    }
}

# Email validation /**user_15**/
sub clearEmail
{
    my($self, $string) = @_;

    return 0 if !$string;
    
    my $is_email_valid = $string =~ /^[\.\-_A-Za-z0-9]+?@[\.\-A-Za-z0-9]+?(\.)[A-Za-z0-9]{2,3}$/i;
 
    return $is_email_valid ? 1 : 0 ;

}

# Processing login form data
sub checkLoginForm
{
    my($self, %hash) = @_;
    
    $hash{'login'} = $self->clearWord($hash{'login'});
    $hash{'password'} = $self->clearWord($hash{'password'});
    
    return %hash;
}

# Processing registration form data  /**user_15**/
sub checkRegForm
{
     my($self, %hash) = @_;
     return ('status'=> 0, 'err' => "uncorrect login") if !($self->clearWord($hash{'login'}));    
     return ('status'=> 0, 'err' =>"uncorrect password") if !($self->clearWord($hash{'password'}));
     $hash{'password_v'} = $self->clearWord($hash{'password_v'});
     return ('status'=> 0, 'err' =>"password mismatch") if !($self->clearWord($hash{'password_v'})  eq  $self->clearWord($hash{'password'}));
     return ('status'=> 0, 'err' =>"uncorrect email") if !($self->clearEmail($hash{'email'}));
      
    return ('status'=> 1);    
}

# Processing email user form data
sub checkUserForm
{
    my($self, $string) = @_;

    if(!($string = $self->clearEmail($string)))
    {
        return 0;
    }

    return $string;
}

1;
