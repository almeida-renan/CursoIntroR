
## Curso R - Aula 4 ##

# E-mail: renan.sralmeida@gmail.com

# Baixando/importando dados da internet ----

link <- "https://s3.sa-east-1.amazonaws.com/ckan.saude.gov.br/SGL/2022/uf=DF/lote=2/part-00000-10cc880c-25fc-43c5-8e42-3a413aa16a81.c000.csv"

download.file(link, "SindromeGripalDFLt2.csv")

GripeDF <- read_csv2(link)

# Removendo mais de um objeto do ambiente de trabalho ----

rm(GripeDF, link)

# Operador pipe %>% ----

f(x, y)

x %>% f(y)

sqrt(sum(n.pares))

library(tidyverse)
library(magrittr)

n.pares %>% sum() %>% sqrt()

# DPLYR ----

select() # selecionar colunas
filter() # selecionar linhas
mutate() # criar colunas
summarise() # sumarizar colunas
arrange() #ordenar linhas

# Função select ----

Bib.AT <- Biblioteca %>% select(Autor, Título)

Biblioteca %>% select(-Autor, -Título)

# outros argumentos: starts_with, ends_with

# Função filter ----

Biblioteca %>% filter(País == "Brasil")

Biblioteca %>% filter(País == "Brasil" & Gênero == "romance")

# & = e 
# | = ou

Biblioteca %>% filter(País == "Brasil" | País == "França")

x <- Biblioteca %>% filter(País == "Brasil" |
                      País == "França", 
                      Gênero == "romance")

# Remover as observações faltantes (NA)

Biblioteca$Coleção <- as.factor(Biblioteca$Coleção)

levels(Biblioteca$Coleção)[levels(Biblioteca$Coleção)=="NA"] <- NA

y <- Biblioteca %>% filter(!is.na(Coleção))

# Usar filter e select ao mesmo tempo

Biblioteca %>%
  select(Autor, País, Gênero) %>%
  filter(País == "Rússia")

# Função mutate ----

# Comumente utilizada junto case_when

BibNova <- Biblioteca %>%
  mutate(VarX = Vezes_lido * Qtde_pag)

levels(relatorioPR$Cor)

relatorioPR <- relatorioPR %>%
  mutate(Cor.Raca = as.factor(case_when(
    Cor == " Amarelo / Amarillo / Yellow" ~ "AMARELA",
    Cor == " Branco / Blanco / White" ~ "BRANCA",
    Cor == " Indígena / Indigena / Indigenous" ~ "INDIGENA",
    Cor == " Pardo / “Moreno” / Brown" ~ "PARDA",
    Cor == " Preto / Negro / Black" ~ "PRETA"
  )))
 
relatorioPR <- relatorioPR %>%
  mutate(VarY = case_when(
    Cor.Raca == "BRANCA" ~ 1,
    Cor.Raca != "BRANCA" ~ 2
  ))

class(relatorioPR$Cor.Raca)

# Colocar letras em minúsculo ou maiúsculo (tolower, toupper)

relatorioPR <- relatorioPR %>% 
  mutate(Cor.Raca = tolower(Cor.Raca))

relatorioPR %>%
  mutate(Cor.Raca = toupper(Cor.Raca))

# Função summarise ----

# Comumente utilizada com a função group_by() ou n()

n.pesq <- relatorioPR %>%
  group_by(Nome.Classificador) %>%
  summarise(n=n())

relatorioPR %>%
  group_by(Cor.Raca) %>%
  summarise(n=n())
  
Biblioteca %>%
  group_by(País) %>%
  summarise(n=n())

Biblioteca %>%
  group_by(Gênero) %>%
  summarise(n=n())  
  
Biblioteca %>%
  group_by(Gênero) %>%
  summarise(media.pag = mean(Qtde_pag))

Biblioteca %>%
  group_by(País) %>%
  summarise(mediana.pag = median(Qtde_pag))

Biblioteca %>%
  group_by(Gênero) %>%
  summarise(media.pag = mean(Qtde_pag), 
            mediana = median(Qtde_pag),
            soma = sum(Qtde_pag))

# Utilizando summarise + mutate

teste <- Biblioteca %>% 
  group_by(País) %>%
  summarise(n = n()) %>%
  mutate(prop = prop.table(n)*100)


# Função arrange ----

teste <- teste %>%
  arrange(prop)

teste %>%
  arrange(País)

# Ordenar em ordem decrescente

teste %>%
  arrange(desc(País))

teste %>%
  arrange(desc(n))
