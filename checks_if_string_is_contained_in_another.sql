SELECT
  *,
  REGEXP_CONTAINS(arr, CONCAT(r'(?i)', B)) AS match
FROM (
  SELECT
    "A" AS B,
    "A,B,C" AS arr
)
