SELECT c_city, s_city, d_year, SUM(lo_revenue) AS revenue
FROM lineorder_widetable
WHERE (c_city = 'UNITED KI1' OR c_city = 'UNITED KI5')
  AND (s_city = 'UNITED KI1' OR s_city = 'UNITED KI5')
  AND d_year >= 1992
  AND d_year <= 1997
GROUP BY c_city, s_city, d_year
ORDER BY d_year ASC, revenue DESC;
