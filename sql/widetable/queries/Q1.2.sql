SELECT SUM(lo_extendedprice * lo_discount) AS revenue
FROM lineorder_widetable
WHERE d_yearmonthnum = 199401
  AND lo_discount BETWEEN 4 AND 6
  AND lo_quantity BETWEEN 26 AND 35;
