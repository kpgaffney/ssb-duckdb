SELECT SUM(lo_revenue), d_year, p_brand1
FROM lineorder_widetable
WHERE p_brand1 = 'MFGR#2221'
  AND s_region = 'EUROPE'
GROUP BY d_year, p_brand1
ORDER BY d_year, p_brand1;
