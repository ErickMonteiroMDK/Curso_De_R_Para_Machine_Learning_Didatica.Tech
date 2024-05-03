setwd("C:/Users/Erick/OneDrive/Área de Trabalho/machine_learning")

# base de dados preparada para previsões

df <- read.csv("FipePrev.csv",header = TRUE, encoding = "UTF-8")

#Separar dados do treino e teste

# Dados de treino 70%
treino = df[1:7,]

# Dados de Teste 30%
teste = df[8:10,]

view(treino)
View(teste)

length(df$Marca)*0.7
length(df$Marca)

treino = df[1:13698]
teste = df[13698:19569]

View(treino)
View(teste)

length(treino$Marca)=length(teste$Marca)

# Separar de maneira randomica

?sample

sample(1:6,1)

sameple(1:19569,13698)

?set.seed
set.seed(100)

length <- sample(1: length(df$Marca),length(df$Marca)*0.7)

# dados de treino - 70%

treino = df[linhas,]

# dados de teste - 30%

teste = df[-linhas,]

length(treino$Marca)+length(teste$Marca)

### Criar o Modelo ###

library(rpart)
?rpart

modelo <- rpart(Preço ~.,
                data=treino,
                control=rpart.control(cp=0))

### Realizar previsões ###

?predict

teste$Previsão <- predict(modelo,teste)
View(teste)

# Analisar resultados

teste$P <- round(teste$Previsão/teste$Preço,2)
teste$P <- Teste$P-1
teste$P <- abs(teste$P)
R_1 <- summary(teste$P)
R_1

# Analisar distribuição de preços

summary(df$Preço)

quantile(df$Preço,0.90)

hist[ds$Preço<quantile(df$Preço,0.90)], breaks=10,labels=T)

R_Final_1 <- summary(teste$P[teste$Preço>10000 & teste$Preço<70000])
R_1
R_Final_1
