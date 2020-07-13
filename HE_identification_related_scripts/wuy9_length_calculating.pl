#/perl-w
print "chrom\tstart\tend\ttype\tlongth\n";
while(<>){chomp;
@a=split/\s+/;
@b=$a[2]-$a[1];
print"$a[0]\t$a[1]\t$a[2]\t$a[3]\t$b[0]\n";}
