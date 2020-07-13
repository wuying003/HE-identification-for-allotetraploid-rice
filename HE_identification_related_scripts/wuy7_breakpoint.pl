#!/perl -w

open(R,"$ARGV[0]");
while(<R>){
	@a=split(/\s+/,$_,2);
	$ch{$a[0]}=1;
	
	}
close(R);$la=0; $n=0;
foreach(sort keys %ch){
	$ch=$_;
open(R,"$ARGV[0]");
$tmp=-1; 
while(<R>){
	chomp;
	@a=split;
	next if($a[0] ne $ch);
	if($tmp ne $a[-1]){
		$tmp=$a[-1];
		
		print "$la\n" if $n ne 0;
		print "$_\t";
		$n=1;
		}
	else{
		$la=$_;
		
		}
	
	}
	
	close(R);
}