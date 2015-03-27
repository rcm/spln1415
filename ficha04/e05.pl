# Fa¸ca um programa que leia um texto com linhas do g´enero identificador=valor e crie um
# hash com a informa¸c˜ao correspondente;

use strict;
use Data::Dumper;

my %hash;

while(<>){
  my ($key,$val) = /^(\w+)\s*=\s*(\w+)$/i;
  $hash{$key} = $val;
}

print Dumper(\%hash);
