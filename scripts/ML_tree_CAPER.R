# R Code for tree visualization
# 
# This code is part of, and published under the same terms and conditions as, the following publication 
# Ueric José Borges de Souza, Raíssa Nunes dos Santos, Marta Giovanetti, Luiz Carlos Junior Alcantara, Jucimária Dantas Galvão, 
# Franciano Dias Pereira Cardoso, Feliph Cássio Sobrinho Brito, Ana Cláudia Franco, Paulo Michel Roehe, Bergmann Morais Ribeiro,
# Fernando Rosado Spilki, Fabricio Souza Campos
# (2022). Genomic epidemiology reveals the circulation of the chikungunya virus East-Central South African lineage in Tocantins state, North Brazil. 
# Submitted in . 

### load required libraries 
library(ape)
library(treeio)
library(ggtree)
library(ggtreeExtra)
library(ggplot2)
library(ggnewscale)
library(dplyr)
library(tidytree)
library(ggpubr)
library(ggstar)
library(tidyverse)
library(lubridate)
library(RColorBrewer)
library(caper)
library(stringr)
library(cowplot)

### import tree file
ML_tree <- read.tree("ML.treefile")
ML_tree

ggtree(ML_tree) + geom_text(aes(label=node), hjust=-.3)
ML_tree
ggtree(ML_tree)

ggsave("ML_tree.pdf", width = 50, height = 150, units = "cm",limitsize = FALSE)

### Extract the ECSA lineage from the tree

ECSA <- MRCA(ML_tree, 1184)
ECSA
tree_phylo <- as.phylo(ML_tree)
tips_ecsa <- clade.members(ECSA, tree_phylo, tip.labels=TRUE)

# counts
values_ecsa <- str_count(tips_ecsa, pattern = "TO") # tips: 15 TO
sum(values_ecsa == 1)
length(tips_ecsa) 
tips_ecsa_to <- as.data.frame(tips_ecsa)
write.table(tips_ecsa_to, file="ecsa.tsv", quote=F,sep="\t",row.names=F)

