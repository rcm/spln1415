while(<>) {
	$l = substr $_, 0, 1;
	$l =~ y/a-z/A-Z/;
	substr($_, 0, 1) = $l;
	print;
}
