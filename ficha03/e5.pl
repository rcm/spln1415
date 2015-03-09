# Fa¸ca uma fun¸c˜ao chamada dump que recebe uma referˆencia e imprime o seu conte´udo de uma
# forma semelhante ao m´odulo Data::Dumper; alternativamente, a sua fun¸c˜ao pode gerar html
# (ou LATEX).

use strict;
use Data::Dumper;

sub indent {
  my ($count, $i) = (0,0);

  until( ((caller($i))[3]) eq '' ){
    if( ((caller($i))[3]) eq 'main::dumpa' ){
      $count++;
    }
    $i++;
  }

  $count-- if ((caller(3))[3]) eq 'main::dumpRef';

  return "      " . "   "x($count+%_{extra});
}

sub dumpa {
  my ($ref) = @_;
  #print "Dumper: ", Dumper($ref), "\n\n-------\n\n";

  my %swi = ( 'SCALAR' => \&dumpScalar
            , 'ARRAY'  => \&dumpArray
            , 'HASH'   => \&dumpHash
            , 'REF'    => \&dumpRef
            , ''       => \&dumpNonref
            );
  
  unless( ((caller(2))[3]) eq 'main::dumpa' ){
    "\$DUMPA = " . $swi{ref $ref}($ref) . ";\n";
  }else{
    $swi{ref $ref}($ref);
  }
}

sub dumpRef {
  my ($ref) = @_;
  "\\" . dumpa($$ref)
}

sub dumpArray {
  my ($ref) = @_;
  my $str = "[\n";
  $str .= indent(extra => 1) . "  " . dumpa($_) . ",\n" for(@$ref);
  $str =~ s/,\n$/\n/;
  $str .= indent() . "]";
  $str
}

sub dumpHash {
  my ($ref) = @_;
  keys %$ref; # reset the internal iterator so a prior each() doesn't affect the loop

  my $str = "{\n";

  while(my($k, $v) = each %$ref) {
    $str .= indent(extra => 1) . "  " . dumpa($k) . " => " . dumpa($v) . ",\n";
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


################################################
# exemplo que funciona como o Dumper

sub ex1 {
  my $ola = {ola => \'yes!', 'ole' => \[2,\60]};

  print Dumper($ola);
  print "\n\n-------\n\n";
  print dumpa($ola);
}
ex1;


################################################
# exemplo com referência cíclica (não funciona)
# 
sub ex2 {
  my $ola;
  my $ole = [3, \$ola];
  $ola = $ole;

  print Dumper($ola);
  print "\n\n-------\n\n";
  print dumpa($ola);
}
# ex2;
