CREATE TABLE lineorder_widetable AS
SELECT lo_quantity,
       lo_extendedprice,
       lo_discount,
       lo_revenue,
       lo_supplycost,
       p_mfgr,
       p_category,
       p_brand1,
       s_city,
       s_nation,
       s_region,
       c_city,
       c_nation,
       c_region,
       d_year,
       d_yearmonthnum,
       d_yearmonth,
       d_weeknuminyear
FROM lineorder,
     part,
     supplier,
     customer,
     date
WHERE lo_partkey = p_partkey
  AND lo_suppkey = s_suppkey
  AND lo_custkey = c_custkey
  AND lo_orderdate = d_datekey;

DROP TABLE lineorder;
DROP TABLE date;
DROP TABLE customer;
DROP TABLE supplier;
DROP TABLE part;
