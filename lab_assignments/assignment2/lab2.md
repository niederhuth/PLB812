# Lab 2: Sequence Quality Control

In this assignment, you will use fastqc to assess the quality of your assigned RNA-seq fastq files. You will also write a job script to implement fastqc that can be used on the HPCC.  

## 1. fastqc 

1. Install fastqc.  
2. Write a shell script named __run_fastqc.sh__ that has all the header lines necessary to submit and run a job on the HPCC.  
3. In this shell script, put in the necessary code to cd to the correct working directory and point the PATH and LD_LIBRARY_PATH variables to the correct conda environment where fastqc is installed.  
4. In this shell script, include the code necessary to run fastqc on your downloaded fastq datasets.  
5. Run your fastqc shell script by submitting it to the queue system using sbatch: __sbatch run_fastqc.sh__  
6. Copy the html output files from fastqc and put these in your github directory in the directory PLB812/lab_assignments/assignment2.
7. Copy your script __run_fastqc.sh__ into PLB812/lab_assignments/assignment2.

## 2. Methods  

1. __Briefly__ describe the methods you used to download and convert the files for sections #1 in a text file named "methods.txt". 
2. Place methods.txt in PLB812/lab_assignments/assignment2  
3. Push your PLB812 repository to github.

