#!/perl -w
# editor by xutong wang edited in 2015.11.19
#usage:perl wu.pl inputfile >output_file
open(R,"5k.txt");
while(<R>){
	chomp;
	 @a=split;
		$ln{$a[0]}=1 if $a[0]=~/Chr/;
		 
		}
			close(R);


foreach(sort keys %ln){
	$scaff=$_; $k=1;%infor=();%utr_s=();%utr_e=();%s=();%info=();
	
open(R1,"5k.txt");
while(<R1>){
	chomp;
	@a=split;
	if($a[0] ne $scaff){next;}
	 
	$utr_s{$k}=$a[1]; 
  $utr_e{$k}=$a[2]; 
  $info{$k}=$_;
  
	$k++;
	}


  $id=$1 if $ARGV[0]=~/(\d+)\.last.txt/;
  print "Chr\tStart\tEnd\tNA\tNA\tNA\tW$id\n";
  open(R2,"$ARGV[0]");
  	while(<R2>){
		chomp;
		next if /start/;
	
		@dh=split;
	if($dh[0] ne $scaff){next;}
	$s{$dh[1]}=$dh[2];
	$infor{$dh[1]}=$_;
	 
	}
	close(R2); 
	
	
   $m=$k-1;
   $n=1;	
   foreach(sort {$a<=>$b} keys %s){  
 
   
   
   	#if($s{$_}<$utr_s{$n}){next;}
   	while($_>$utr_e{$n}){ 
  
 
   	 	print "$info{$n}\tNA\tNA\tNA\tNA\n";
   	$n++;}
   
   		while($_<=$utr_e{$n} and $utr_s{$n}<=$s{$_}){
   			print "$info{$n}\t$infor{$_}\n";
   			$n++;
   			}
   		  
   		  
      
       
 	 
    }
    while($n<=$m){
    	print "$info{$n}\tNA\tNA\tNA\tNA\n";
    	$n++;
    	} 
}  ######################### ##############################
	