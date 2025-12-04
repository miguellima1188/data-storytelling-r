library(tidyverse)
library(janitor)
library(scales) # Novo amigo para formatar R$, %, etc.

# Carregar dados
credito_df <- read.csv("https://azuremlexamples.blob.core.windows.net/datasets/credit_card/default_of_credit_card_clients.csv", skip = 1) %>% 
  clean_names() %>%
  mutate(
    status = ifelse(default_payment_next_month == 1, "Inadimplente", "Adimplente"),
    faixa_etaria = cut(age, breaks = c(20, 30, 40, 50, 60, 80), 
                       labels = c("20-30", "30-40", "40-50", "50-60", "60+"))
  )

# Contar inadimplência por faixa
resumo_idade <- credito_df %>%
  filter(status == "Inadimplente") %>%
  group_by(faixa_etaria) %>%
  summarise(total = n())

# Gráfico colorido padrão
ggplot(resumo_idade, aes(x = faixa_etaria, y = total, fill = faixa_etaria)) +
  geom_col() +
  labs(title = "Inadimplência por Idade")

# Gráfico com destaque
# 1. Preparar o Destaque
resumo_destaque <- resumo_idade %>%
  mutate(
    # Se for a faixa 20-30, marque como "Destaque", senão "Normal"
    tipo_cor = ifelse(faixa_etaria == "20-30", "Destaque", "Normal")
  )

# 2. Plotar com Cores Manuais
ggplot(resumo_destaque, aes(x = faixa_etaria, y = total, fill = tipo_cor)) +
  geom_col() +
  # Definimos as cores manualmente
  scale_fill_manual(values = c("Destaque" = "#c0392b", "Normal" = "#bdc3c7")) +
  labs(
    title = "Jovens entre 20-30 anos concentram a inadimplência",
    subtitle = "Volume absoluto de casos de default por faixa etária",
    x = "Faixa Etária",
    y = "Total de Casos"
  ) +
  theme_minimal() +
  theme(legend.position = "none") # Removemos a legenda


# Vamos usar o mesmo gráfico anterior e adicionar texto
ggplot(resumo_destaque, aes(x = faixa_etaria, y = total, fill = tipo_cor)) +
  geom_col() +
  scale_fill_manual(values = c("Destaque" = "#c0392b", "Normal" = "#bdc3c7")) +
  
# 1. Adicionar o VALOR no topo de cada barra
geom_text(aes(label = total), vjust = -0.5, size = 3.5) +

# 2. Adicionar uma "seta" ou nota explicativa para o destaque
annotate(
  "text", x = 3, y = 2000, 
  label = "A tendência de queda\ncomeça após os 30 anos.",
  color = "gray30", fontface = "italic"
) +

# Anotação de seta (curva)
annotate(
  "curve", x = 2.5, y = 1800, xend = 1.5, yend = 2200,
  curvature = 0.2, arrow = arrow(length = unit(2, "mm")), color = "gray50"
) +

theme_minimal() +
theme(
  legend.position = "none",
  axis.text.y = element_blank(), # Removemos eixo Y pois já temos os rótulos
  axis.title.y = element_blank(),
  axis.title.x = element_blank(), 
  panel.grid.major = element_blank(), # Limpamos o grid
  panel.grid.minor = element_blank()
)

