#install.packages('dplyr')
library(dplyr)
library(readxl)

ativos <- read_excel("exemplo_dados.xlsx", 
                            sheet = "ativos")

aplicacoes <- read_excel("exemplo_dados.xlsx", 
                            sheet = "aplicacoes")

contas <- read_excel("exemplo_dados.xlsx", 
                            sheet = "contas")

saida <- aplicacoes %>%
  left_join(ativos, by=c( 'ATIVO' = 'ID_ATIVO')) %>%
  left_join(contas, by=c('CONTA' = 'ID_CONTA'))

saida

write.table(saida,'./resultado_r.csv',sep = ";",dec = ",")

write.table(ativos,'./ativos.csv',sep=";",dec=",",row.names = FALSE)
write.table(contas,'./contas.csv',sep=";",dec=",", row.names = FALSE)
write.table(aplicacoes,'./movimentos.csv',sep=";",dec=",", row.names = FALSE)
    