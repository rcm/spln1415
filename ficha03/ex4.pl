#!/usr/bin/perl

use strict;

use Data::Dumper;

my $alunos;

while(<>)
{
	chomp;
	my @linha = split;

	my $nome = @linha[0];
	my $uc = @linha[1];
	my $nota = @linha[2];

	$alunos->{$nome}->{$uc} = $nota;
}

print Dumper($alunos);
