
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

### Veja o exemplo e diferenças da tabela padrão:

library(tibble)
data(iris)
tibble(iris) # Dados com tibble
data.frame(iris) # Dados com tabela padrão

### Construindo um tibble:


