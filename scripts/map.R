
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
