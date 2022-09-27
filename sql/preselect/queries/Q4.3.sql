SELECT d_year,
       s_city,
       p_brand1,
       SUM(lo_revenue - lo_supplycost) AS profit
FROM lineorder_widetable
WHERE q43 = TRUE
GROUP BY d_year, s_city, p_brand1
ORDER BY d_year, s_city, p_brand1;
