#!/perl -w #xutong wang 2018.11.25
$file1=$ARGV[0];
$file2=$ARGV[1];
open(R,"$file1");
while(<R>){
	chomp;next if/^#/;
	@a=split;
 
	
$id{"$a[0]\t$a[1]"}=1
}

open(R,"$file2");
while(<R>){
	 
	 
	print  if /#chrom/i;
	next if/^#/;
	@a=split;
print if $id{"$a[0]\t$a[1]"};
}