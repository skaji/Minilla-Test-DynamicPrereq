# NAME

Minilla::Test::DynamicPrereq - How to change prerequisites dynamically with Minilla

# DESCRIPTION

Please note that [Minilla](https://metacpan.org/pod/Minilla) clearly says

    Your module has a static list of prerequisites that can be described in cpanfile

That is, Minilla does not expect prerequisites change dynamically.

But _There is more than one way to do it_, so here is how to change prerequisites dynamically with Minilla.

`minil.toml`:

    name = "Minilla-Test-DynamicPrereq"
    module_maker = "ModuleBuild"
    [build]
    build_class = "builder::MyBuilder"
    [Metadata]
    dynamic_config = 1

`builder/MyBuilder.pm`:

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

# LICENSE

Copyright (C) Shoichi Kaji.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Shoichi Kaji <skaji@cpan.org>
