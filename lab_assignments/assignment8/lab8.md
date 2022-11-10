# Lab 8: Calling Genetic Variants with GATK

In this assignment, you will mark duplicate reads and then call genetic variants using GATK

## 1. Mark Duplicates

1. Using Picard Mark Duplicates (https://gatk.broadinstitute.org/hc/en-us/articles/360037052812-MarkDuplicates-Picard-) create a new bam file from your alignment with the duplicate reads marked.  
2. Print the first ten lines of the 'metrics' file from Mark Duplicates to your screen using __head marked_dup_metrics.txt__. This shows how many reads were marked as duplicates. Take a screenshot of this output and put in PLB812/lab_assignments/assignment8.  

## 2. Add Read Groups  

1. GATK requires what are called "read groups", if these were not added during the alignment step, then we need to add them now. We can do this using the Picard AddOrReplaceReadGroups command (https://gatk.broadinstitute.org/hc/en-us/articles/360037226472-AddOrReplaceReadGroups-Picard-):

```
java -jar picard.jar AddOrReplaceReadGroups I=input.bam \
       O=output.bam \
       RGID=1 \
       RGLB=lib1 \
       RGPL=ILLUMINA \
       RGPU=NA \
       RGSM=WS2
```

## 2. Call Variants with GATK

1. Use the haplotype caller to call variants using the Germline variant calling pipeline (https://gatk.broadinstitute.org/hc/en-us/articles/360037225632-HaplotypeCaller).  
2. Print the first 20 lines of the output vcf file to your screen using __head -20 input.vcf__ and take a screen shot.  
3. Place the screen shot in PLB812/lab_assignments/assignment8.

## 3. Methods  

1. __Briefly__ describe your methods in a file called. "methods.txt". Be sure to explain what arguments you used and why you chose those.  
2. Place methods.txt in PLB812/lab_assignments/assignment8.  
3. Push your PLB812 repository to github.  
