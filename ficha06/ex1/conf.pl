use warnings;

sub configuracao{
    my ($table, $file) = @_;
    $table->{INCLUDE} //= \&configuracao;
    $table->{DEFINE} //= \&definirNovoConceito;

    open my $fh, $file or die "$!";
    while(<$fh>){
		chomp;
		next if(/^\s*$/);
        my ($dir, $resto) = split /\s+/,$_, 2;
        if(exists $table->{$dir}){
            $table->{$dir}($resto, $table);        
        }else {
            my $chave;
		    if(exists($table->{recuperar}) && ($chave = $table->{recuperar}($dir, $table))){
				$table->{$chave}($resto, $table);
		    }else{
		        die "chave $dir não existe";            
		    }        
        }
    }
}

sub definirNovoConceito{
    my ($resto, $tabela) = @_;
    my ($dir, $args) = split /\s+/,$resto, 2;
    $tabela->{$dir} = eval " sub {$args} ";
	printf("%s\n%s\n%s\n", $dir, $args, $@) if $@;
	undef $@;
}

# Sub que procura todas as entradas na table que começam com $keyword
sub tenta_recuperar {
	my ($keyword, $table) = @_;
	my @possib = grep {$_ =~ /^$keyword/} keys %$table;
	return $possib[0] if @possib == 1;
	print "There are several alternatives: @possib\n" if @possib;
	return;
}
configuracao({recuperar => \&tenta_recuperar}, "config.txt");
