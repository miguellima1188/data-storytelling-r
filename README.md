# Projeto: Data Storytelling e Design Estratégico (Semana 5)

> **Foco:** Comunicação Visual, Atributos Pré-atentos, Anotações e Persuasão com Dados.

Este repositório contém os resultados da **Semana 5 do Treinamento R + Relatórios**. Nesta etapa, deixamos de focar apenas na construção técnica de gráficos (`ggplot2` básico) e passamos a focar na **eficácia da comunicação**. O objetivo não é apenas mostrar dados, mas guiar a atenção do tomador de decisão para o *insight* crítico.

---

## Objetivos de Aprendizado

Nesta semana, transformamos gráficos "padrão" em peças de comunicação estratégica utilizando:

1.  **Atributos Pré-atentos (Cor):** Uso de **Cor de Destaque** (ex: Vermelho) versus **Cor de Contexto** (Cinza) para guiar o olhar imediatamente para o ponto de interesse.
2.  **Redução de Carga Cognitiva:**
    * Remoção de legendas externas (usando anotações diretas).
    * Remoção de eixos desnecessários (usando `geom_text` nas barras).
    * Aplicação do princípio *Data-Ink Ratio* (menos tinta, mais informação).
3.  **Narrativa Ativa:** Substituição de títulos descritivos ("Inadimplência por Idade") por **Títulos Ativos/Manchetes** ("Jovens concentram 40% do Risco").
4.  **Anotações Contextuais:** Uso de `annotate()` para inserir setas e textos explicativos dentro da área de plotagem.

---

## O Estudo de Caso

**Cenário:** A diretoria de Risco da Fintech precisava entender onde concentrar os esforços de cobrança e ajuste de crédito.
**Hipótese Inicial:** O risco está distribuído igualmente ou focado em clientes mais velhos.
**Insight dos Dados:** A análise revelou que o volume absoluto de inadimplência é massivamente concentrado em **clientes jovens (20-30 anos)** e cai drasticamente com a idade.