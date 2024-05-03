setwd("C:/Users/Erick/OneDrive/Área de Trabalho/machine_learning")

# Base de dados com carros da tabela fipe em junho de 2018
df <- read.csv("Fipe_Jun2018.csv",header = TRUE,encoding = "UTF-8")
View(df)
str(df)

df$x <- NULL
df$price_reference <- NULL

# Renomear Váriaveis
?names
names(df)
names(df) <- c("Marca","Carro","Ano_Modelo","Combustivel", "Preço")

# Mudar tipo de variavel
summary(df$Ano_Modelo)

df$Ano_Modelo[df$Ano_Modelo==32000] <- "Zero KM"
df$Ano_Modelo <- as.factor(df$Ano_Modelo)

summary(df$Ano_Modelo)
str(df$Ano_Modelo)

summary(df$Preço)
df$Preço1 <- as.numeric(df$Preço)
summary(df$Preço1)
df$Preço1 <- NULL

?gsub
df$Preço1 <- gsub("R\\S|\\.|","",df$Preço)
df$Preço1 <- NULL

df$Preço <- gsub("R\\S|\\.|","",df$Preço)

summary(df$Preço)

df$Preço <- as.numeric(gsub("\\,",",",df$Preço))
summary(df$Preço)

str(df)

write.table(df,file = "FipeTransformada.csv",row.names = FALSE,sep =",",fileEncoding = "UTF-8" )