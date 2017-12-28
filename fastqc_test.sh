#!/bin/bash

cd ~/Desktop/Test_Fastq/

for file in $(ls *.fastq)
do
  echo "My file name is $file"
done

echo "Running fastqc....."
fastqc *.fastq

echo "Saving FastQc Results....."
mv *.zip ~/Desktop/Test_Fastq/FastQC_Results_Zip/
mv *.html ~/Desktop/Test_Fastq/FastQC_Results_HTML/

cd ~/Desktop/Test_Fastq/FastQC_Results_Zip/

echo "Unzipping......"
for zip in *.zip
do 
	unzip $zip
done


cd ~/Desktop/Test_Fastq/

#In my case cutadapt is located in "mypython2" environment via bioconda, so the next step is valid for me.
source activate mypython2

echo "Trimming"
for file in in $(ls *.fastq)
do
	cutadapt -u -5 -o trimmed$file.fastq $file
#	cutadapt -u (options) -o OutputFastqFile InputFastqFile
done


	


