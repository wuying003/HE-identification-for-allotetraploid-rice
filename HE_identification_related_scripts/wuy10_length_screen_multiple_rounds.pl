#!/perl -w
#designed by Xutong wang; edited in 2015.11.17
$file="$ARGV[0]";
 
open(R,"$file");
while(<R>){

		next if !(/Chr\d/);
 
	@a=split(/\s+/,$_,2);
	$ch{$a[0]}=1;
	
	}
	close(R);
foreach(sort keys %ch){

	$ch=$_;%note=();  
	 
open(R,"$file");
$n=1;$init=0;
while(<R>){
	chomp;
	@a=split;
	next if($a[0] ne $ch);
	if($a[4]<200000 and $init==0){
		$init=$n; 
		}
	if($a[4]<200000){$mark{$n}=0;
		$teminal=$n;
		}
    
  $mark{$n}=1 if $a[4]>=200000;
	$note{$n}=$a[3];
	$len{$n}=$a[4]; 
	$n++;
	}
close(R);
$all=$n-1;
  
open(R,"$file");
$n=1;
while(<R>){
	chomp;
	@a=split;
	next if($a[0] ne $ch);
	 $info=$1 if /(\w.*\w)/;
	 
	 
	  
  if($a[4]<200000){
  	$check=$n;$raw=$n;
  	%type=();$start=$init;$end=$teminal;
  	 
  	$type{$note{$check}}=$len{$check};
   
  	while($check--){  if($check <=0 ){last;}
  		 if($mark{$check} eq "0"){      
  		               $type{$note{$check}}=$len{$check} if !($type{$note{$check}});
 		                 $type{$note{$check}}+=$len{$check} if ($type{$note{$check}});
 		                  }
  		if($mark{$check} eq "1"){$start=$check;last}
  		 }
  		$check=$n;
  	while($check++){  if($check >=$all){last;}
  		if($mark{$check} eq "0"){       
  		               $type{$note{$check}}=$len{$check} if !($type{$note{$check}});
 		                 $type{$note{$check}}+=$len{$check} if ($type{$note{$check}});
 		                }
  		if($mark{$check} eq "1"){ $end=$check;last}
  		}
  	 
  	if($note{$start} eq $note{$end}){
  	  $n++;	 next;
  		}
  		
  
  if($note{$start} ne $note{$end}){
  
    	$line=$end-$start if($start==$init and $mark{$init} eq "0") or ($end==$teminal and $mark{$teminal} eq "0");
    	$line=$end-$start-1 if!(($start==$init and $mark{$init} eq "0") or ($end==$teminal and $mark{$teminal} eq "0"));
    	if($line>=3){
 		 	foreach(sort {$type{$b} <=> $type{$a}} keys %type){
 		 		$most=$_;   
 		 		 		 		last;
 		 		}
    	 
     print "$info\t0\t$most\n"; 
     $note{$raw}=$most;
    }
      if($line<=2){
      	print "$info\t0\t$a[3]\n"; 
  	                 }
                 }
  	
  	}
	print "$info\t1\t$a[3]\n"	if  $a[4]>=200000;
	
	 
   $n++;}
    close(R);
  }
 ##########################################################
 
	