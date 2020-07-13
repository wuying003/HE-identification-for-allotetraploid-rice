#Objects: get the SNP types for tetraploidy
#Input: data from perl(number for two alleles)
#Output: SNP type (0, 1, 2, 3, 4)
#Author:Yao Zhou
#Last update: 10/28/2015
rm(list=ls())
setwd("C:\\Users\\Administrator\\Desktop\\ZhangBQ re-seq\\GATK_files\\all_files\\read_files\\5k_files\\for_R")
GDP=NULL
path="C:\\Users\\Administrator\\Desktop\\ZhangBQ re-seq\\GATK_files\\all_files\\read_files\\5k_files\\for_R"
char = dir(path)
char=as.data.frame(char)
m=nrow(char)
for (i in 1:m){
	filename=paste("C:\\Users\\Administrator\\Desktop\\ZhangBQ re-seq\\GATK_files\\all_files\\read_files\\5k_files\\for_R\\",char[i,],sep="")
	allSNP=read.table(filename,head=F)
	m=nrow(allSNP)
	allSNP[,4:5]=sapply(allSNP[,4:5],as.numeric)
	bitestresult= apply(allSNP[,4:5],1,function(x){
		bitest=matrix(0,1,5)
		if((x[1]+x[2])==0){#
			bitest[5]=1
		}else if (x[1]==0){
			bitest[1]=1
		}else{
			bitest[1]=binom.test(x[1],(x[1]+x[2]),p=0.0001)$p.value
			bitest[2]=binom.test(x[1],(x[1]+x[2]),p=0.25)$p.value
			bitest[3]=binom.test(x[1],(x[1]+x[2]),p=0.50)$p.value
			bitest[4]=binom.test(x[1],(x[1]+x[2]),p=0.75)$p.value
			bitest[5]=binom.test(x[1],(x[1]+x[2]),p=0.9999)$p.value
		}
		result=bitest
	})
	SNPs=apply(bitestresult,2,function(x){
		#0,1,2,3,4
		result=as.numeric(which(x==max(x))-1)
	})
    SNPs=t(as.data.frame(SNPs))
    GDP=cbind(allSNP,SNPs[,1])
    write.table(GDP,as.character(char[i,]),row.names=F,col.names=F,quote=F,sep="\t")
}
