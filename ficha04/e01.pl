# Escreva um programa (usando o operador de substitui¸c˜ao) que leia uma frase e para cada
# palavra coloque s´o a inicial seguida de um ponto, isto ´e, para a frase viva o perl o programa
# imprima v. o. p.

while(<>){
  s/(\w)\w*/\1./ig;
  print;
}
