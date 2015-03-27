# Fa¸ca um programa para extrair endere¸cos de email de um texto. a.b@c.d and a@b.com s˜ao
# endere¸cos v´alidos mas a.com, a@b e @b.com n˜ao s˜ao.

use strict;
use Data::Dumper;

while(<>){
  my @mat = m/\s([\w\.\+]+\@[\w\.]+\.[\w]+)\s/ig;
  print "$_\n" for @mat;
}
