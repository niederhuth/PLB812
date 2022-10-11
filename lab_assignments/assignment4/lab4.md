# Lab 4: Aligning RNA-seq data

In this assignment, you will align your RNA-seq Data. You can choose whichever aligner you want. Keep in mind that you need to align RNA-seq data and therefore should use a splice aware aligner. For the purpose of the class, I want you to use a genome alignment method rather than a pseudoalignment method. That means you should probably use HISAT2 or STAR.  

## 1. Build the index  

1. Build a genome index for your specific aligner. For RNA-seq data, this should include the gene annotations as an input.  
2. Take a screenshot of the index files.  
3. Place the screenshot in PLB812/lab_assignments/assignment4.    

## 1. Align your samples

1. Align the data using your chosen aligner to produce a __bam__ file for each sample. How you do this will depend on whether it is single-end or paired-end and whether you used HISAT2 or STAR or some other method.   
2. Record the total number & percentage of reads/read pairs and number & percentag of uniquely aligned reads/read_pairs for each sample in a table named "alignment_stats" (this can be an excel sheet, csv, or tsv file). Call this filePlace this table in PLB812/lab_assignments/assignment4.  

## 2. Methods  

1. __Briefly__ describe your methods in a file called. "methods.txt". Be sure to explain what arguments you used and why you chose those. 
2. Place methods.txt in PLB812/lab_assignments/assignment4.  
3. Push your PLB812 repository to github.  

