from google.cloud import bigquery
import os

client = bigquery.Client()
project = client.project

base_dir = 'data-warehouse-v2'
if not os.path.exists(base_dir):
    os.makedirs(base_dir)

datasets = client.list_datasets()

for dataset in datasets:
    dataset_id = dataset.dataset_id
    dataset_ref = bigquery.DatasetReference(project, dataset_id)
    
    views_dir = os.path.join(base_dir, dataset_id, 'views')
    routines_dir = os.path.join(base_dir, dataset_id, 'routines')

    os.makedirs(views_dir, exist_ok=True)
    os.makedirs(routines_dir, exist_ok=True)

    # Processa todas as views
    tables = list(client.list_tables(dataset_ref))
    for table in tables:
        if table.table_type == 'VIEW':
            view_ref = client.get_table(f"{project}.{dataset_id}.{table.table_id}")
            sql = view_ref.view_query
            if sql:
                path = os.path.join(views_dir, f"{table.table_id}.sql")
                with open(path, 'w') as file:
                    file.write(sql)
                print(f"Exported view to {path}")

    # Processa todas as rotinas
    routines = list(client.list_routines(dataset_ref))
    for routine in routines:
        routine_type = routine._properties.get('routineType')  # Accessing routine type correctly
        if routine_type in ['SCALAR_FUNCTION', 'TABLE_VALUED_FUNCTION', 'PROCEDURE']:
            routine_ref = client.get_routine(f"{project}.{dataset_id}.{routine.routine_id}")
            sql = routine_ref.body  # Usando o atributo correto para a definição SQL
            if sql:
                path = os.path.join(routines_dir, f"{routine.routine_id}.sql")
                with open(path, 'w') as file:
                    file.write(sql)
                print(f"Exported routine to {path}")
