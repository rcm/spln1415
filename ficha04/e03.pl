# Escreva um programa que reformate as datas do formato DD/MM/YYYY para MM/DD/YYYY no
# seguinte texto
# Zaphod, Beeble, 23/12/1994
# Dent, Arthur, 05/04/1993
# Feynman, Richard, 18/02/1956

while(<DATA>){
  s^(\d{2})/(\d{2})/(\d{4})^\2/\1/\3^g;
  print;
}

__DATA__
Zaphod, Beeble, 23/12/1994
Dent, Arthur, 05/04/1993
Feynman, Richard, 18/02/1956
