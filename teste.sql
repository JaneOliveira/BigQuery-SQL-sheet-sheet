DECLARE command STRING;

FOR table IN (
  SELECT table_name
  FROM project.dataset.INFORMATION_SCHEMA.TABLES
  WHERE table_name LIKE 'table_teste_%'
) DO
  SET command = 'DROP TABLE IF EXISTS project.dataset.' || table.table_name;
  EXECUTE IMMEDIATE command;
END FOR;