use Entidades::Reconhecer;
use utf8::all;

my  $t = Entidades::Reconhecer->new();

$t->preposicao(qw(of));
$t->ignorar(qw{By});

while(<DATA>) {
	$t->reconhecer($_);
}

for my $e ($t->entidades()) {
	print "$e\n";
}

use Data::Dumper;
print Dumper($t);
__DATA__
By Michael Mubari, John Smith, Walt Disney
Hello earthlings!
