SELECT SUM(lo_revenue), d_year, p_brand1
FROM lineorder_widetable
WHERE p_brand1 BETWEEN 'MFGR#2221' AND 'MFGR#2228'
  AND s_region = 'ASIA'
GROUP BY d_year, p_brand1
ORDER BY d_year, p_brand1;
