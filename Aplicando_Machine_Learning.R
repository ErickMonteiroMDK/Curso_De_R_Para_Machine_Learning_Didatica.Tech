setwd("C:/Users/Erick/OneDrive/Área de Trabalho/machine_learning")

# Base de Dados

df <- read.csv("FipePrevAjustada.csv", header = TRUE,encoding = "UTF-8")
View(df)

set.seed(100)

# separar dados de treino e teste de maneira randomica 
linhas <- sample(1:length(df$Marca),length(df$Marca)*0.7)

# dados de treino - 70%
treino = df[linhas,]

#dados de testes - 30%
teste = df[-linhas,]

# Criar o modelo
library(rpart)
modelo <- rpart(Preço ~.,data=treino,control = rpart.control(cp=0))

# Realizar previsões
teste$Previsao <- predict(modelo,teste)
View(teste)

# Analisar resultados
teste$P <- abs(round(teste$Previsão/teste$Preço,4)-1)
R_1 <- summary(teste$P)
R_1

# analisar destribuição dos preços excluindo os 10% mais caros
hist(df$Preço[df$Preço<quantile(df$Preço,0.90)], breaks = 10,labels = T)

R_Final_1 <- summary(teste$P[teste$Preço>10000 & teste$Preço<70000])
R_1
R_Final_1

#Base de dados com carros de tabela fipe em junho de 2018
dfReal <- read.csv("Fipe_Jun2018.csv",header = TRUE, encoding = "UTF-8")
View(dfReal)
View(df)
