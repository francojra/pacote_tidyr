
# Pacote tidyr -----------------------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 06/08/22 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://forcats.tidyverse.org/ -----------------------------------------------------------------------------------------------

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

# Testa de 'x' é um tibble
is_tibble(iris)
