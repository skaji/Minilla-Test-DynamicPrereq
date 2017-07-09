package builder::MyBuilder;
use strict;
use warnings;
use base 'Module::Build';

sub new {
    my ($class, %option) = @_;
    if ($^O eq 'MSWin32') {
        $option{requires}{'Win32::Console::ANSI'} = 0;
    }
    $class->SUPER::new(%option);
}

1;
