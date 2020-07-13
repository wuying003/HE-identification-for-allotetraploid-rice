#!/perl -w
open(R,"merge_all.txt");
open(W,">tmp.txt");
while(<R>){
	chomp;
	@a=split;
	print W "$a[0]\t$a[1]\t$a[1]\n";

}
close(W);
system("bedtools intersect -a rice_500K.bed -b tmp.txt -wa -wb >merge_all_50k.txt");
open(R,"merge_all_50k.txt");
while(<R>){
	chomp;
	@a=split;
	$id{"$a[0]\t$a[1]\t$a[2]"}++;
}
foreach(sort keys %id){
	print "$_\t$id{$_}\n";
}