
## Curso R - Aula 1 ##


#uma conta simples
2+2

# R como Calculadora ----

#  +
#  -
#  *
#  /
#  ^
  
5+2

7+3

4*8

10/2

(4+2)*3
4 + 2 * 3

sqrt(25)
sqrt(100)

# Testes Lógicos ----
# ==
# <
# >
# <=
# >=
# !=

# Output: TRUE, FALSE

2==2
10 != 10
2 != 10

TRUE == TRUE
TRUE == FALSE
TRUE > FALSE

# TRUE = 1
# FALSE = 0

"Tiago" == "Thiago"
"Brasil" != "brasil"

# Atribuição de etiquetas ----

exemplo <- 6
exemplo

Exemplo

a <- 10
a
a/2

b = 100 # Melhor evitar

1ex <- 50
ex1 <- 50

#Não utilizar etiquetas com o mesmo nome de funções

clas1 <- "Pedro"

# Tipos ou classes dos objetos ----

#numeric : numérico (números reais)
#integer: números inteiros (sem componente de fração)
#logical(boolean): lógicos (TRUE, FALSE ou NA)
#character (string): caractere
#factor: fator (categorias bem definidas, gênero, estado civil)

class(a)

sqrt(30)

decimal <- 3,5
decimal <- 3.5

vdd <- TRUE
class(vdd)


TRUE + FALSE

Rei <- "Pelé"
class(Rei)

ex2 <- as.character(ex1)

class(ex2)

# Vetores ----

#Ex: números de 1 a 10. Nomes começando com a R. 
# Nomes de professores da UnB. TRUE, FALSE, FALSE, TRUE, etc.

n.pares <- c(2, 4, 6, 8, 10)

numeros <- 1:10

escritores <- c("Dostóiévski", "Tolstói", "Poe", "Drummond") 

class(numeros)
class(escritores)

length(n.pares)
length(escritores)

sum(n.pares)
mean(n.pares)
median(n.pares)
