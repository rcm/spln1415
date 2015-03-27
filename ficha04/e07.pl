# Escreva uma script que leia ficheiros BibTEX e que produza uma estrutura de dados com os
# dados correspondentes aos artigos. Por exemplo, para o texto:

use strict;
use Data::Dumper;

# isto altera o terminador de linha do perl para ser }\n em vez de \n
# local $/ = "}\n";

my ($key,%bib,$val,$inside);

while(<>){
  chomp;
  if(m/@\w+\{(.*?),/i){
    $inside = {};
    $bib{$1} = $inside;
  }elsif(($key,$val) = m/^\s*['"`´’]?(\w+)['"`´’]?\s*=\s*['"`´’\{]?(.+?)['"`´’\}]?,?\s*$/i){
    $inside->{$key} = $val;
  }
}

print Dumper(\%bib);

__DATA__

----input example----

@article{AscRuuSpi97,
  title = {Implicit-explicit Runge-Kutta methods for time-dependent partial differential equations},
  author = {Ascher and Ruuth and Spiteri},
  journal = "Applied Numerical Mathematics",
  volume = "25",
  year = "1997",
  pages = "151--167"
}
@article{storn:de-article,
  author = "R. Storn and K. Price",
  title = "Differential Evolution - A Simple and Efficient Heuristic for Global Optimization over Continuous Spaces",
  journal = {Journal of Global Optimization},
  volume = {11},
  pages = {341-359},
  year = {1997}
}
@techreport{storn:de-techreport,
  author = "R. Storn and K. Price",
  title = "Differential Evolution - A Simple and Efficient Adaptive Scheme for Global Optimization over Continuous Space",
  institution = "The International Computer Science Institute",
  year = "1995"
}
@InProceedings{storn:usage,
  author = "R. Storn",
  title = "On the Usage of Differential Evolution for Function Optimization",
  booktitle = "1996 Biennial Conference of the North American Fuzzy Information Processing Society (NAFIPS 1996)",
  pages = "519-523",
  publisher = "IEEE",
  year = "1996"
}

----output example----

$VAR1 = {
  ’storn:de-article’ => {
    ’volume’ => ’11’,
    ’title’ => ’Differential Evolution - A Simple and Efficient Heuristic for Global Optimization over Continuous Spaces’,
    ’author’ => ’R. Storn and K. Price’,
    ’type’ => ’article’,
    ’pages’ => ’341-359’,
    ’journal’ => ’Journal of Global Optimization’,
    ’key’ => ’storn:de-article’
  },
  ’AscRuuSpi97’ => {
    ’volume’ => ’25’,
    ’author’ => ’Ascher and Ruuth and Spiteri’,
    ’title’ => ’Implicit-explicit Runge-Kutta methods for time-dependent partial differential equations’,
    ’type’ => ’article’,
    ’year’ => ’1997’,
    ’journal’ => ’Applied Numerical Mathematics’,
    ’key’ => ’AscRuuSpi97’
  },
  ’storn:usage’ => {
    ’booktitle’ => ’1996 Biennial Conference of the North American Fuzzy Information Processing Society (NAFIPS 1996)’,
    ’title’ => ’On the Usage of Differential Evolution for Function Optimization’,
    ’author’ => ’R. Storn’,
    ’type’ => ’inproceedings’,
    ’publisher’ => ’IEEE’,
    ’pages’ => ’519-523’,
    ’key’ => ’storn:usage’
  },
  ’storn:de-techreport’ => {
    ’title’ => ’Differential Evolution - A Simple and Efficient Adaptive Scheme for Global Optimization over Continuous Space’,
    ’author’ => ’R. Storn and K. Price’,
    ’type’ => ’techreport’,
    ’institution’ => ’The International Computer Science Institute’,
    ’key’ => ’storn:de-techreport’
  }
};
