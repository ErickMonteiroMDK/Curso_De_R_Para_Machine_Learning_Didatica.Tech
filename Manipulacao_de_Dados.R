setwd("C:/Users/Erick/OneDrive/Área de Trabalho/machine_learning")

install.packages("dplyr")
library(dplyr)

# Média de preço dos carros 0 km por marca

view(df)

?filter
?gsub
?summarise

Mediamarca <- df %>%
  filter(Ano_Modelo=="Zero KM") %>%
  group_by(Marca) %>%
  summarise(mean(Preço))

################## ####################### ################

install.packages("tidyr")

install.packages("stringr")