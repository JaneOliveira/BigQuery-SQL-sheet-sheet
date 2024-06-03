--Criando tabela particionada por dia no campo _PARTITIONTIME

CREATE TABLE `project_id.dataset_name.table_name`
(
    -- Defina as colunas da sua tabela aqui
    id INT64,
    nome STRING,
    data TIMESTAMP
)
PARTITION BY DATE(_PARTITIONTIME)
OPTIONS (
    require_partition_filter = true
);
