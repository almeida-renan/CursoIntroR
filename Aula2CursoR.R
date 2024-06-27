
## Curso R - Aula 2 ##

# Selecionar elementos ----

# []

n.pares[2]

escritores[3]

length(escritores)


numeros[length(numeros)]

n.pares[n.pares > 5]

# Atalho para rodar código: Control + Enter

n.pares[n.pares > median(n.pares)]

escritores[escritores == "Poe"]
escritores[escritores == "Tolstói"]

escritores[c(1, 4)]
escritores[c(2, 3)]


## Pacotes ----

# Instalação de pacotes

install.packages("foreign")

# Carregar pacotes

library(foreign)

# Uitilizar funções de pacotes sem carregá-los (não recomendado)

foreign::read.spss()
dplyr::select()

# Pacote Tidyverse

install.packages("tidyverse")

# RMarkdown ----

# Útil para criar relatórios, apresentações, dashboards etc.

# Formatos: HTML, PDF, Word, Powerpoint...

# Requer pacote "rmarkdown" atualizado



# Diretório de trabalho ----

# Obter diretório de trabalho
getwd()

# Mudar diretório de trabalho

#Inverter barra (Windows) ou colocar duas barras

setwd("D:/Projetos-R")  # O endereço depende do usuário
setwd("D:\\Projetos-R")
setwd("D:/Projetos-R/Artigo")




