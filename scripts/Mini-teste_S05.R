library(tidyverse)
library(scales)

# Dados resumidos: Total de Inadimplentes por Educação
dados_risco <- tibble(
  educacao = c("Pós-Graduação", "Universidade", "Ensino Médio", "Outros"),
  total_inadimplentes = c(2036, 3330, 1237, 33)
)

# Gráfico com destaque
# 1. Preparar o Destaque
resumo_risco <- dados_risco %>%
  mutate(
    # Se for a faixa 20-30, marque como "Destaque", senão "Normal"
    tipo_cor = ifelse(educacao == "Universidade", "Destaque", "Normal")
  )


# 2. Plotar com Cores Manuais
ggplot(resumo_risco, aes(x = reorder(educacao, -total_inadimplentes), y = total_inadimplentes, fill = tipo_cor,)) +
  geom_col() +
  
  # Adicionando os números em cima das barras
  geom_text(aes(label = total_inadimplentes), vjust = -0.5, size = 4) +
  
  # Definimos as cores manualmente
  scale_fill_manual(values = c("Destaque" = "#c0392b", "Normal" = "#bdc3c7")) +
  labs(
    title = "Universitários concentram o maior volume de inadimplência",
    subtitle = "Total de casos de default por nível de educação",
    x = NULL,
    y = NULL
  ) +
  theme_minimal() +
  theme(legend.position = "none", # Removemos a legenda
        axis.text.y = element_blank(),  # Removemos o eixo Y (limpeza visual)
        panel.grid.major = element_blank(), # Removemos as linhas de grade
        panel.grid.minor = element_blank()
        ) 
