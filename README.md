# BigQuery - sheet-sheet

Este repositório foi criado para compartilhar queries SQL e códigos em Python voltados para acessar e trabalhar com o Google BigQuery. O BigQuery é uma poderosa ferramenta de análise de dados em larga escala, que permite executar consultas SQL de forma rápida e eficiente em datasets massivos.

Aqui, você encontrará exemplos de consultas para resolver problemas comuns, otimizar análises e explorar dados, além de scripts Python para integrar o BigQuery em pipelines de dados e automações.

Seja para aprendizado, referência ou inspiração, este espaço está aberto para ajudar quem deseja explorar todo o potencial do BigQuery! 🚀

--------------------------------------------------------------------

## Script 1

Se você precisa extrair todas as views e rotinas (funções de tabela) existentes em seus datasets no BigQuery, não faça isso manualmente! Utilize o código descrito no arquivo download_views_and_routines_from_bq.py, que está localizado neste repositório, para realizar a extração de forma automatizada.

Requisitos:

Ter o gcloud configurado corretamente com as credenciais necessárias.

Ter o ambiente Python pronto para executar o script.

O que o script faz:

Realiza a extração de todas as views e rotinas dos datasets no BigQuery.

Armazena os dados extraídos em uma pasta chamada data-warehouse-v2.

Dentro dessa pasta, cria subpastas correspondentes a cada dataset que contenha views ou rotinas.

Com isso, você pode organizar e gerenciar as views e rotinas de forma eficiente e automatizada. 
Podendo até mesmo versionar essas views e rotinas.

--------------------------------------------------------------------

## Script 2

Se você deseja criar uma tabela particionada por partition_time, utilize o código SQL descrito no arquivo create_table_partitiontime.sql, que está localizado neste repositório. Esse arquivo contém a instrução necessária para configurar sua tabela com particionamento baseado no tempo, garantindo uma organização eficiente e otimizada para suas consultas no BigQuery.

------------------------------------------------------------------

## Script 3

Se você precisa apagar tabelas particionadas, lembre-se de que o comando DROP TABLE normalmente remove apenas uma única partição de uma tabela. No entanto, utilizando a query SQL descrita no arquivo delete-partition_tables.sql, você pode remover todas as tabelas particionadas correspondentes a um padrão específico de forma automatizada.

O que o código faz:

Declara uma variável command do tipo STRING que será usada para armazenar os comandos dinâmicos de exclusão.

Itera sobre todas as tabelas que atendem ao padrão especificado no filtro (table_name LIKE 'table_teste_data_%') dentro do schema INFORMATION_SCHEMA.TABLES do BigQuery.

Para cada tabela encontrada:

Monta dinamicamente o comando DROP TABLE para excluir a tabela.

Executa o comando com EXECUTE IMMEDIATE, removendo a tabela particionada.

Importante: Esse script é útil para automatizar a exclusão de várias tabelas particionadas com nomes que seguem um padrão comum (ex.: tabelas de um mesmo grupo ou projeto). Isso garante agilidade e evita a necessidade de excluir manualmente cada partição ou tabela individualmente.
