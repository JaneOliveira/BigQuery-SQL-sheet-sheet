DECLARE command STRING;

FOR table IN (
  SELECT table_name
  FROM project.dataset.INFORMATION_SCHEMA.TABLES 
  WHERE table_name LIKE 'table_teste_data_2025%'
) DO
  SET command = 'ALTER TABLE `project.dataset.' || table.table_name || '` ' ||
  'SET OPTIONS (expiration_timestamp = TIMESTAMP_ADD(CURRENT_TIMESTAMP(), INTERVAL 15 DAY))';
  EXECUTE IMMEDIATE command;
END FOR;
