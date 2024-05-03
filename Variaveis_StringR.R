setwd("C:/Users/Erick/OneDrive/Área de Trabalho/machine_learning")

# Base de dados com carros de tabela fipe em junho de 2018
df <- read.csv("FipeTransformada.csv", header = TRUE, encoding = "UTF-8")

View(df)

levels(df$Carro)

# Coluna com cilindradas

library(stringr)
?str_extract

df$cilindradas <- str_extract(df$Carros, "[0-9]\\.[0-9]")
str(df$cilindradas)

df$cilindradas <- as.factor(df$cilindradas)
str(df$cilindradas)
summary(df$cilindradas)

# Verificar linhas NA

unique(df$Carro[is.na(df$cilindradas)])

library(dplyr)

df %>%
  filter(is.na(cilindradas))%>%
  select(Carro)%>%
  distinct(Carro)

# Coluna do tipo Cambio

?str_detect
?subset

aut <- subset(df, str_detect(df$Carro," Aut\\."), "Carro")
aut <- unique(aut)
aut$Cambio <- "Aut"

view(aut)

?left_join

df <- left_join(df,aut)
df$Cambio[is.na(df$Cambio)] <- "Mec"
str(df$Cambio)

df$Cambio <- as.factor(df$Cambio)
str(df$Cambio)

# Coluna com nome de carro

library(tidyr)
?separate

df <- separate(df, "Carro", into = "Nome",sep = " ",remove = FALSE)
summary(ds$Nome)
df$Nome <- as.factor(df$Nome)
str(df$Nome)
str(df$Carro)

str(df)

df <- na.omit(df)

write.table(df, file = "FipePrev.csv", row.names = FALSE,sep = ",",fileEncoding = "UTF-8" )