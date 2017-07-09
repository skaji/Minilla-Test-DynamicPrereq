package Minilla::Test::DynamicPrereq;
use 5.008001;
use strict;
use warnings;
our $VERSION = "0.01";

1;
__END__

=encoding utf-8

=head1 NAME

Minilla::Test::DynamicPrereq - How to change prerequisites dynamically with Minilla

=head1 DESCRIPTION

Please note that L<Minilla> clearly says

  Your module has a static list of prerequisites that can be described in cpanfile

That is, Minilla does not expect prerequisites change dynamically.

But I<There is more than one way to do it>, so here is how to change prerequisites dynamically with Minilla.

C<minil.toml>:

  name = "Minilla-Test-DynamicPrereq"
  module_maker = "ModuleBuild"
  [build]
  build_class = "builder::MyBuilder"
  [Metadata]
  dynamic_config = 1

C<builder/MyBuilder.pm>:

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

=head1 LICENSE

Copyright (C) Shoichi Kaji.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Shoichi Kaji E<lt>skaji@cpan.orgE<gt>

=cut

