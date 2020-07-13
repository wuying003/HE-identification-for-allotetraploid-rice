#!/perl -w 
# ÓÃ·¨£ºperl peak-include-reads.pl rice-window-100k.txt *.sort.bam > *.txt
open(FA,"$ARGV[0]");
$file=$ARGV[1];
while(<FA>){
chomp;
$con=$1 if /(\w.*\w)/;
@a=split(/\s/,$con);
$start=$a[1];$end=$a[2];
$info="$a[0]:$start-$end";

print"$con\t";system("samtools view -c $file $info");
#print"\n";
#system("samtools view -c nip-L-sort.urm.bam $info");
} 
close(FA);
