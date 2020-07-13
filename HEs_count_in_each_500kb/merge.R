

# Read GD data
for(i in 1:202){
	GDname=paste(i,".txt",sep="")
	if(i==1){
		myGD=read.table(GDname,head=F)
	}else{
		GD=read.table(GDname,head=F)
		myGD=rbind(myGD,GD)
	}
}

dim(myGD)

write.table(myGD,"merge_all.txt",sep="\t",quote=F,row.names=F)