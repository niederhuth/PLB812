#Install topGO
if (!require("topGO", quietly = TRUE))
  BiocManager::install("topGO")
#Install GO.db
if (!require("GO.db", quietly = TRUE))
  BiocManager::install("GO.db")
#Load the libraries
library(topGO)
library(GO.db)
#Read in our genes
res <- read.table("deseq2_results.tsv",header=TRUE,sep="\t")
head(res)
table(res$sig)
#Read in topGO terms
goTerms <- readMappings(file="Athaliana_topGO.tsv")
head(goTerms)
#Format higher expressed genes
upGenes <- factor(as.integer(res$id %in% res[res$padj < 0.05 & res$log2FC >= 1,]$id))
names(upGenes) <- res$id
table(upGenes)
#GO term Enrichment for Biological Process
BP <- new("topGOdata",description="Biological Process",ontology="BP",
             allGenes=upGenes,annot=annFUN.gene2GO,nodeSize=3,gene2GO=goTerms)
FisherBP <- runTest(BP,algorithm="parentchild",statistic="fisher")
BPgenTable <- GenTable(BP,Fisher=FisherBP,ranksOf="Fisher",
                          topNodes=length(score(FisherBP)))
BPgenTable$Fisher<-gsub("< ","",BPgenTable$Fisher)
BPgenTable$fdr <- p.adjust(BPgenTable$Fisher,method="fdr")
#GO term Enrichment for Molecular Function
MF <- new("topGOdata",description="Molecular Function",ontology="MF",
             allGenes=upGenes,annot=annFUN.gene2GO,nodeSize=3,gene2GO=goTerms)
FisherMF <- runTest(MF,algorithm="parentchild",statistic="fisher")
MFgenTable <- GenTable(MF,Fisher=FisherMF,ranksOf="Fisher",
                          topNodes=length(score(FisherMF)))
MFgenTable$Fisher<-gsub("< ","",MFgenTable$Fisher)
MFgenTable$fdr <- p.adjust(MFgenTable$Fisher,method="fdr")
#GO term Enrichment for Cellular Component
CC <- new("topGOdata",description="Cellular Component",ontology="CC",
             allGenes=upGenes,annot=annFUN.gene2GO,nodeSize=3,gene2GO=goTerms)
FisherCC <- runTest(CC,algorithm="parentchild",statistic="fisher")
CCgenTable <- GenTable(CC,Fisher=FisherCC,ranksOf="Fisher",
                          topNodes=length(score(FisherCC)))
CCgenTable$Fisher<-gsub("< ","",CCgenTable$Fisher)
CCgenTable$fdr <- p.adjust(CCgenTable$Fisher,method="fdr")
#Format higher expressed with no log2fold cutoof
upGenes <- factor(as.integer(res$id %in% res[res$padj < 0.05 & res$log2FC > 0,]$id))
names(upGenes) <- res$id
table(upGenes)
#GO term Enrichment for Biological Process
BP <- new("topGOdata",description="Biological Process",ontology="BP",
             allGenes=upGenes,annot=annFUN.gene2GO,nodeSize=3,gene2GO=goTerms)
FisherBP <- runTest(BP,algorithm="parentchild",statistic="fisher")
BPgenTable <- GenTable(BP,Fisher=FisherBP,ranksOf="Fisher",
                          topNodes=length(score(FisherBP)))
BPgenTable$Fisher<-gsub("< ","",BPgenTable$Fisher)
BPgenTable$fdr <- p.adjust(BPgenTable$Fisher,method="fdr")
#GO term Enrichment for Molecular Function
MF <- new("topGOdata",description="Molecular Function",ontology="MF",
             allGenes=upGenes,annot=annFUN.gene2GO,nodeSize=3,gene2GO=goTerms)
FisherMF <- runTest(MF,algorithm="parentchild",statistic="fisher")
MFgenTable <- GenTable(MF,Fisher=FisherMF,ranksOf="Fisher",
                          topNodes=length(score(FisherMF)))
MFgenTable$Fisher<-gsub("< ","",MFgenTable$Fisher)
MFgenTable$fdr <- p.adjust(MFgenTable$Fisher,method="fdr")
#GO term Enrichment for Cellular Component
CC <- new("topGOdata",description="Cellular Component",ontology="CC",
             allGenes=upGenes,annot=annFUN.gene2GO,nodeSize=3,gene2GO=goTerms)
FisherCC <- runTest(CC,algorithm="parentchild",statistic="fisher")
CCgenTable <- GenTable(CC,Fisher=FisherCC,ranksOf="Fisher",
                          topNodes=length(score(FisherCC)))
CCgenTable$Fisher<-gsub("< ","",CCgenTable$Fisher)
CCgenTable$fdr <- p.adjust(CCgenTable$Fisher,method="fdr")
#Function for making dot plots of Enriched GO terms
GOdotplot <- function(x,fdr=0.05){
  require(ggplot2)
  x=head(x[x$fdr <= fdr,],10)
  ggplot(x[x$fdr <= fdr,],aes(x=Significant/Annotated,
                             y=reorder(Term,Significant/Annotated))) + 
    geom_point(aes(color=fdr,size=Significant)) + 
    theme_bw() +
    scale_color_continuous(low="red",high="blue") +
    xlab("Gene Ratio (DEGs/Annotated Genes)") + 
    ylab("") +
    labs(size="Gene Count",color="FDR") +
    ggtitle("Top 10 Enriched GO Terms")
}
GOdotplot(MFgenTable)
#Install Rgraphviz
if (!require("Rgraphviz", quietly = TRUE))
  BiocManager::install("Rgraphviz")
showSigOfNodes(MF, score(FisherMF), firstSigNodes = 20, useInfo = 'all')

#Function for running topGO on a list of genes
#This run each of the above analyses for a gene list and output a table and plots
topGO <- function(genelist,goTerms,nodeSize,fdr=0.05,filename,path="",returnData=FALSE){
  require(topGO)
  require(GO.db)
  ifelse(!dir.exists(path),dir.create(path), FALSE)
  BP <- new("topGOdata",description="Biological Process",ontology="BP",
            allGenes=genelist,annot=annFUN.gene2GO,nodeSize=nodeSize,gene2GO=goTerms)
  MF <- new("topGOdata",description="Molecular Function",ontology="MF",
            allGenes=genelist,annot=annFUN.gene2GO,nodeSize=nodeSize,gene2GO=goTerms)
  CC <- new("topGOdata",description="Cellular Compartment",ontology="CC",
            allGenes=genelist,annot=annFUN.gene2GO,nodeSize=nodeSize,gene2GO=goTerms)
  FisherBP <- runTest(BP,algorithm="parentchild",statistic="fisher")
  FisherMF <- runTest(MF,algorithm="parentchild",statistic="fisher")
  FisherCC <- runTest(CC,algorithm="parentchild",statistic="fisher")
  BPgenTable <- GenTable(BP,Fisher=FisherBP,ranksOf="Fisher",
                         topNodes=length(score(FisherBP)))
  BPgenTable$Fisher<-gsub("< ","",BPgenTable$Fisher)
  MFgenTable <- GenTable(MF,Fisher=FisherMF,ranksOf="Fisher",
                         topNodes=length(score(FisherMF)))
  MFgenTable$Fisher<-gsub("< ","",MFgenTable$Fisher)
  CCgenTable <- GenTable(CC,Fisher=FisherCC,ranksOf="Fisher",
                         topNodes=length(score(FisherCC)))
  CCgenTable$Fisher<-gsub("< ","",CCgenTable$Fisher)
  BPgenTable$fdr <- p.adjust(BPgenTable$Fisher,method="BH")
  MFgenTable$fdr <- p.adjust(MFgenTable$Fisher,method="BH")
  CCgenTable$fdr <- p.adjust(CCgenTable$Fisher,method="BH")
  write.csv(BPgenTable[BPgenTable$fdr <= fdr,],paste(path,filename,"_BP.csv",sep=""),
            row.names=FALSE,quote=FALSE)
  ggsave(paste(path,filename,"_BP.pdf",sep=""),plot=GOdotplot(BPgenTable,fdr=fdr))
  write.csv(MFgenTable[MFgenTable$fdr <= fdr,],paste(path,filename,"_MF.csv",sep=""),
            row.names=FALSE,quote=FALSE)
  ggsave(paste(path,filename,"_MF.pdf",sep=""),plot=GOdotplot(MFgenTable,fdr=fdr))
  write.csv(CCgenTable[CCgenTable$fdr <= fdr,],paste(path,filename,"_CC.csv",sep=""),
            row.names=FALSE,quote=FALSE)
  ggsave(paste(path,filename,"_CC.pdf",sep=""),plot=GOdotplot(CCgenTable,fdr=fdr))
  if(returnData){
    return(list(BP=BPgenTable,MF=MFgenTable,CC=CCgenTable))
  }
}