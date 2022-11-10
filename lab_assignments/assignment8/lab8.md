# Lab 8: Calling Genetic Variants with GATK

In this assignment, you will mark duplicate reads and then call genetic variants using GATK

## 1. Mark Duplicates

1. Using Picard Mark Duplicates (https://gatk.broadinstitute.org/hc/en-us/articles/360037052812-MarkDuplicates-Picard-) create a new bam file from your alignment with the duplicate reads marked.  
2. 

## 2. Add Read Groups  

1. GATK requires what are called "read groups", if these were not added during the alignment step, then we need to add them now. We can do this using the Picard AddOrReplaceReadGroups command (
2.  java -jar picard.jar AddOrReplaceReadGroups \
       I=input.bam \
       O=output.bam \
       RGID=4 \
       RGLB=lib1 \
       RGPL=ILLUMINA \
       RGPU=unit1 \
       RGSM=20

## 2. Call Variants with GATK

1. Call 

## 3. Methods  

1. __Briefly__ describe your methods in a file called. "methods.txt". Be sure to explain what arguments you used and why you chose those. Describe how many GO terms you found enriched for each gene list and category.  
2. Place methods.txt in PLB812/lab_assignments/assignment5.  
3. Push your PLB812 repository to github.  
