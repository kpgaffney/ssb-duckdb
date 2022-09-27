SELECT SUM(lo_extendedprice * lo_discount) AS revenue
FROM lineorder_widetable
WHERE q11 = TRUE;
