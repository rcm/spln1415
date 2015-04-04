# Fa¸ca uma fun¸c˜ao que receba como parˆametro o nome de dois ficheiros (cada um contendo
# uma matriz) e imprima a matriz que resulta da multiplica¸c˜ao de ambas as matrizes (ou um
# erro caso n˜ao seja poss´ıvel;

use strict;
use Data::Dumper;

sub readMatrix {
  my ($filename,$m,$i) = (shift,[],0);
  open(my $in, "<", $filename)
    or die "cannot open < $filename: $!";

  #read
  while (<$in>) {
    s/[^0-9 \.]//;
    $m->[$i++] = [split];
  }

  #validate
  my $ncols = scalar @{$m->[0]};
  foreach my $c (@$m) {
    if ($ncols != (scalar @$c)){
      $ncols = -1;
      last;
    }
  }

  #results
  {
    'matrix' => $m,
    'cols' => $ncols,
    'rows' => $i,
    'valid' => ($ncols == -1) ? 0 : 1
  }
}

sub multiply {
  my ($m1,$m2) = @_;

  die "first matrix is invalid" unless($m1->{'valid'});
  die "second matrix is invalid" unless($m2->{'valid'});

  die "matrices are not multiplicable" unless ($m1->{'cols'} == $m2->{'rows'});

  my $m = [];

  # esquematização das variáveis usadas
  # A --->    C --->
  #    B         A  
  #    |         |  
  #    v         v  

  for (my $b = 0; $b < $m1->{'rows'}; $b++) {
    for (my $c = 0; $c < $m2->{'cols'}; $c++) {
      for (my $a = 0; $a < $m1->{'cols'}; $a++) {
        $m->[$b][$c] += $m1->{'matrix'}[$b][$a] * $m2->{'matrix'}[$a][$c];
      }
    }
  }
  
  $m;
}

sub printMatrix {
  my ($m) = @_;

  return 0 if scalar @$m == 0;

  my ($ls,$cs) = (scalar @$m, scalar @{$m->[0]});

  for (my $a = 0; $a < $ls; $a++) {
    for (my $b = 0; $b < $cs; $b++) {
      print $m->[$a][$b];
      print " " unless $b == ($cs-1);
    }
    print "\n";
  }
}

printMatrix(
  multiply(
    readMatrix($ARGV[0]),
    readMatrix($ARGV[1])
  )
);
