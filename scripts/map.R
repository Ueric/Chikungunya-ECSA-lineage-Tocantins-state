# R Code for tree visualization
# 
# This code is part of, and published under the same terms and conditions as, the following publication 
# Ueric José Borges de Souza, Raíssa Nunes dos Santos, Marta Giovanetti, Luiz Carlos Junior Alcantara, Jucimária Dantas Galvão, 
# Franciano Dias Pereira Cardoso, Feliph Cássio Sobrinho Brito, Ana Cláudia Franco, Paulo Michel Roehe, Bergmann Morais Ribeiro,
# Fernando Rosado Spilki, Fabricio Souza Campos
# (2022). Genomic epidemiology reveals the circulation of the chikungunya virus East-Central South African lineage in Tocantins state, North Brazil. 
# Submitted in . 

### load required libraries and import data
cat("\014") ## clear RStudio console
rm(list=ls()) ## clear the Global Environment
library(ggplot2)
library(dplyr)
library(viridis)
library(brazilmaps)
library(geobr)
library(sf)
library(maptools)
library(leaflet)
library(geojsonio)
library(gpclib)
library(dplyr)
library(broom)

#Brazilian map

mapa <- read_state(showProgress = FALSE)

class(mapa)
mapa
ggplot(mapa)+ 
  geom_sf() +
  theme_map() +
  

ggsave(file="brazilmap.pdf")

#Tocantins map

