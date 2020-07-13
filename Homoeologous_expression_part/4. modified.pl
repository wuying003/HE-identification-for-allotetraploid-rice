#!/perl -w

#by xutong wang 12/01/2018
$file1= $ARGV[0]; # SNP_annotation file
$file2= $ARGV[1]; # VCF file
$depth_cutoff=$ARGV[2];
open(R,"$file1");
while(<R>){

	chomp;
	@a=split;
	$id{"$a[0]\t$a[1]"}=$a[6];
	$gene{$a[6]}=1;
}
open(R,"$file2");
while(<R>){
  chomp;
   next if !(/^Chr/);
  @a=split;

#Chr1	193932	.	G	.	66	.	DP=3;MQ0F=0;AN=2;DP4=2,0,0,0;MQ=20	GT:DP:AD	0/0:2:2
   
  next if !($id{"$a[0]\t$a[1]"});
   
  
 
  	$info1{$id{"$a[0]\t$a[1]"}}+=$a[-2];
  
  	$info2{$id{"$a[0]\t$a[1]"}}+=$a[-1];
    $count{$id{"$a[0]\t$a[1]"}}++;
 
}
print "gene\tSNP_count\tref\taln\n";
foreach(sort keys %gene){
if(!($count{$_})){
  # print "$_\t0\t0\t0\n";

}
else{  print "$_\t$count{$_}\t$info1{$_}\t$info2{$_}\n"}
}
