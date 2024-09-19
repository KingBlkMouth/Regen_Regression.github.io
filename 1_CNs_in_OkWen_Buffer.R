# Import and clean StandPlot CNs for Undisturbed Regen




# Libraries -------------------------------------------------------------------------------------------------------

rm(list = ls())
gc()

# Data tidying and access
library(tidyverse, quietly = T)
library(RSQLite)
library(magrittr)
# library(readxl)
# library(writexl)

# yaImpute and related 
library(yaImpute)
library(vegan)
library(randomForest)

# plots and tables
library(esquisse)
library(knitr)
library(DT)

library(kableExtra)
library(readxl)
library(feather)

# GIS
library(terra)
library(sf)


# No sci-notation. 
options(scipen = 999)

clean_mem <- function() {
  x <- ls(envir = .GlobalEnv)
  # ls()[!(ls() %in% keep)]
  rm(list = x[!(x %in% keep)], envir = .GlobalEnv)
  gc()
}




# Import lat long -------------------------------------------------------------------------------------------------


## The OkWen Buffer
# 
pol <- shapefile("C:/RxFire/GIS/gisData/All_FOAs_shp/OkWen_cFOAs_Albers_60km_Buffer.shp")

## The lat/long of FIA plots in WA

con <- dbConnect(RSQLite::SQLite() , "C:/RxFire/Data/_FIADB_WA.db")
CNs <- dbGetQuery(con, "select CN, lat, lon from PLOT")
dbDisconnect(con)

str(CNs)
CNs <- CNs |> drop_na()

# write_csv(CNs, "C:/RxFire/Regen/Regen2_08Aug24/WA_fiaplots.csv")

## In AGP




















# ll <- CNs |> dplyr::select(LAT, LON)
# # ll <- cbind(CNs$LAT, CNs$LON) |> as.data.frame()
# 
# str(ll)
# # ll <- st_multipoint(ll)
# 
# 
# 
# points <- ll |> 
#   st_as_sf(coords = c("LON", "LAT")) %>%  # , crs = 4326
#   # summarise(geometry = st_combine(geometry)) %>%
#   st_cast("MULTIPOINT")
# points
# 
# plot(points)
# 
# 
# 
# # names(CNs)
# pol2 <- st_as_sf(pol, coords = c("long", "lat"))
# 
# 
# 
# # ext <- extract(pol, ll)
# 
# # install.packages("mapview")
# # library(mapview)
# 
# pol2 |> mapview()
# 
# map <- read_sf("C:/RxFire/GIS/gisData/All_FOAs_shp/OkWen_cFOAs_Albers_60km_Buffer.shp", package = "sf")
# 
# points <- st_sample(points, size = 100)
# 
# 
# st_intersects(pol, points)
# ?st_sample
# 
# 
# pol |> crs()
