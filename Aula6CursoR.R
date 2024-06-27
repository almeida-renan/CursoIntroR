
## Curso R - Aula 6 ##

# E-mail: renan.sralmeida@gmail.com

# Tabela de frequência simples com summarise ----

PR.TSE %>%
  group_by(Cor.Final) %>%
  summarise(freq.abs = n()) %>%
  mutate(freq.rel = round(prop.table(freq.abs), digits = 4)*100)

# Tabelas de referências cruzadas com janitor ----

install.packages("janitor")

library(janitor)

PR.TSE %>%
  filter(DS_SIT_TOT_TURNO != "#NULO#") %>%
  tabyl(DS_COR_RACA, DS_SIT_TOT_TURNO)

#Percentuais (coluna)

PR.TSE %>%
  filter(DS_SIT_TOT_TURNO != "#NULO#") %>%
  tabyl(DS_COR_RACA, DS_SIT_TOT_TURNO) %>%
  adorn_percentages("col") %>%
  adorn_pct_formatting()

#Percentuais (linha)

PR.TSE %>%
  filter(DS_SIT_TOT_TURNO != "#NULO#") %>%
  tabyl(DS_COR_RACA, DS_SIT_TOT_TURNO) %>%
  adorn_percentages("row") %>%
  adorn_pct_formatting()

#GGPLOT2 ----

aes() #estéticas

# x (ou xmax)
# y (ou ymax)
# color
# fill
# shape
# group
# size

#camadas (layers)

#escalas (scale_)

#rótulos (labels)

#temas (themes)

#facetas (facets)

#geometrias (geom_) - dispersão, histograma, setores, barras, 
#densidade, boxplot etc.


ggplot(aes()) + geom_bar()

#Gráfico de barras simples ----

#Na horizontal
PR.TSE %>%
  ggplot(aes(x = Cor.Final)) +
  geom_bar()

#Na vertical
PR.TSE %>%
  ggplot(aes(y = Cor.Final)) +
  geom_bar(fill = "red", color = "blue") +
  theme_classic() +
  labs(title = "Frequências de cor", x = "Contagem", y = "Cor", 
       caption = "Fonte: TSE")

#Gráfico de barras com duas variáveis ----

#Situação eleitoral e heteroclassificação
PR.TSE %>%
  filter(DS_SIT_TOT_TURNO != "#NULO#") %>%
  ggplot(aes(x = DS_SIT_TOT_TURNO, fill = Cor.Final)) +
  geom_bar(position = "dodge2")

#Autodeclaração e heteroclassificação
PR.TSE %>%
  ggplot(aes(x = DS_COR_RACA, fill = Cor.Final)) +
  geom_bar(position = "dodge2")

# Facet grid e facet wrap ----

# Facet grid

PR.TSE %>%
  filter(DS_SIT_TOT_TURNO != "#NULO#") %>%
  ggplot(aes(x = DS_COR_RACA, fill = Cor.Final)) +
  geom_bar(position = "dodge2") +
  facet_grid(rows = vars(DS_SIT_TOT_TURNO))

# Facet wrap

PR.TSE %>%
  filter(DS_SIT_TOT_TURNO != "#NULO#") %>%
  ggplot(aes(x = DS_COR_RACA, fill = Cor.Final)) +
  geom_bar(position = "dodge2") +
  facet_wrap(vars(SG_PARTIDO))

# Juntando com outros estados da região sul (necessário importar os dados antes) ----

Reg.Sul <- rbind(PR.TSE, SC.TSE, RS.TSE)

Reg.Sul.1 <- Reg.Sul %>%
  select(SQ_CANDIDATO, SG_UF, SG_PARTIDO, DS_SIT_TOT_TURNO, 
         DS_COR_RACA, Cor.Final)

#Renomeando colunas ----

Reg.Sul.1 <- Reg.Sul.1 %>%
  rename(Autodeclaração = "DS_COR_RACA", Heteroclassificação = "Cor.Final")

#pivot_longer ----

Reg.Sul.1 <- Reg.Sul.1 %>% pivot_longer(5:6, names_to = "Classificação", 
                                        values_to = "Cor")

# Gráfico simples

Reg.Sul.1 %>%
  ggplot(aes(x = Classificação, fill = Cor)) +
  geom_bar(position = "dodge2")

#Reorganizando categorias de cor ----

Reg.Sul.1 <- Reg.Sul.1 %>%
  mutate(Cor2 = as.factor(case_when(
    Cor == "BRANCA" ~ "BRANCO",
    Cor == "AMARELA" ~ "BRANCO",
    Cor == "PARDA" ~ "NÃO BRANCO",
    Cor == "PRETA" ~ "NÃO BRANCO",
    Cor == "INDÍGENA" ~ "NÃO BRANCO",
    Cor == "NÃO INFORMADO" ~ "NÃO BRANCO"
  )))

#Gráfico 1 ----
Reg.Sul.1 %>%
  ggplot(aes(x = Classificação, fill = Cor2)) +
  geom_bar(position = "dodge2")

#Gráfico 2 ----

Reg.Sul.1 %>%
  ggplot(aes(x = Classificação, fill = Cor2)) +
  geom_bar(position = "dodge2") +
  facet_wrap(vars(SG_UF))

#Gráfico 3 ----

Reg.Sul.1 %>%
  filter(DS_SIT_TOT_TURNO == "ELEITO POR MÉDIA"|
         DS_SIT_TOT_TURNO == "ELEITO POR QP") %>%
  ggplot(aes(x = Classificação, fill = Cor2)) +
  geom_bar(position = "dodge2") +
  facet_wrap(vars(SG_PARTIDO))

  
