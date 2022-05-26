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

TO_map <- geojson_read("Tocantins.geojson", what = "sp")
TO_map
plot(TO_map)
TO_map_fortified <- tidy(TO_map, region = "id")
TO_map_fortified
ggplot()+
  geom_polygon(data = TO_map_fortified, aes(x = long, y = lat, group = group), fill = "white", color="grey") +
  theme_void() + 
  coord_map()

data <- read.table(file = "n.txt", header = T, sep = "\t")
data
data$id_commom <- as.character(data$id_commom)
is.character(data$id_commom)

spdf_fortified = spdf_fortified %>% 
  left_join(. , data, by=c("id" = "id_commom"))

final_map_TO <- ggplot() +
  geom_polygon(data = TO_map_fortified, aes(fill = N, x = long, y = lat, group = group),  color="black", size=0.1, alpha=0.9) +
  theme_void() +
  scale_fill_gradient(low = "#fee6ce", high = "#a63603", na.value = "grey100", 
                      trans = "log", breaks=c(1,2,12)) +
  #scale_fill_continuous(na.value = "grey70", trans = "log", breaks=c(0,83), name="Number of sequenced genomes", guide = guide_legend( keyheight = unit(3, units = "mm"), keywidth=unit(12, units = "mm"), label.position = "bottom", title.position = 'top', nrow=1) ) +
  #labs(
  #  title = "",
  #  subtitle = "",
  #  caption = "") +
  theme(
    text = element_text(color = "#22211d"),
    plot.background = element_rect(fill = "#ffffff", color = NA),
    panel.background = element_rect(fill = "#ffffff", color = NA),
    legend.background = element_rect(fill = "#ffffff", color = NA),
    #plot.title = element_text(size= 12, hjust = 0.5, vjust = 0.5, color = "black"),
    #plot.subtitle = element_text(size= 12, hjust=0.01, color = "#4e4d47", margin = margin(b = -0.1, t = 0.43, l = 2, unit = "cm")),
    #plot.caption = element_text( size=12, color = "#4e4d47", margin = margin(b = 0.3, r=-99, unit = "cm") ),
    
    legend.position = "bottom"
  ) +
  coord_map()

final_map_TO
ggsave(file="TOmap.pdf", width=6, height=5.5, dpi=600)

#Final editing in inkscape (https://inkscape.org/pt-br/)
