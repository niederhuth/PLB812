# Lab 9: Orthogroup Analysis

In this assignment, you will use Orthofinder to find orthogroups between three species

## 1. Installation

1. Install orthofinder using Conda. I recommend putting this in its own environment.    

## 2. Download the data 

1. We will run orthofinder using three species. For real analyses, you will typically want to include many more than this, but for now we will only do three: *Arabidopsis thaliana*, *Oryza sativa* (rice), and *Amborella trichopoda* (our outgroup species).
2. Download the protein sequences for the primary transcript (name includes "__protein_primaryTranscriptOnly.fa.gz__": https://data.jgi.doe.gov/refine-download/phytozome?genome_id=291,323,447  
3. Decompress the files and rename them. The names of the input file will be used as the species name by Orthofinder, so I recommend naming them Athaliana.fa, Osativa.fa, Atrichopoda.fa or something similar.  
4. Create a new directory and place the fasta files in that directory. 

## 2. Run Orthofinder

1. Run orthofinder using the directory containing your protein fasta files.  
2. Deterimine how many orthogroups were identified by orthofinder by counting the number of lines in the file _Phylogenetic_Hierarchical_Orthogroups/N0.tsv_. 
3. Find which rice genes are part of the orthogroup for the Arabidopsis protein HAESA using: 
```
grep AT4G28490 Phylogenetic_Hierarchical_Orthogroups/N0.tsv
```
4. In a text file named 'results.txt' record your results for #2 & #3 and place this file in PLB812/lab_assignments/assignment9

## 3. Methods  

1. __Briefly__ describe your methods in a file called. "methods.txt". Be sure to explain what arguments you used and why you chose those.  
2. Place methods.txt in PLB812/lab_assignments/assignment9.  
3. Push your PLB812 repository to github.  
