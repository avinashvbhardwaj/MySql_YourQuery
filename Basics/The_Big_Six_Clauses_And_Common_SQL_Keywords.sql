--	Specify the schema
--	Connect to database (MYSQL)
USE curious_coder_advance_sql;

--	1.	View the students table
--	Select all data from table `students`
SELECT	*
FROM	students;

--	2.	BIG 6 CLAUSES
--	The Big 6 are the foundation clauses used in SQL queries:
--	The clauses must always be written in this order.
--	The only required clause in a SQL query is the SELECT clause
SELECT grade_level,										--	Column(s) to display
		AVG(gpa)	AS	avg_gpa
FROM	students										--	Table(s) to pull data from
WHERE	school_lunch = 'Yes'							--	Criteria to filter the rows by
GROUP	BY grade_level									--	Columns(s) to group the rows by
HAVING	avg_gpa < 3.3									--	Criteria to filter the grouped rows by
ORDER	BY	grade_level;								--	Column(s) to sort values by

--	Common Keywords

--	3.	DISTINCT
SELECT	DISTINCT grade_level							--	returns unique values from grade_level column
FROM	students;

--						Aggregate functions like COUNT, SUM, AVG, MIN, MAX, are used to make calculations
--	4.	COUNT
SELECT	COUNT(DISTINCT grade_level)						--	the number of rows	
FROM	students;

--	5.	MIN AND MAX
--	Math operators include +, -, x, /, %
--	AS is used many places to rename
--	shortening the column name 
--	Intermediate table results
--	Aliasing Sub queries
SELECT	MAX(gpa)	-	MIN(gpa)	AS	gpa_range		--	MIN value column having, MAX value column having
FROM	students;

--	6.	AND
SELECT	*
FROM	students										--	Comparison Operator includes =, !=, <>, <, >, <=, >=
WHERE	grade_level	<	12
AND		school_lunch	=	'Yes';						--	Logical Operator includes AND, OR NOT

--						Comparison keywords include IN, LIKE, BETWEEN...AND, IS NULL
--	7.	IN
SELECT	 * 
FROM	 students
WHERE	 grade_level
IN		(10, 11, 12);									--	IN used to include the multiple values for filter

--	8.	IS NULL
SELECT	*
FROM	students
WHERE	email
IS	NULL;												--	retrieve NULL value rows

--	9.	IS NOT NULL
SELECT	*
FROM	students
WHERE	email
IS	NOT	NULL;											--	retrieve NOT NULL value rows


--	9.	LIKE
SELECT	 * 
FROM	 students
WHERE	 email
LIKE	'%.com';										--	LIKE used to find value based on %(is a wild card) position

--	10.	DESC
SELECT	 student_name, gpa
FROM	 students
ORDER BY	gpa	DESC;									--	DESC stands for "descending", the default order is ASC "ascending"

--	11.	LIMIT
--	(TOP in SQL Server and FETCH FIRST on Oracle)
SELECT	* 												--	specifies the number of rows in the output
FROM	students
LIMIT	10;												--	LIMITING/selecting first n rows here 10

--	12.	CASE
--	CASE statements use the following syntax to do IF-ELSE logic within SQL:
--	CASE	WHEN ... THEN ... WHEN ... THEN ... ELSE ... END
SELECT	student_name, grade_level,
		CASE	WHEN	grade_level	= 9		THEN	'Freshman'
				WHEN	grade_level	= 10	THEN	'Sophomore'
                WHEN	grade_level	= 11	THEN	'Junior'
                ELSE	'Senior'
		END AS student_class							--	This creates a new "student_class" column based on the grade level for each student
FROM	students;

