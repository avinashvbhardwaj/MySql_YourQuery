-- Specify the schema
USE curious_coder_advance_sql;

--
-- Select all data from table students table
--
SELECT * FROM students;

-- ---------------------------------------------------------
-- BIG 6 CLAUSES
-- The Big 6 are the foundation clauses used in SQL queries:
-- The clauses must always be written in this order.
--
SELECT grade_level,					--	Column(s) to display
		AVG(gpa)  AS avg_gpa
FROM students						--	Table(s) to pull data from
WHERE school_lunch = 'Yes'			--	Criteria to filter the rows by
GROUP BY grade_level				--	Columns(s) to group the rows by
HAVING avg_gpa < 3.3				--	Criteria to filter the grouped rows by
ORDER BY grade_level;				--	Column(s) to sort values by

