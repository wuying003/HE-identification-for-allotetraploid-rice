#!/perl -w
#designed by Xutong wang; edited in 2015.11.14
$file="$ARGV[0]";
open(R,"$file");
while(<R>){
	@a=split(/\s+/,$_,2);
	$ch{$a[0]}=1;
	
	}
close(R);
foreach(sort keys %ch){
	$ch=$_;%note=();
open(R,"$file");
$n=0;
while(<R>){
	chomp;
	@a=split;
	next if($a[0] ne $ch);
	$note{$n}=$a[-1];
	$n++;
	}
close(R);
$all=$n-1;

open(R,"$file");
$n=0;
while(<R>){
	chomp;
	@a=split;
	next if($a[0] ne $ch);
	 $info=$_;
	 $i=$n-5;$check=0;
while($i<$n+5){
	if (!(exists $note{$i})){$i++;next;}
	last if $i>$all; 
	
	$check++	if $note{$i} == $a[-1];
  #print "$info\t$note{$i}\t$a[-1]\t$check\n";
	$i++;
	}	 
	 
	 print "$info\n" if $check >=5;
	 
	$n++;
	}
	
		close(R);
	
	
}