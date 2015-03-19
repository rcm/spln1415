while(<>) {
	print unless exists $linha{$_};
	$linha{$_}++;
}
