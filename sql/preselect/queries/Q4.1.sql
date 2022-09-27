SELECT d_year, c_nation, SUM(lo_revenue - lo_supplycost) AS profit
FROM lineorder_widetable
WHERE q41 = TRUE
GROUP BY d_year, c_nation
ORDER BY d_year, c_nation;
