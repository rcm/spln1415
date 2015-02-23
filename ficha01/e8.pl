while(<>) {
	chomp;
	@nomes = split;
	$t = scalar(@nomes) - 2;
	$prim = $nomes[0];
	@meio = @nomes[1..$t];
	$ult = $nomes[-1];
	for $p (@meio) {
		$l = substr $p, 0, 1;
		$p =~ s/$p/$l./;
	}
	print "$prim @meio $ult\n";
}
