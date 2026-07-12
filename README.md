# E-Commerce Sales Analytics

<img width="1277" height="714" alt="Dashboard" src="https://github.com/user-attachments/assets/7b78760f-77bb-4290-9f3d-931c1fc42c6c" />

## Sobre o Projeto

Este projeto é uma análise completa de ponta a ponta sobre o volume de vendas, faturamento e satisfação de clientes de um E-Commerce dos EUA. O objetivo principal foi construir uma infraestrutura de dados robusta, saindo de um documento bruto até à construção de um painel de Business Intelligence dinâmico, simulando um ambiente corporativo real.

O grande diferencial deste projeto não é apenas a visualização de dados, mas sim a **Engenharia de Analytics** aplicada, utilizando ferramentas específicas para cada etapa do processo de ETL (Extração, Transformação e Carregamento).

**Dataset Original:** Os dados brutos utilizados neste projeto foram extraídos da plataforma Kaggle: [📊 E-commerce: dataset 2025 💡](https://www.kaggle.com/datasets/muhammadshayan5839/e-commerce-eda-insights-and-visualizaion/data?select=ecommerce_product_dataset2.csv) 

## Arquitetura e Tecnologias Utilizadas

* **Microsoft Excel:** Análise exploratória inicial, identificação de anomalias e entendimento da estrutura dos dados brutos.
* **Python (Pandas):** *Feature Engineering* (Criação de métricas financeiras complexas).
* **MySQL:** Armazenamento relacional, tipagem de dados, tratamento de erros de importação e criação de **Views** otimizadas para consumo do relatório.
* **Microsoft Power BI:** Conexão ao banco de dados SQL, modelação, tratamento de hierarquias de datas personalizadas (cronológicas) e design de UI/UX através de layout customizado de fundo.

## O Pipeline de Dados (Passo a Passo)

### 1. Transformação no Python

O conjunto de dados original não possuía a métrica principal de negócio (Receita Líquida). Foi desenvolvido um script em Python utilizando a biblioteca Pandas para aplicar a regra de descontos e exportar a base otimizada.

### 2. Armazenamento e Otimização em SQL

O ficheiro processado foi importado para um banco de dados MySQL. Em vez de ligar o Power BI diretamente à tabela bruta (o que prejudicaria a performance em cenários reais de Big Data), criei `VIEWS` no SQL para pré-processar as agregações e métricas:

* `vw_faturamento_mensal`: Evolução das vendas e da receita mês a mês.
* `vw_performance_categorias`: Volume de receita com a satisfação do cliente
* `vw_analise_geografica`: Cidades que geram mais lucro para a empresa.
* `vw_receita_vendas_ano`: Total de receita líquida e vendas no ano.

### 3. Visualização e Design (Power BI)

O Power BI foi conectado diretamente às Views do MySQL. O desenvolvimento focou-se em:

* Importação e Tipagem: Conexão com o banco de dados e alteração/adequação dos tipos de dados das tabelas diretamente no Power BI.
* Modelação de Tempo: Criação de uma hierarquia de datas personalizada para garantir a ordenação cronológica correta dos gráficos de evolução temporal.
* Construção de um Background corporativo via ferramenta de design externa, melhorando a separação visual.
* Construção de Dashboards: Criação dos gráficos e painéis interativos focados nas métricas de negócio.

## Principais Insights e Decisões de Negócio

O dashboard revelou as seguintes métricas fundamentais da operação:

* **Volume Absoluto:** A empresa gerou um total de **$194 Milhões de Receita Líquida** no período analisado, fruto da venda de **1,01 Milhão** de unidades.
* **Comportamento Sazonal:** Os maiores picos de vendas ocorrem no último trimestre do ano (Novembro e Dezembro), impulsionados provavelmente pelas festividades e eventos como a Black Friday, atingindo perto dos $19 Milhões em um único mês. Nota-se também um forte aquecimento secundário nos meses de Verão (Julho e Agosto).
* **Concentração Geográfica:** A cidade de **Pittsburgh** é o principal mercado (com 21 mil unidades vendidas), seguida de perto por San Francisco e Oklahoma (18 mil).
* **Satisfação Média:** O catálogo apresenta uma avaliação média de 3,03, sinalizando uma oportunidade clara de revisão de qualidade e produtos nas categorias com pior classificação.

## Como navegar neste repositório

* `README.md`: Documentação e arquitetura geral.
* `dataset/`: Dataset utilizado do Kaggle, junto ao dataset com a coluna de receita líquida e também um arquivo organizado para o Excel.
* `python/`: O script `.py` utilizado para o cálculo da Receita.
* `sql/`: Ficheiro com os scripts das `Views` utilizadas para conectar o SQL ao Power BI.
* `powerbi/`: Todas as tabelas e o dashboard criado dentro do PowerBI.
* `dashboard/`: Imagens do layout de fundo em alta resolução e prints do relatório concluído.

---
*Desenvolvido por **Gustavo Allan Jeromine** - Sinta-se à vontade para se conectar comigo no [LinkedIn](https://www.linkedin.com/in/gustavojeromine/)!*
