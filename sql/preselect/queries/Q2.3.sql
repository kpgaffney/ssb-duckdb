SELECT SUM(lo_revenue), d_year, p_brand1
FROM lineorder_widetable
WHERE q23 = TRUE
GROUP BY d_year, p_brand1
ORDER BY d_year, p_brand1;
