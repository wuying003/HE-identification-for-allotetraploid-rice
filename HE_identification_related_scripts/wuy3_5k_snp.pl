#!/perl-w
#@SQ	SN:scaffold_950	LN:5583
##length
 
open(R,"5k.txt");
while(<R>){
	chomp;
	@a=split(/\s+/,$_,2);
 
		$scaffold{$a[0]}=1; }
			close(R);
######


$output=$1.".5k.txt" if $ARGV[1]=~/(.*).reads.txt/;

open(W,">$output");

foreach(sort keys %scaffold){
 
    	%ID={};
	%start={};
	%en={};
	%s={};
	$in=1;$scaff=$_;
	open(R1,"5k.txt");
	while(<R1>){
		chomp;
 $content=$1 if /(\w.*\w)/;
	
		@gff=split/\s+/,$content;
	if($gff[0] ne $scaff){next;}
	#$ID_name{$in}=$gff[2];
  $ID_info{$in}=$_; 
	#$ID{$in}=$gff[3];
	$start{$in}=$gff[1];
	$en{$in}=$gff[2];
	$in++	
		
	}
	close(R1);
open(R2,$ARGV[1]);
	while(<R2>){
	if(/contigs/){next;}
	chomp;
	@snp=split;
	if($snp[0] ne $scaff){
		next;}
	$s{$snp[1]}=$_;
	$nip{$snp[1]}=$snp[-2];
	$x9311{$snp[1]}=$snp[-1];	
   }
   close(R2);
   $m=$in-1;
   $n=1;
   foreach(sort {$a<=>$b} keys %s){
   	if($_>$en{$m}){last;}
   	if($_<$start{$n}){next;}
   	while($_>$en{$n}){
  
   $n++;	}
   if($_<=$en{$n} and $_>=$start{$n}){
 if($s{$_}){
 	#print W "$ID_info{$n}\t$s{$_}\n";\
 
 	$final{$ID_info{$n}}=1;
 	$final_nip{$ID_info{$n}}+=$nip{$_};
 	$final_x9311{$ID_info{$n}}+=$x9311{$_};
 	}
   		
   		
   		}
   		
   		
  }
  
 }

foreach(sort keys %final){
	print "$_\t$final_nip{$_}\t$final_x9311{$_}\n";
	
	}
