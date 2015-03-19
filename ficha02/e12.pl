# Escreva um programa que leia um texto e imprima cada palavra e o número de vezes que aparece no texto.
# As palavras devem estar ordenadas por ordem decrescente de frequência e dentro da mesma frequência,
# por ordem alfabética. Todos os símbolos que não sejam letras devem ser descartados.

# Para cada palavra do texto, o seu programa deve imprimir a palavra,
# seguida de um tab, da frequência e de um \n

use strict;

use Data::Dumper;

my %ps;

while(<>){
  chomp;
  s/[^a-z]+/ /gi;
  y/A-Z/a-z/;
  $ps{$_}++ for(split);
}

my @chaves = sort {$ps{$b} <=> $ps{$a} or $a cmp $b} keys %ps;

#print Dumper(\@a);

print "$_\t$ps{$_}\n" for(@chaves);
