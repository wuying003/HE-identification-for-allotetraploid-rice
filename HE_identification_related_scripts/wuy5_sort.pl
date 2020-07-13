# sort all files in one directory;
#design by xutong wang; 2015.11.4
#!/perl -w
@file=glob("*.txt");
foreach(sort @file){
	$output="$1.sort.txt" if /(.*).txt/;
	system("sort -k1,1 -k2,2n $_ > $output")
	
	}
