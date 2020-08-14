# HE-identification-for-allotetraploid-rice

The scripts related to this project can be devided into four independent folders with specific aims.

For Folder 1, Euploid_identification_scripts, there are two scripts, "peak-include-reads.pl" is a perl script for counting the reads number located in each 100kb window, and for running this script, 
a file in bed format with the window start and end positions is needed. And "aneu_cjeck.R" is a R script for drawing scatter diagrams with the output file of "peak-include-reads.pl" as input file 
in csv format.

For Folder 2, HE_identification_related_scripts, there are 13 scripts, and the order of them is listed as "wuyX" (from "wuy1_" to "wuy13_". For the "wuy1_select_same.pl" script, the input file is SNP 
list file in vcf from GATK program, and a reliable SNP list between parental lines (NPB and 93-11 in our study) in TXT format is required. Then the input file for each following script is the output file
from the previous script. In addtion, for "wuy5_sort.pl" script, it can handle multiple files at one time, just put all files need to be handled in the same folder. And for "wuy6_filted_wrong_state_multiple
_rounds.pl" script, it needs to be performed multiple times until the row number of the file does not decrease any more.

For Folder 3, HEs_count_in_each_500kb, there are two scripts, first we need to use "merge.R" to merge HE lists for all samples, then use "stat_50k_breakpoints.pl" to count the breakpoint number in each
50kb window.

For Folder 4, Homoeologous_expression_part, there are four perl scripts, and their order is from "1" to "4". The input file for "1. overlap.pl" is SNP list file in vcf format from bcftools program, a reliable 
SNP list between parental lines (NPB and 93-11 in our study) in TXT format is required, and the output file will be the specific transcriptional SNP list between parental lines (NPB and 93-11 in our study)
for each sample. Then the input file for each following script is the output file from the previous script.