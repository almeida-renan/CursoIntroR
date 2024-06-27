
## Curso R - Aula 5 ##

# E-mail: renan.sralmeida@gmail.com

# Carregar tidyverse ----
library(tidyverse)

# Joins ----

inner_join(): #inclui todas as linhas em x E y

left_join(): #inclui todas as linhas em x 

right_join(): # inclui todas as linhas em y

full_join(): #inclui todas as linhas em x OU y

# Abrindo dados da pesquisa ----

#PR
relatorioPR <- read.csv("relatorioPR.csv", 
                        encoding="UTF-8", sep=";")

# Remover linhas ----

relatorioPR <- relatorioPR[-3282,]

# Remover coluna "foto" ----

relatorioPR <- relatorioPR %>%
  select(-Foto)

# Renomear nomes de colunas ----

relatorioPR <- relatorioPR %>%
  rename(Dificuldade.Class = Teve.dificuldade.para.classificar.,
         Erro.foto = Houve.erro.na.exibição.da.foto)

# Criar uma coluna com novos valores de cor/raça ----

#PR
relatorioPR <- relatorioPR %>%
  mutate(Cor.Raca = as.factor(case_when(
    Cor == " Amarelo / Amarillo / Yellow" ~ "AMARELA",
    Cor == " Branco / Blanco / White" ~ "BRANCA",
    Cor == " Indígena / Indigena / Indigenous" ~ "INDIGENA",
    Cor == " Pardo / “Moreno” / Brown" ~ "PARDA",
    Cor == " Preto / Negro / Black" ~ "PRETA"
  )))

  
relatorioPR %>%
  group_by(Cor) %>%
  summarise(n=n())

levels(relatorioPR$Cor) 

#Filtrando classificadores para utilizar ----

relatorioPR %>%
  group_by(Nome.Classificador) %>%
  summarise(n=n())

# Classificadores Paraná: Daniel Silva, Nina Peres e 
# Patricia Daliah

relatorioPR <- relatorioPR %>%
  filter(Nome.Classificador == " Daniel Silva"|
         Nome.Classificador == " Nina Peres"|
         Nome.Classificador == " Patricia Daliah")

# pivot_wider ----

PR <- relatorioPR %>%
  select(Nome.Classificador, SQ_CANDIDATO, Cor.Raca)

PR <- PR %>% pivot_wider(names_from = Nome.Classificador, 
                   values_from = Cor.Raca)  
  
# pivot_longer ----

PR %>% pivot_longer(2:4, names_to = "Nome.Classificador",
                    values_to = "Cor.Raca")

# Importando dados do TSE ----

# Dados: https://dadosabertos.tse.jus.br/dataset/candidatos-2022

#PR
library(readr)
consulta_cand_2022_PR <- read_delim("consulta_cand_2022_PR.csv", 
                                    ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                                    trim_ws = TRUE)

# Filtrar pelo cargo ----

consulta_cand_2022_PR <- consulta_cand_2022_PR %>%
  filter(DS_CARGO == "DEPUTADO FEDERAL")

# Selecionar apenas colunas relevantes ----

consulta_cand_2022_PR <- consulta_cand_2022_PR %>%
  select(SQ_CANDIDATO, DS_COR_RACA, SG_UF, SG_PARTIDO,
         DS_SIT_TOT_TURNO)

# Joins em prática ----

PR.TSE <- left_join(consulta_cand_2022_PR, PR, 
                    by = "SQ_CANDIDATO")

# Renomeando colunas com nomes de pesquisadores ----

PR.TSE <- PR.TSE %>%
  rename(Classificador1 = ` Daniel Silva`,
         Classificador2 = ` Nina Peres`,
         Classificador3 = ` Patricia Daliah`)

# Cálculo de consenso ----

PR.TSE$consenso <- PR.TSE$Classificador1 == PR.TSE$Classificador2 &
  PR.TSE$Classificador2 == PR.TSE$Classificador3

# Criar nova coluna com a cor final ----


PR.TSE$Classificador1 <- as.character(PR.TSE$Classificador1)
PR.TSE$DS_COR_RACA <- as.character(PR.TSE$DS_COR_RACA)

PR.TSE <- PR.TSE %>%
  mutate(Cor.final = case_when(
    consenso == T ~ Classificador1,
    consenso == F ~ DS_COR_RACA,
    is.na(consenso) ~ DS_COR_RACA
  ))









