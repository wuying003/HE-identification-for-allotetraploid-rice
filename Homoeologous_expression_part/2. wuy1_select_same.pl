#!/perl

####Usage:perl select_samexxx.pl 9311.snp.list polyploid.snp > poly_merge_9311.snp         select snps which were same as 9311####

open(R,$ARGV[0]);
while(<R>){
	chomp;
	if (/^#/){ next;} 
	@a=split;
	$loc{$a[0]."\t".$a[1]}=$a[4]
	}
	close(R);
open(R,$ARGV[1]);
while(<R>){
	 if (/^#/){ next;}
	@a=split;
	print  if $loc{$a[0]."\t".$a[1]} eq $a[4];
	$B{$a[0]."\t".$a[1]}=1;
	}
	close(R);
open(R,$ARGV[0]);
while(<R>){
	chomp;
	if (/^#/){ next;}
	@a=split;
	next  if $B{$a[0]."\t".$a[1]};
	print "$a[0]\t$a[1]\t$a[2]\t$a[3]\t$a[4]\tno\n"
	}
	close(R);	
