while(<>) {
	chomp; # come whitespace  no fim da string
	for($i = length; $i; $i--) {
		print substr$_, $i - 1, 1;
	}
	print "\n";
}
