ALTER TABLE lineorder_widetable ADD COLUMN q11 BOOLEAN;
ALTER TABLE lineorder_widetable ADD COLUMN q12 BOOLEAN;
ALTER TABLE lineorder_widetable ADD COLUMN q13 BOOLEAN;
ALTER TABLE lineorder_widetable ADD COLUMN q21 BOOLEAN;
ALTER TABLE lineorder_widetable ADD COLUMN q22 BOOLEAN;
ALTER TABLE lineorder_widetable ADD COLUMN q23 BOOLEAN;
ALTER TABLE lineorder_widetable ADD COLUMN q31 BOOLEAN;
ALTER TABLE lineorder_widetable ADD COLUMN q32 BOOLEAN;
ALTER TABLE lineorder_widetable ADD COLUMN q33 BOOLEAN;
ALTER TABLE lineorder_widetable ADD COLUMN q34 BOOLEAN;
ALTER TABLE lineorder_widetable ADD COLUMN q41 BOOLEAN;
ALTER TABLE lineorder_widetable ADD COLUMN q42 BOOLEAN;
ALTER TABLE lineorder_widetable ADD COLUMN q43 BOOLEAN;

UPDATE lineorder_widetable
SET q11 = (d_year = 1993
  AND lo_discount BETWEEN 1 AND 3
  AND lo_quantity < 25);

UPDATE lineorder_widetable
SET q12 = (d_yearmonthnum = 199401
  AND lo_discount BETWEEN 4 AND 6
  AND lo_quantity BETWEEN 26 AND 35);

UPDATE lineorder_widetable
SET q13 = (d_weeknuminyear = 6
  AND d_year = 1994
  AND lo_discount BETWEEN 5 AND 7
  AND lo_quantity BETWEEN 36 AND 40);

UPDATE lineorder_widetable
SET q21 = (p_category = 'MFGR#12'
  AND s_region = 'AMERICA');

UPDATE lineorder_widetable
SET q22 = (p_brand1 BETWEEN 'MFGR#2221' AND 'MFGR#2228'
  AND s_region = 'ASIA');

UPDATE lineorder_widetable
SET q23 = (p_brand1 = 'MFGR#2221'
  AND s_region = 'EUROPE');

UPDATE lineorder_widetable
SET q31 = (c_region = 'ASIA'
  AND s_region = 'ASIA'
  AND d_year >= 1992
  and d_year <= 1997);

UPDATE lineorder_widetable
SET q32 = (c_nation = 'UNITED STATES'
  AND s_nation = 'UNITED STATES'
  AND d_year >= 1992
  and d_year <= 1997);

UPDATE lineorder_widetable
SET q33 = ((c_city = 'UNITED KI1' OR c_city = 'UNITED KI5')
  AND (s_city = 'UNITED KI1' OR s_city = 'UNITED KI5')
  AND d_year >= 1992
  AND d_year <= 1997);

UPDATE lineorder_widetable
SET q34 = ((c_city = 'UNITED KI1' OR c_city = 'UNITED KI5')
  AND (s_city = 'UNITED KI1' OR s_city = 'UNITED KI5')
  AND d_yearmonth = 'Dec1997');

UPDATE lineorder_widetable
SET q41 = (c_region = 'AMERICA'
  AND s_region = 'AMERICA'
  AND (p_mfgr = 'MFGR#1' OR p_mfgr = 'MFGR#2'));

UPDATE lineorder_widetable
SET q42 = (c_region = 'AMERICA'
  AND s_region = 'AMERICA'
  AND (d_year = 1997 OR d_year = 1998)
  AND (p_mfgr = 'MFGR#1' OR p_mfgr = 'MFGR#2'));

UPDATE lineorder_widetable
SET q43 = (c_region = 'AMERICA'
  AND s_nation = 'UNITED STATES'
  AND (d_year = 1997 OR d_year = 1998)
  AND p_category = 'MFGR#14');
