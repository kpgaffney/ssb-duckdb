SELECT d_year,
       s_nation,
       p_category,
       SUM(lo_revenue - lo_supplycost) AS profit
FROM lineorder_widetable
WHERE q42 = TRUE
GROUP BY d_year, s_nation, p_category
ORDER BY d_year, s_nation, p_category;
