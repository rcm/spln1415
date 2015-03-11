# Fa¸ca uma fun¸c˜ao chamada dump que recebe uma referˆencia e imprime o seu conte´udo de uma
# forma semelhante ao m´odulo Data::Dumper; alternativamente, a sua fun¸c˜ao pode gerar html
# (ou LATEX).

use strict;
use Data::Dumper;

sub indent {
  my ($count, $i) = (0,0);

  my $extra = $_{extra} // 0;
  until( ((caller($i))[3]) eq '' ){
    if( ((caller($i))[3]) eq 'main::dumpa' ){
      $count++;
    }
    $i++;
  }

  $count-- if ((caller(3))[3]) eq 'main::dumpRef';

  return "     " . "   "x($count+$extra);
}

sub dumpa {
  my ($ref,$path,$seen) = @_;

  # caso seja uma referência
  unless(ref $ref eq ''){
    # verificar se a referência é conhecida
    $seen = {} unless defined $seen;
    $path = '$VAR1' unless defined $path;
    foreach my $key (keys %$seen){
      return $seen->{$key} if $key eq $ref;
    }

    # adicionar à lista de referências conhecidas
    $seen->{$ref} = $path;
  }

  my %swi = ( 'SCALAR' => \&dumpScalar
            , 'ARRAY'  => \&dumpArray
            , 'HASH'   => \&dumpHash
            , 'REF'    => \&dumpRef
            , ''       => \&dumpNonref
            );
  
  unless( ((caller(2))[3]) eq 'main::dumpa' ){
    "\$VAR1 = " . $swi{ref $ref}($ref,$path,$seen) . ";\n";
  }else{
    $swi{ref $ref}($ref,$path,$seen);
  }
}

sub dumpRef {
  my ($ref,$path,$seen) = @_;
  "\\" . dumpa($$ref,"\\" . $path,$seen)
}

sub dumpArray {
  my ($ref,$path,$seen) = @_;
  my $str = "[\n";

  for my $i (0 .. $#$ref) {
    $str .= indent(extra => 1) . "  " . dumpa($ref->[$i],$path."->[$i]",$seen) . ",\n";
  }

  $str =~ s/,\n$/\n/;
  $str .= indent() . "]";
  $str
}

sub dumpHash {
  my ($ref,$path,$seen) = @_;
  return '{}' unless %$ref;

  my $str = "{\n";
  foreach my $k (keys %$ref){
    $str .= indent(extra => 1) . "  " . dumpa($k,$path,$seen) . " => " . dumpa($ref->{$k},$path."->{$k}",$seen) . ",\n";
  }
  $str =~ s/,\n$/\n/;

  $str .= indent() . "}";
  $str
}

sub dumpScalar {
  my ($ref) = @_;
  
  if(${$ref} & ~${$ref}){
    "\\'${$ref}'"
  }else{
    "\\${$ref}"
  }
}

sub dumpNonref {
  my ($ref) = @_;
  if($ref & ~$ref){
    "'$ref'"
  }else{
    "$ref"
  }
}

sub exemplificar{
  my ($arg) = @_;

  print Dumper($arg);
  print "\n\n-------\n\n";
  print dumpa($arg);
}


################################################
# exemplo que funciona como o Dumper

sub ex1 {
  my $ola = {ola => \'yes!', 'ole' => \[2,\60]};
  exemplificar($ola)
}
#ex1;


################################################
# exemplo com referência cíclica que funciona
# como o Dumper

sub ex2 {
  my $ola;
  my $ole = [3, \$ola];
  $ola = $ole;

  exemplificar($ola)
}
#ex2;


################################################
# um exemplo que funciona quase como o Dumper
# a diferença está nas chaves das hash, que não
# são tratadas.

sub ex3 {
  my $ola = {ola => {zbr => \'yes!', foo => [1..5]}, 'ole' => [2,\60]};
  
  $ola->{'ole'}->[2] = $ola->{ola};

  exemplificar($ola)
}
ex3;

################################################
# um exemplo em que nenhum dos dois permite a
# posterior importação dos dados

sub ex4 {
  my $x = {};
  my $y = \{};
  $x->{$y} = $y;

  exemplificar({x=>$x,y=>$y})
}
#ex4;
