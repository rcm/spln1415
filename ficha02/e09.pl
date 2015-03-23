# Escreva um programa que seja um filtro que remove linhas duplicadas de um conjunto de
# ficheiros (i.e., ele imprime todas as linhas dos ficheiros sem duplicados)

use strict;

my @linhas;
my %uniq;

while(<>){
  $uniq{$_} = 1;
  push @linhas,$_;
}

foreach(@linhas){
  if($uniq{$_}){
    $uniq{$_}--;
    print $_;
  }
}
