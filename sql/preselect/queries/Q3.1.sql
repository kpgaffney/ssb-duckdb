SELECT c_nation, s_nation, d_year, SUM(lo_revenue) AS revenue
FROM lineorder_widetable
WHERE q31 = TRUE
GROUP BY c_nation, s_nation, d_year
ORDER BY d_year ASC, revenue DESC;
