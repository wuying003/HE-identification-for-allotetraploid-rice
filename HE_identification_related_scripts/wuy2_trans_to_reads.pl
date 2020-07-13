#!/perl -w
open(SNP,$ARGV[0])|| die $!;
while(<SNP>){
	if(/no/){$reads="0\t0"}
	else{
		$reads="$1\t$2" if /\d\/\d:(\d+),(\d+):/;
		
		}
	@a=split(/\s+/,$_,6);
	print "$a[0]\t$a[1]\t$a[2]\t$a[3]\t$a[4]\t$reads\n";
	}
