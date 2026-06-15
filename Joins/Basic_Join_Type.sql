--	Connect to database (MYSQL)
USE curious_coder_advance_sql;

--	1.	Basic Joins
SELECT	*
FROM	happiness_scores;

SELECT	*
FROM	country_stats;

--	2.	CROSS JOIN
SELECT	*
FROM	happiness_scores
		JOIN	country_stats;

--	3.	INNER JOIN
--		Returns records that exist in both tables, and ecludes unmatched records from either table
SELECT	happiness_scores.year, happiness_scores.country, happiness_scores.happiness_score,
		country_stats.country, country_stats.continent
FROM	happiness_scores
		INNER	JOIN	country_stats
        ON 	happiness_scores.country	=	country_stats.country;
        
--	4.	LEFT JOIN
--		Returns ALL records from the LEFT table, and any matching records from the RIGHT table
SELECT	hs.year, hs.country, hs.happiness_score,
		cs.country, cs.continent
FROM	happiness_scores AS hs
		LEFT	JOIN	country_stats AS cs
        ON 	hs.country	=	cs.country;

--	5.	RIGHT JOIN
--		Returns ALL records from the RIGHT table, and any matching records from the LEFT table
-- 		This is less often used in practice; switch the tables and use a LEFT JOIN instead
SELECT	hs.year, hs.country, hs.happiness_score,
		cs.country, cs.continent
FROM	happiness_scores AS hs
		RIGHT	JOIN	country_stats AS cs
        ON 	hs.country	=	cs.country;
        
--	6.	FULL OUTER
--		Returns ALL records from both tables, including non-matching records
--	While INNER and LEFT JOINs are supporteed in all RDBMS RIGHT and FULL OUTER are not
--	SQlite does not support RIGHT JOINs, and MYSQL and SQLite do not support FULL OUTER JOINs


--	ASSIGNMENT: BASIC JOINS
--	There is a discrepancy between our orders and product tables in the database
--	Could you use your join knowledge to figure out which products exists in one table, but not the other ?

--	SOLUTION
--	1.	select both tables individualy
SELECT	product_id, product_name, factory, division, unit_price
FROM	products;
SELECT	transaction_id, customer_id, order_id, order_date, product_id, units
FROM	orders;

--	JOIN both

SELECT	
		p.product_id, p.product_name, o.product_id AS product_id_in_orders
FROM	products p
		LEFT JOIN	orders o
		ON		p.product_id	=	o.product_id
WHERE	o.product_id IS NULL;