# Lab 7: Aligning Whole Genome Sequencing Data data

In this assignment, you will download, trim, and align WGS data

## 1. Download the data

1. If you haven't already, download the genome for Arabidopsis thaliana.  
2. Download SRA acession SRR492407 and convert to fastq. The link is here: https://www.ncbi.nlm.nih.gov/sra/SRX145037[accn]  

## 2. Trim your reads  

1. Assess the quality of your reads using FastQC.  
2. Trim the reads (you may any method you choose). __Importantly, I want you to trim the ends of the reads for low quality bases with a phred score < 25.__  
3. Reassess the quality of your reads using FastQC.  
4. Place the FastQC reports before and after trimming in PLB812/lab_assignments/assignment7.  

## 2. Align your reads using BWA  

1. In the next lab assignment, we will use GATK for variant calling. So we will use BWA for alignment. First index your genome using BWA.  
2. Align your reads using the __BWA mem__ command. Details can be found here: https://bio-bwa.sourceforge.net/bwa.shtml  
3. Convert the output to a sorted bam file using samtools sort (See: https://www.htslib.org/doc/samtools-sort.html). __Note:__ You can combine Steps #1 & #2 into a single step with the unix pipe'|' Details here: https://onestopdataanalysis.com/samtools-sort/  
4. Using samtools flagstat (See: https://www.htslib.org/doc/samtools-flagstat.html), output the mapping statistics as a file named 'mapping_statistics.flagstat'. Place this file in PLB812/lab_assignments/assignment7/mapping_statistics.flagstat  

## 3. Methods  

1. __Briefly__ describe your methods in a file called. "methods.txt". Be sure to explain what arguments you used and why you chose those.  
2. Place methods.txt in PLB812/lab_assignments/assignment7.  
3. Push your PLB812 repository to github.  

