#!/usr/bin/perl

use strict;

use Data::Dumper;

my ($matriz, $matriz_t);
my $i;

while(<>)
{
	chomp;
	my @linha = split;
	push @{$matriz}, [@linha];

	for(my $j; $j < scalar @linha; $j++)
	{
		$matriz_t->[$j]->[$i] = $matriz->[$i]->[$j];
	}

	$i++;
}

print 'Matriz original: ';
print Dumper($matriz);

print 'Matriz transposta: ';
print Dumper($matriz_t);
