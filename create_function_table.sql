--criando função de tabela 
CREATE OR REPLACE TABLE FUNCTION `account.dataset.function_name`(field_one STRING, field_two STRING, field_three DATE, field_four INT64) AS (
--defina sua query aqui, se quer extrair algo com base em filtros, se quer validar um campo, fazer tratamento de campo
  -- exemplo com select basico, usando os parametros de entrada como filtro do select
  SELECT
    colunn_one,
    colunn_two,
    colunn_three,
    colunn_id,
    colunn_last_update
  FROM
    `account.dataset.table_name`
  WHERE
    REGEXP_CONTAINS( colunn1, "(?i)"||field_one)
    AND REGEXP_CONTAINS(colunn2, r"(?i)"||field_two)
    AND colunn_three BETWEEN field_three
    AND CURRENT_DATE("America/Sao_Paulo") - pDate
    AND DATE(_PARTITIONDATE) = CURRENT_DATE("America/Sao_Paulo")
  QUALIFY
        ROW_NUMBER() OVER (PARTITION BY colunn_id ORDER BY colunn_last_update DESC) = 1
);
