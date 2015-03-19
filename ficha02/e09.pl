# Escreva um programa que seja um filtro que remove linhas duplicadas de um conjunto de
# ficheiros (i.e., ele imprime todas as linhas dos ficheiros sem duplicados)

use strict;

my @linhas;

while(my $linha = <>){
  push @linhas,$linha unless (grep {$_ eq $linha} @linhas)
}

print @linhas
