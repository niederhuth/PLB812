#List files in directory
sampleFiles <- list.files("count_data")
#Create sampleTable from the file names
sampleTable <- data.frame(sampleName = sub(".txt","",sampleFiles),
                          fileName = sampleFiles,
                          genotype = sub("-..txt","",sampleFiles))
#Set the genotype column to factor
sampleTable$genotype <- factor(sampleTable$genotype)
#Load DESeq2
library(DESeq2)
#Create the DESeq2 object from the HTSeqCount tables
dds <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                  directory = "count_data",
                                  design= ~ genotype)
#Change factor levels so WT is considered the reference genotype
dds$genotype <- relevel(dds$genotype, ref = "WT")
#Show the dds object
dds
#Prefilter
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep,]
#Show the dds object
dds
#Estimate Size Factor - library size
dds <- estimateSizeFactors(dds)
#Show the library size adjustment
dds$sizeFactor
#Estimate the dispersion
#This estimates the dispersion per gene
dds <- estimateDispersions(dds)
#Plot out the dispersions
plotDispEsts(dds)
#Call DE genes using the Wald Test
dds <- nbinomWaldTest(dds)
#Extract results for a pair-wise contrast
resultsTable <- as.data.frame(results(dds, contrast=c("genotype","WT","h3h3")))
#Show how many genes padj < 0.05
nrow(na.omit(resultsTable[resultsTable$padj < 0.05,]))
#Genes with 2-fold change or log2FC = 1
nrow(na.omit(resultsTable[resultsTable$padj < 0.05 & resultsTable$log2FoldChange >= 1,]))



