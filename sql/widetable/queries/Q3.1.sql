SELECT c_nation, s_nation, d_year, SUM(lo_revenue) AS revenue
FROM lineorder_widetable
WHERE c_region = 'ASIA'
  AND s_region = 'ASIA'
  AND d_year >= 1992
  and d_year <= 1997
GROUP BY c_nation, s_nation, d_year
ORDER BY d_year ASC, revenue DESC;
