SELECT SUM(lo_revenue), d_year, p_brand1
FROM lineorder_widetable
WHERE p_category = 'MFGR#12'
  AND s_region = 'AMERICA'
GROUP BY d_year, p_brand1
ORDER BY d_year, p_brand1;
