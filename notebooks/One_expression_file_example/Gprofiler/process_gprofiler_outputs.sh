
#go through each gprofiler file
for file in `ls *_gprofiler_results.txt`; do
        
        NAME1=`echo $file | cut -d'_' -f1 `
        NAME2=`echo $file | cut -d'_' -f2 `
        NAME=${NAME1}_${NAME2}
        #append the name to the gprofiler results file		
        awk -v name="${NAME}" '{print name"\t", $0}' $file > ${file}_forR
        #remove the first line
        tail +2 ${file}_forR > temp.txt
        mv temp.txt ${file}_forR
        
done

#merge all results into one file
cat *_forR > gprofiler_reports_alltissues.txt
rm *_forR
