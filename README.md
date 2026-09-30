# Análise Comercial — AdventureWorks2025

## Sobre o projeto

Este projeto apresenta uma análise comercial da base AdventureWorks2025, desenvolvida com SQL Server e Power BI.

A análise busca compreender o comportamento das vendas sob diferentes perspectivas, considerando a evolução da receita ao longo do tempo, a concentração de receita entre clientes e produtos e a distribuição das vendas entre diferentes territórios.

O projeto foi desenvolvido com foco não apenas na construção de visualizações, mas principalmente no processo analítico: definição das perguntas de negócio, identificação das tabelas e granularidades relevantes, tratamento dos dados, cálculo das métricas e interpretação dos resultados.

## Objetivo da análise

O objetivo é obter uma visão geral do desempenho comercial da operação e identificar padrões relevantes relacionados a:

* evolução da receita e do volume de pedidos;
* concentração de receita entre os clientes;
* desempenho dos produtos e categorias;
* distribuição da receita entre os territórios;
* diferenças no ticket médio entre os territórios.


## Base de dados

O projeto utiliza a base de dados AdventureWorks2025, uma base relacional de exemplo voltada para operações de vendas.

Para esta análise foram utilizadas principalmente as seguintes tabelas:

* `Sales.SalesOrderHeader`: informações em nível de pedido, como data, cliente, território e identificador do pedido.
* `Sales.SalesOrderDetail`: informações em nível de item do pedido, incluindo produto, quantidade e `LineTotal`.
* `Production.Product`: informações dos produtos.
* `Production.ProductSubcategory`: subcategorias dos produtos.
* `Production.ProductCategory`: categorias dos produtos.
* `Sales.SalesTerritory`: informações dos territórios de vendas.
* `Sales.Customer`: informações dos clientes.

Um ponto importante da análise foi considerar a granularidade das tabelas. `SalesOrderHeader` possui uma linha por pedido, enquanto `SalesOrderDetail` possui uma linha para cada item ou linha de um pedido.

Essa diferença foi considerada principalmente no cálculo da quantidade de pedidos, evitando que um pedido com vários itens fosse contabilizado como vários pedidos. Para métricas de receita, foi utilizado o campo `LineTotal` da tabela `SalesOrderDetail`.

## Perguntas de negócio

A análise foi estruturada a partir das seguintes perguntas:

1. **Qual é o tamanho e o período da operação analisada?**

   * Quantos pedidos foram registrados?
   * Quantos clientes distintos realizaram pedidos?
   * Qual é o período coberto pela base?
   * Qual é a receita total e o ticket médio?

2. **Como o desempenho comercial evoluiu ao longo do tempo?**

   * Como a receita e o volume de pedidos variaram por ano?
   * Como a receita se distribuiu ao longo dos meses?

3. **Existe concentração relevante de receita entre os clientes?**

   * Quais clientes geram mais receita?
   * Qual parcela da receita total é gerada pelos 50 maiores clientes?

4. **Quais produtos e categorias concentram a receita?**

   * Quais são os produtos com maior receita?
   * Como a receita está distribuída entre as categorias?

5. **Como o desempenho varia entre os territórios?**

   * Quais territórios concentram maior receita?
   * Como o volume de pedidos varia entre os territórios?
   * Quais diferenças existem no ticket médio entre os territórios?

## Principais resultados

A análise da base resultou nos seguintes principais achados:

### Visão geral

* Foram identificados **31.465 pedidos** realizados por **19.119 clientes distintos**.
* A receita total registrada no período analisado foi de aproximadamente **R$ 109,85 milhões**.
* O ticket médio geral foi de aproximadamente **R$ 3.491,72**.
* A base cobre o período de **30/05/2022 a 29/06/2025**. O ano de 2025 é parcial e, portanto, não deve ser comparado diretamente com os anos completos anteriores.

### Evolução temporal

A receita apresentou crescimento entre 2022 e 2024:

* 2022: **R$ 14,56 milhões**
* 2023: **R$ 31,60 milhões**
* 2024: **R$ 43,67 milhões**
* 2025: **R$ 20,01 milhões até 29/06**

O aumento do volume de pedidos foi particularmente relevante a partir de 2024, acompanhado por uma redução do ticket médio. Essa mudança indica uma alteração na estrutura das vendas e foi considerada na análise temporal.

### Concentração entre clientes

Os **50 clientes de maior receita** responderam por aproximadamente **26,53% da receita total**, apesar de representarem apenas cerca de **0,26% dos 19.119 clientes**.

A análise também mostrou que esse grupo apresenta, em média, maior receita por cliente, maior ticket médio e maior frequência de pedidos do que os demais clientes.

Esses resultados descrevem uma concentração relevante de receita entre os principais clientes, sem estabelecer, por si só, uma relação causal entre concentração e qualquer característica específica desses clientes.

### Produtos e categorias

A categoria **Bikes** representou aproximadamente **82,71% da receita total**, seguida por Components (14,85%), Clothing (1,87%) e Accessories (0,57%).

Entre os produtos, alguns modelos de bicicletas apresentaram participação significativa na receita dos principais clientes, com destaque para linhas como Mountain-200 e Road-250.

### Territórios

Os três territórios com maior receita — **Southwest, Canada e Northwest** — concentraram aproximadamente **51,55% da receita total**.

Também foram observadas diferenças expressivas no ticket médio entre os territórios. Central, Northeast e Southeast apresentaram tickets médios significativamente superiores aos territórios com maior volume de pedidos, indicando que receita e volume de pedidos não apresentam necessariamente a mesma distribuição geográfica.

A análise territorial é descritiva: as diferenças observadas indicam padrões que podem ser investigados posteriormente, mas não permitem, isoladamente, determinar suas causas.

## Dashboard

O dashboard foi desenvolvido no Power BI e está organizado em três páginas:

**1. Visão Geral**

* KPIs de receita, pedidos, clientes e ticket médio;
* evolução mensal da receita;
* evolução mensal dos pedidos;
* receita por território;
* receita por categoria.

**2. Clientes e Produtos**

* ranking dos principais clientes por receita;
* comparação entre os 50 maiores clientes e os demais;
* ranking dos principais produtos por receita.

**3. Territórios**

* ticket médio por território;
* quantidade de pedidos por território;
* receita por cliente por território.

## Ferramentas utilizadas

* **SQL Server / SSMS** — exploração, tratamento e análise dos dados.
* **SQL** — consultas, agregações, relacionamentos, métricas e investigação dos dados.
* **Power BI** — modelagem, criação de medidas em DAX e desenvolvimento do dashboard.
* **DAX** — criação das métricas utilizadas na análise e nos visuais.
* **GitHub** — documentação e versionamento do projeto.

## Estrutura do projeto

```text
AdventureWorks2025-Analise-Comercial/
│
├── SQL/
│   ├── 01_Visao_Geral.sql
│   ├── 02_Evolucao_Temporal.sql
│   ├── 03_Clientes.sql
│   ├── 04_Produtos.sql
│   └── 05_Territorios.sql
│
├── PowerBI/
│
├── Imagens/
│
└── README.md
```

A pasta `SQL` contém as consultas utilizadas para estruturar a análise. A pasta `PowerBI` contém o arquivo do dashboard, enquanto `Imagens` será utilizada para armazenar as visualizações apresentadas neste README.

## Limitações da análise

* A base AdventureWorks2025 é uma base de demonstração e não representa necessariamente uma operação comercial real.
* O período de 2025 está incompleto, com dados disponíveis somente até **29/06/2025**. Por isso, os resultados de 2025 não foram tratados como equivalentes aos anos completos anteriores.
* A análise utiliza `LineTotal` como medida de receita registrada na base. O projeto não realiza uma reconciliação com conceitos contábeis como receita líquida, impostos, descontos ou custos.
* Os resultados apresentados são predominantemente descritivos. Padrões observados entre clientes, produtos e territórios não devem ser interpretados automaticamente como relações causais.
* Algumas análises identificam padrões que poderiam ser aprofundados com informações adicionais, como margem, custos, descontos, características dos clientes e dados operacionais.
