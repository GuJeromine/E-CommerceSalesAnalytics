-- ANÁLISE DE TENDÊNCIA TEMPORAL (Para gráficos de linha de faturamento)
-- Objetivo: Mostrar a evolução das vendas e da receita mês a mês.

CREATE OR REPLACE VIEW vw_faturamento_mensal AS
    SELECT 
        YEAR(date_added) AS ano,
        MONTH(date_added) AS mes,
        SUM(sales) AS total_unidades_vendidas,
        SUM(revenue_net) AS receita_total_liquida,
        ROUND(AVG(discount) * 100, 2) AS desconto_medio_aplicado
    FROM
        vendas
    GROUP BY YEAR(date_added) , MONTH(date_added)
    ORDER BY ano ASC , mes ASC;
    
-- PERFORMANCE DE CATEGORIAS E QUALIDADE (Para gráficos de barras e dispersão)
-- Objetivo: Cruzar o volume de receita com a satisfação do cliente (Rating).
CREATE OR REPLACE VIEW vw_performance_categorias AS
    SELECT 
        category AS categoria,
        COUNT(DISTINCT product_id) AS mix_de_produtos,
        SUM(sales) AS total_unidades_vendidas,
        SUM(revenue_net) AS receita_total_liquida,
        ROUND(AVG(RATING), 2) AS avaliacao_media
    FROM
        vendas
    GROUP BY category
    ORDER BY receita_total_liquida DESC
    
-- ANÁLISE GEOGRÁFICA (Para gráficos de Mapa)
-- Objetivo: Identificar quais cidades geram mais lucro para a empresa.
CREATE OR REPLACE VIEW vw_analise_geografica AS
    SELECT 
        city AS cidade,
        SUM(sales) AS total_unidades_vendidas,
        SUM(revenue_net) AS receita_total_liquida
    FROM
        vendas
    GROUP BY city
    ORDER BY receita_total_liquida DESC;

-- ANÁLISE DE RECEITA LÍQUIDA E VENDAS
-- Objetivo: Mostrar o total de receita líquida e vendas no ano
CREATE OR REPLACE VIEW vw_receita_vendas_ano AS
select sum(revenue_net), sum(sales) from vendas