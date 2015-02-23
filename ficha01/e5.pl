$str = "linguagem";

while(<>) {
	$a++ if /$str/;
}

print "$a\n";
