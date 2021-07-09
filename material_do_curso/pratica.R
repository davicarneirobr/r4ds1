
#prática


library(usethis)
git_sitrep()
use_git()
use_github()

library(tidyverse)
library(googlesheets4)
library(janitor)

#importar a base do imdb separada por ano

library(readr)
imdb_1916 <- read_rds("material_do_curso/dados/por_ano/imdb_1916.rds")

list.files() #lista arquivos que estao no diretorio

#obtendo um vetor com o caminho para todos os arquivos
arquivos <- list.files("material_do_curso/dados/por_ano", full.names = TRUE, pattern = ".rds")

install.packages("purr")
library(purr)


#faz vetor e oferece de argumento para funcao (quase um for, a logica de um for) - um dataframe empilhado por linhas

imdb <- map_dfr(arquivos, read_rds)


#importar imdb_nao_estruturada.xlsx

library(readxl) 

estruturando <- read_excel("material_do_curso/dados/imdb_nao_estruturada.xlsx", 
                           skip = 3, 
                           col_names = nomes_colunas$nome,
                           n_max = 3713)

#carregando base com nome das colunas
#formou um novo data.frame com o nomes das colunas como linhas

nomes_colunas <- read_excel("material_do_curso/dados/imdb_nao_estruturada.xlsx", sheet="Sheet1")


#---------------------------------------------

library(dplyr)
library(magrittr)


imdc <- readr::read_rds("material_do_curso/dados/imdb.rds")

imdb %>% mutate(lucro=receita-orcamento) %>% slice_max(lucro, n=10) %>% arrange(desc(lucro)) %>% mutate(ranking=1:n()) %>% select(ranking, titulo, lucro)


