

setwd("C:/Users/ASUS/OneDrive - Child Health Research Foundation/KPN_World_map")
set.seed(123)

d<- final_map_file
n <- nrow(d)
d$radius <- 6.5 * abs(rnorm(n))
#View(d)

#d$radius<-rep(c(rowSums(d[2:9,])),times=1)

##here is main code for creating map. Above portion mention the how to create a dataset. 
##Dataset should look like this

library(ggplot2)
library(scatterpie)
world <- map_data('world')

p <- ggplot(world, aes(long, lat)) +
  geom_map(map=world, aes(map_id=region),  fill = "gray70", color="black") +
  coord_quickmap()
  
p +geom_scatterpie(aes(x=long, y=lat, group=region, r=radius),
                   data=d, cols=colnames(d)[2:11], color=NA, alpha=.8) +
  geom_scatterpie_legend(d$radius, x=-160, y=-55)+theme_bw()+
  scale_fill_manual(values=c('#b00b69','#4bec13', '#0000ff', '#7f5b50','#c70000','#d94bff','#61b5d3','#6afffe','#5e0000','#c7c6c5'))