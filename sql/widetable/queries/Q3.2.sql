SELECT c_city, s_city, d_year, SUM(lo_revenue) AS revenue
FROM lineorder_widetable
WHERE c_nation = 'UNITED STATES'
  AND s_nation = 'UNITED STATES'
  AND d_year >= 1992
  and d_year <= 1997
GROUP BY c_city, s_city, d_year
ORDER BY d_year ASC, revenue DESC;
