
#go through each directory
for dir in `ls -d *.GseaPreranked.*`; do
	cd $dir
	NAME1=`echo $dir | cut -d'.' -f1 | cut -d '_' -f1`
	NAME2=`echo $dir | cut -d'.' -f1 | cut -d '_' -f2`
	NAME=${NAME1}_${NAME2}
	#append the name to the sea results file
	for file in `ls gsea_report*.xls`; do		
		awk -v name="${NAME}" '{print name"\t", $0}' $file > ${file}_forR
		#remove the first line
		tail +2 ${file}_forR > temp.txt
		mv temp.txt ${file}_forR
	done
	mv *_forR ../
	cd ..
done

#merge all results into one file
cat *_forR > Gsea_reports_alltissues.txt

rm *_forR
