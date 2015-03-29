package Entidades::Reconhecer;

use 5.018002;
use strict;
use warnings;
use utf8::all;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Entidades::Reconhecer ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.01';


# Preloaded methods go here.

# \p{L} or \p{Letter}: any kind of letter from any language.
#
#    \p{Ll} or \p{Lowercase_Letter}: a lowercase letter that has an uppercase variant.
#    \p{Lu} or \p{Uppercase_Letter}: an uppercase letter that has a lowercase variant.
#    \p{Lt} or \p{Titlecase_Letter}: a letter that appears at the start of a word when only the first letter of the word is capitalized.
#    \p{L&} or \p{Cased_Letter}: a letter that exists in lowercase and uppercase variants (combination of Ll, Lu and Lt).
#    \p{Lm} or \p{Modifier_Letter}: a special character that is used like a letter.
#    \p{Lo} or \p{Other_Letter}: a letter or ideograph that does not have lowercase and uppercase variants. 


sub new {
	my $class = shift;
	return bless {
		entidades => {},
		preposicao => [],
		ignorar => [],
		palavra_capitalizada => qr/\p{Lu}\p{L}+/,
		palavra_maiuscula => qr/\p{Lu}{2,}/,
	}, $class;
}

sub ignorar {
	my ($self, @palavras) = @_;
	push @{$self->{ignorar}}, @palavras;
	my $re =  sprintf '^\P{L}*(?:%s)', join("|", @{$self->{ignorar}});
	$self->{ignorar_re} = qr/$re/;
}

sub preposicao {
	my ($self, @palavras) = @_;
	push @{$self->{preposicao}}, @palavras;
	my $re =  sprintf '(?:%s)', join("|", @{$self->{preposicao}});
	$self->{regexp} = qr/$self->{palavra_maiuscula}|$self->{palavra_capitalizada}(?:\s+(?:$re\s+)?$self->{palavra_capitalizada})+/;
}

sub reconhecer {
	my ($self, $texto) = @_;

	for my $str (split /\.\s*/, $texto) {
		while($str =~ m/$self->{regexp}/g) {
			my $ent = $&;
			if(exists $self->{ignorar_re} and $ent =~ /$self->{ignorar_re}/) {
				my @words = split /(\s+)/, $ent;
				shift @words;
				shift @words;
				$ent = join "", @words;
				$self->{entidades}{$ent}++ if $ent =~ m/$self->{regexp}/;
			} else {
				$self->{entidades}{$ent}++;
			}
		}
	}
}

sub entidades {
	my $self = shift;
	return sort keys $self->{entidades};
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Entidades::Reconhecer - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Entidades::Reconhecer;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Entidades::Reconhecer, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

lab, E<lt>lab@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2015 by lab

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
