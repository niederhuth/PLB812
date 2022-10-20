# Lab 5: GO term enrichment with topGO

In this assignment, you will perform GO term enrichment using topGO

## 1. Download & Format GO terms 

1. If you haven't already, download and format a set of GO terms for you species. I recommend downloading from phytozome. You can find an example of how to format these in my lab lecture slides. It is important that your gene names match those in your DESeq2 results. If you downloaded a genome & annotations form another source, please talk with me and we will work something out.   

## 2. Run topGO 

1. Create a gene list of differentially expressed genes from your sample. Separate out those that show increased expression and those that show decreased expression.  
2. Run topGO on each gene list for all three categories of GO terms (Biological Process, Molecular Function, Cellular Component). For this, do not do multiple testing correction.  
3. Save tables of the GO term enrichment in PLB812/lab_assignments/assignment6. Label these files "higher_expressed_BP.tsv", "lower_expressed_BP.tsv", and so on.  

## 3. Methods  

1. __Briefly__ describe your methods in a file called. "methods.txt". Be sure to explain what arguments you used and why you chose those. Describe how many GO terms you found enriched for each gene list and category.  
2. Place methods.txt in PLB812/lab_assignments/assignment5.  
3. Push your PLB812 repository to github.  

