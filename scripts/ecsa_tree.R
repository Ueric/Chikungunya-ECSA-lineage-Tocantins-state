cat("\014") ## clear RStudio console
rm(list=ls()) ## clear the Global Environment

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
library(cowplot)

setwd("C:/Users/ueric/OneDrive/chikv_final/final_bayes/combined")
metadata <- read.table("state.txt", sep = "\t", header = T)
tree <- read.nexus("combined.final.tree")
tree

ggtree(tree) + geom_text(aes(label=node), hjust=-.3)
ggtree(tree)

ecsa <- ggtree(tree, mrsd="2022-02-09", as.Date=TRUE, size=0.4, color = "gray50") + theme_tree2() +
  scale_colour_manual(values=c("gray80")) +
  geom_tippoint(size=1.0, color='gray40', fill = 'gray90', shape=21) +
  scale_x_date(limits = as.Date(c("2014-01-01", "2022-03-01")), date_labels = "%Y", date_breaks = "1 year") +
  theme(axis.text.x = element_text(size=8, vjust=0.5, hjust=0.5)) +
  theme(legend.position = 'none')
#geom_text(aes(label=node), hjust=-.3)
ecsa



ecsa_final <- ecsa %<+% metadata +
  geom_tippoint(aes(
    subset=(state=='Alagoas')), size=2.5, fill="#ae017e", color='black',shape=21) +
  geom_tippoint(aes(
    subset=(state=='Amazonas')), size=2.5, fill="#fee5d9", color='black',shape=21) +
  geom_tippoint(aes(
    subset=(state=='Bahia')), size=2.5, fill= "#3f007d", color='black',shape=21) +
  geom_tippoint(aes(
    subset=(state=='Haiti')), size=2.5, fill="#33a02c", color='black',shape=21) +
  geom_tippoint(aes(
    subset=(state=='Maranhao')), size=2.5, fill="#7a0177", color='black',shape=21) +
  geom_tippoint(aes(
    subset=(state=='MatoGrosso')), size=2.5, fill="#fbc68c", color='black',shape=21) +
  geom_tippoint(aes(
    subset=(state=='Paraguay')), size=2.5, fill="#b2df8a", color='black',shape=21) +
  geom_tippoint(aes(
    subset=(state=='Paraiba')), size=2.5, fill="#de1b98", color='black',shape=21) +
  geom_tippoint(aes(
    subset=(state=='Pernambuco')), size=2.5, fill="#bcbddc", color='black',shape=21) +
  geom_tippoint(aes(
    subset=(state=='RiodeJaneiro')), size=2.5, fill="#90ebf8", color='black',shape=21) +
  geom_tippoint(aes(
    subset=(state=='RioGrandedoNorte')), size=2.5, fill="#f9e8fb", color='black',shape=21) +
  geom_tippoint(aes(
    subset=(state=='Roraima')), size=2.5, fill="#fb6a4a", color='black',shape=21) +
  geom_tippoint(aes(
    subset=(state=='SaoPaulo')), size=2.5, fill="#1d91c0", color='black',shape=21) +
  geom_tippoint(aes(
    subset=(state=='Sergipe')), size=2.5, fill="#eb76c1", color='black',shape=21) +
  geom_tippoint(aes(
    subset=(state=='Tocantins')), size=2.5, fill="#cb181d", color='black',shape=21) +
  expand_limits(y = 180)

ecsa_final
ggsave(file="new_tree.pdf", units = "cm", width=15, height=14, dpi=600)
