
# Brazilian map plot, save as pdf file with name BrazilianSite

library(ggplot2)
library(ggmap)

Brazilian.map <- get_map(location = 'Brazil', zoom = 4, maptype = "hybrid")  
                                                                # "terrain", "toner", "hybrid", "satellite"
mp <- ggmap(Brazilian.map)                     
mp

# coor <- c(longitude, latitude)                                # 8 sites
coordinate <- matrix(data = NA, nrow = 8, ncol = 2)
# coor <- matrix(c(-47.53, -22.0, -51.2, -20.25, -46.19, -22.19, -49.53, -22.56, -51.24, -22.07, -52.57, -22.31, -48.25, 
#                -22.51, -48.17, -21.14), nrow=8, ncol=2)       # this was wrong

coordinate[, 1] <- c(-47.53, -51.2, -46.19, -49.53, -51.24, -52.57, -48.25, -48.17)  #longitude
coordinate[, 2] <- c(-22.0, -20.25, -22.19, -22.56, -22.07, -22.31, -22.51, -21.14)  #latitude
coordinate    

coor <- data.frame(coordinate)                                  # need data frame not matrix format
names(coor) <- c('longitude','latitude')                        # add names 
class(coor$longitude)                                           # check if numeric format
coor

mp + geom_point(data = coor, aes(x = coor$longitude, y = coor$latitude), colour = 'red', pch = 20, cex = 2)


### Alternative way


library(maps)
library(mapdata)

dat = read.csv(text = " Site, longitude, latitude
                        EESC, -47.53,    -22.0
                        ILHA,  -51.2,    -20.25
                        MGIN, -46.19,    -22.19
                        OURI, -49.53,    -22.56
                        PPTE, -51.24,    -22.07
                        ROSA, -52.57,    -22.31
                        SPBO, -48.25,    -22.51
                        SPJA, -48.17,    -21.14
                        ")

# map('brazil', col = "darkgray", ylim = c(18, 54), panel.first = grid())         # no brazil map data
Brazilian.map <- get_map(location = 'Brazil', zoom = 5, maptype = "terrain")      #"terrain", "toner"
mp <- ggmap(Brazilian.map)

class(dat)
class(dat$longitude)
class(dat[, 1])

mp + geom_point(data = dat, aes(x = dat$longitude, y = dat$latitude, label = dat$Site), colour = 'blue', pch = 20) + 
     geom_text(data = dat, aes(x = dat$longitude, y = dat$latitude, label = dat$Site), cex = 2, vjust = 0, colour = "red")                                                                                            







