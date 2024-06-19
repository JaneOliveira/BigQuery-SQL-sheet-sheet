-- Defina as variáveis de início e fim da data
DECLARE start_date DATE DEFAULT '2024-03-01';
DECLARE end_date DATE DEFAULT '2024-06-19';

-- Cria uma CTE para a tabela de referência de datas
WITH 

DateRange AS (
    SELECT
      date
    FROM
      UNNEST(GENERATE_DATE_ARRAY(start_date, end_date, INTERVAL 1 DAY)) AS date
),

-- Sua tabela diarizada, substitua pelo nome correto
TableData AS (
    SELECT
      PARSE_DATE("%Y%m%d", event_date) AS date
    FROM
      `project_name.dataset.ga4_events_*`
    WHERE event_date BETWEEN FORMAT_DATE('%Y%m%d', start_date) AND FORMAT_DATE('%Y%m%d', end_date)
    GROUP BY
      date
)

-- Seleciona as datas que estão na tabela de referência, mas não na sua tabela diarizada
SELECT
  DateRange.date
FROM
  DateRange
LEFT JOIN
  TableData
ON
  DateRange.date = TableData.date
WHERE
  TableData.date IS NULL
ORDER BY
  DateRange.date DESC;
