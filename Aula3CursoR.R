
## Curso R - Aula 3 ##

# E-mail: renan.sralmeida@gmail.com

# Remover objetos no ambiente de trabalho ----

rm(clas1)
rm(ex1)

# Importação de dados ----

# Excel: .xlsx ou xml   --- ler com pacote "readxl", "xlsx" ou
# "openxlsx"

# Texto: .txt, .csv, .tsv  --- ler com pacote "readr"

#Para ler com "foreign" ou "haven"#
# SPSS: .sav   
# Stata: .dta
# SAS: .sas7bdat


# R: RData

## Ler bases de dados
# R base: readformato ou read.formato
# Tidyverse: read_formato

## Salvar bases de dados
# write.formato ou write_formato

install.packages("readxl")

# Para visualizar base de dados importada:
# Clicar em cima da base ou usar função View()

View(Biblioteca)

library(readxl)
Biblioteca <- read_excel("Biblioteca.xlsx")

# Data.frame ----

class(Biblioteca)

# Criando um data.frame

x <- 1:4
y <- c("PT", "PSDB", "MDB", "PL")
z <- c(0.9, 0.75, 0.68, 0.7)

partidos <- data.frame(x, y, z)

# Colunas: variáveis ou atributos
# Linhas: observações

# Selecionar colunas ----

Biblioteca[3]
editora <- Biblioteca[3]

# $ : outra forma de selecionar colunas

Biblioteca$Editora
vec.ed <- Biblioteca$Editora

class(vec.ed)
class(editora)

# Funções úteis ----

head(Biblioteca)  # mostrar as 6 primeiras linhas do data.frame
tail(Biblioteca) # mostrar as 6 últimas linhas do data.frame

dim(Biblioteca)  # número de linhas de colunas

names(Biblioteca) # fornecer os nomes das colunas (variáveis)

str(Biblioteca) # estrutura do data.frame, as classes das colunas
# e primeiras linhas

# Verificar a classe de uma coluna separadamente

class(Biblioteca$Volume)

# Outras funções úteis

cbind() # acoplar duas tabelas lado a lado 
# (precisa ter a mesma quantidade de linhas)

Biblioteca2 <- read_excel("Biblioteca.xlsx", sheet = 2)

teste <- Biblioteca2[-1]

teste2 <- cbind(Biblioteca, teste)

rbind() # empilhar duas tabelas (uma em cima da outra)
# (precisa ter a mesma quantidade de colunas)

Biblioteca3 <- read_excel("Biblioteca.xlsx", sheet = 3)

teste3 <- rbind(Biblioteca, Biblioteca3)

# Alternativas tidyverse: bind_rows e bind_cols

# Importando bases em outros formatos ----

#SPSS
library(haven)
ESEB2018 <- read_sav("ESEB2018.sav")

#TXT
BaseTeste <- read.csv2("D:/Projetos-R/BaseTeste.TXT", sep="")

#CSV
relatorio <- read.csv("C:/Users/renan/Downloads/relatorio.csv", 
                      encoding="UTF-8", sep=";")





