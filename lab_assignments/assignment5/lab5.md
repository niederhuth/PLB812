# Lab 5: Differential Gene Expression with DESeq2

In this assignment, you will run through the basic DESeq2 pipeline to identify differentially expressed genes.

## 1. Generate Read Counts  

1. For each sample determine whether it came from an unstranded, stranded-forward, or stranded-reverse library.  
2. Extract out a table of read counts for each gene for each sample. You may use either the STAR generated read counts or alternatively use htseq-count.  
3. Place the read count tables in a directory PLB812/lab_assignments/assignment5.  

## 2. Run the DESeq2 Pipeline  

1. Import your read counts into R and create a DESeq2 object as described in the DESeq2 vignette or in class.  
2. Normalize your data and call differentially expressed genes using DESeq2.  
3. Create a MA plot using the built in DESeq2 function. Save this plot either a png or pdf with the prefix "maplot" Place this plot in PLB812/lab_assignments/assignment5/  
4. Determine how many differentially expressed genes were identified using an adjusted p-value cutoff of 0.05. (We will not set any fold change cutoffs).  

## 3. Methods  

1. __Briefly__ describe your methods in a file called. "methods.txt". Be sure to explain what arguments you used and why you chose those. Also describe how many genes were differentially expressed at the adjusted p-value of 0.05.  
2. Place methods.txt in PLB812/lab_assignments/assignment5.  
3. Push your PLB812 repository to github.  

