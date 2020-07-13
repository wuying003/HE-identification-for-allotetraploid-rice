#!/perl -w
#designed by Xutong wang; edited in 2015.11.19
$file="$ARGV[0]";
 
open(R,"$file");
while(<R>){
		next if !(/Chr\d/);
 
	@a=split(/\s+/,$_,2);
	$ch{$a[0]}=1;
	
	}
	close(R);
foreach(sort keys %ch){
	$ch=$_; 
open(R,"$file");
$init=8;$n=0;
while(<R>){
	chomp;
	@a=split;
	next if($a[0] ne $ch);
	#Chr1	10799001	12471000	0
	if($init eq $a[3]){$count=1;$info=$info1."\t$a[2]\t$a[3]"}
	if($init ne $a[3]){ if($n ne 0){print "$info\n" if $count==1;
		                               
		                              print "$info2\n" if $count==0;}
		               $init=$a[3];$info1="$a[0]\t$a[1]";$info2=$_; $count=0;$n=1;}
	}
  close(R);
                   if($n ne 0){print "$info\n" if $count==1;
		                               
		                              print "$info2\n" if $count==0;}
		               $init=$a[3];$info1="$a[0]\t$a[1]";$info2=$_; $count=0;$n=1;
    
  }
 ##########################################################
 
	