# Reescreva o programa que torna mai´uscula a primeira letra de todas as palavras de uma frase
# usando s´o uma substitui¸c˜ao (e sem usar a fun¸c˜ao ucfirst);

use utf8::all;

while(<>){
  s/(\w)(\w*)/(uc $1).$2/ige;
  print;
}
