# Lab 3: Trimming Sequencing Data

In this assignment, you will use trim your fastq files to remove potential adapter sequence contamination and other quality issues.  

## 1. Trim your data 

1. You may use either cutadapt or trimmomatic (or another tool if you wish). I will not specify which you should use. As scientists we regularly have to make decisions and empirically test methods.  
2. Using the results from fastqc, identify potential issues with data quality in your samples.
3. Write a job script that will __both__ trim your fastq files and then run fastqc on the trimmed fastq files. You may name this job script whatever you want.
5. Run your job script by submitting it to the queue system. 
6. Copy the fastqc html output files for the trimmed data and put these in your github directory in the directory PLB812/lab_assignments/assignment3.
7. Copy your script job script into PLB812/lab_assignments/assignment3.

## 2. Methods  

1. __Briefly__ describe the methods you used to download and convert the files for sections #1 in a text file named "methods.txt". Be sure to explain what arguments you used in trimming your data and why you chose those. For instance, if you trim for base quality, what cutoffs did you use and why did you chose them.
2. Place methods.txt in PLB812/lab_assignments/assignment3  
3. Push your PLB812 repository to github.

