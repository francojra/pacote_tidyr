
# Pacote tidyr -----------------------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 06/08/22 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://tidyr.tidyverse.org/ -------------------------------------------------------------------------------------------------

# Introdução -------------------------------------------------------------------------------------------------------------------------------

### Tidy data é para organizar e tabular dados em uma consistente estrutura.
### Uma tabela é tidy se:

# - Cada variável é disposta em uma coluna;
# - Cada observação é disposta em linha;
# - Acessa variáveis como vetores;
# - Preserva observações em operações vetorizadas.

### Tibbles: representam data frames organizados e simplificados. Os tibbles
### são tabelas formatadas pelo pacote 'tibble'. Eles herdam o data frame class,
### mas tem características melhoradas:

# Exemplos de tibbles (tabelas organizadas e simplificadas) --------------------------------------------------------------------------------

### Veja as diferenças da tabela padrão e tibble:

library(tibble)
data(iris)
tibble(iris) # Dados com tibble
data.frame(iris) # Dados com tabela padrão

### Construindo um tibble:

# Por colunas
tibble(x = 1:3, y = c("a", "b", "c"))

# Por linhas: usa-se a função 'tribble'
tribble(~x, ~y, 
       1, "a", 
       2, "b", 
       3, "c")

# Converte um data.frame em um tibble
as_tibble(iris)

# Converte vetores nomeados em um tibble
enframe(x, name = "name", value = "value")
enframe(1:3)
enframe(c(a = 5, b = 7))
enframe(list(one = 1, two = 2:3, three = 4:6))
deframe(enframe(3:1))
deframe(tibble(a = 1:3))
deframe(tibble(a = as.list(1:3)))

# Testa se 'x' é um tibble
is_tibble(iris)

# Reformulando (reshape) dados -------------------------------------------------------------------------------------------------------------

## Função pivot_longer:

### Pivot data reorganiza valores dentro de um novo layout.
### Ele colapsa várias colunas em duas, nomes das colunas se
### movem para um nova coluna 'nome' criada, e valores para uma nova
### coluna com os valores. Veja o exemplo:

library(tidyr)
iris[1:5,]
pl <- pivot_longer(iris, cols = 3:4, names_to = "valores_petala",
             values_to = "Valores")
view(pl)

## Função pivot_wider:

### Executa o inverso de pivot_longer. Expande duas colunas em
### várias. Uma coluna promove nomes em várias colunas, e outra
### os valores.

dados <- tibble(year = c(1999, 1999, 2000, 2000), 
                country = c("a", "a", "b", "b"),
                type = c("cases", "pop", "cases", "pop"),
                count = c(3, 5, 9, 2))
dados

pw <- pivot_wider(dados, names_from = type, 
            values_from = count)
view(pw)

# Células divididas (Split Cells) ----------------------------------------------------------------------------------------------------------

### Use-se essas funções para dividir ou combinar células em
### individuais, isolados valores.

## Função unite: 

### Colapsa valores das células de duas colunas em uma única coluna.

dados <- tibble(year = c(99, 10, 99, 10), 
                country = c("a", "a", "b", "b"),
                century = c(19, 20, 19, 20))
dados

unite(dados, century, year, col = "year", sep = "")

## Função separate:

### Separa células de uma coluna em duas células e duas colunas.

dados <- tibble(year = c(99, 10, 99, 10), 
                country = c("a", "a", "b", "b"),
                rate = c("0.7K/19M", "2K/20M", "37K/172M", "80K/174M"))
dados

separate(dados, rate, sep = "/", into = c("cases", "pop"))

## Função separate_rows:

### Separa células de uma coluna e distribui a divisão em várias linhas.

dados <- tibble(year = c(99, 10, 99, 10), 
                country = c("a", "a", "b", "b"),
                rate = c("0.7K/19M", "2K/20M", "37K/172M", "80K/174M"))
dados

separate_rows(dados, rate, sep = "/")

# Expandir tabelas (Expand Tables) ---------------------------------------------------------------------------------------------------------

### Cria novas combinações de variáveis ou identifica valores perdidos
### implícitos (combinações de variáveis não apresentadas nos dados).

## Função expand:

### Cria uma nova tibble com todas as possíveis combinações dos valores
### das variáveis listadas. Também corta outras variáveis...

mtcars

expand(mtcars, cyl, gear, carb)

## Função complete:

### Adiciona valores faltantes das combinações de valores das variáveis
### listadas. Preenche as variáveis restantes com NA.

complete(mtcars, cyl, gear, carb)

# Manipulação com valores faltantes --------------------------------------------------------------------------------------------------------

### Corta ou realoca explícitos valores faltantes (NAs).

library(tidyverse)
view(starwars)

## Função drop_na:

### Corta linhas contendo valores com NA.

starwars1 <- starwars %>%
  select(name, hair_color)
starwars1

drop_na(starwars1, hair_color)  

## Função fill:

### Preenche os NAs das colunas usando os valores próximos ou prévios.

fill(starwars1, hair_color)

## Função replace_na:

### Especifica um valor para ser substituído pelo NA na coluna selecionada.

replace_na(starwars1, list(hair_color = "Indefinido"))
