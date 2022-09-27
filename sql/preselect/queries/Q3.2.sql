SELECT c_city, s_city, d_year, SUM(lo_revenue) AS revenue
FROM lineorder_widetable
WHERE q32 = TRUE
GROUP BY c_city, s_city, d_year
ORDER BY d_year ASC, revenue DESC;
