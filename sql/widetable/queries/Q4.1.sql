SELECT d_year, c_nation, SUM(lo_revenue - lo_supplycost) AS profit
FROM lineorder_widetable
WHERE c_region = 'AMERICA'
  AND s_region = 'AMERICA'
  AND (p_mfgr = 'MFGR#1' OR p_mfgr = 'MFGR#2')
GROUP BY d_year, c_nation
ORDER BY d_year, c_nation;
