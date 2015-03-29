# Escreva um programa que seja um filtro que remove linhas duplicadas de um conjunto de
# ficheiros (i.e., ele imprime todas as linhas dos ficheiros sem duplicados)

use strict;

my %uniq;

while(<>){
  print unless $uniq{$_};
  $uniq{$_} = 1;
}
