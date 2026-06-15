--
--	Use Schema to connect
--
USE	`curious_coder_advance_sql`;

--
--	Table structure for table `employees`
--
DROP	TABLE	IF	EXISTS	`employees`;

CREATE	TABLE	`employees`	(
		`employee_id`	INT	PRIMARY	KEY	NOT	NULL,
		`employee_name`	varchar(100),
		`salary`	INT,
		`manager_id`	INT	DEFAULT	NULL
);

INSERT	INTO	employees	(employee_id,	employee_name,	salary,		manager_id)	VALUES	(1,	'Joe',	70000,	3);
INSERT	INTO	employees	(employee_id,	employee_name,	salary,		manager_id)	VALUES	(2,	'Hanry',80000,	4);
INSERT	INTO	employees	(employee_id,	employee_name,	salary,		manager_id)	VALUES	(3,	'Sam',	59000,	NULL);
INSERT	INTO	employees	(employee_id,	employee_name,	salary,		manager_id)	VALUES	(4,	'Max',	90000,	NULL);
INSERT	INTO	employees	(employee_id,	employee_name,	salary,		manager_id)	VALUES	(5,	'Ava',	85000,	NULL);
INSERT	INTO	employees	(employee_id,	employee_name,	salary,		manager_id)	VALUES	(6,	'Bob',	72000,	5);
INSERT	INTO	employees	(employee_id,	employee_name,	salary,		manager_id)	VALUES	(7,	'Cat',	59000,	5);
INSERT	INTO	employees	(employee_id,	employee_name,	salary,		manager_id)	VALUES	(8,	'Dan',	85000,	6);
commit;


--	Employees with the same salary 
SELECT	e1.employee_id,	e1.employee_name,	e1.salary,
		e2.employee_id,	e2.employee_name,	e2.salary
FROM	employees	e1 
		INNER		JOIN	employees	e2
		ON	e1.salary	=	e2.salary
WHERE	e1.employee_id	>	e2.employee_id;

--	Employees that have a greater salary 
SELECT	e1.employee_id,	e1.employee_name,	e1.salary,
		e2.employee_id,	e2.employee_name,	e2.salary
FROM	employees	e1 
		INNER		JOIN	employees	e2
		ON	e1.salary	>	e2.salary
ORDER	BY	e1.employee_id;

--	Employees  and their manager 
SELECT	e1.employee_id,	e1.employee_name,	e1.salary	AS employee_salary,
		e2.employee_id	AS manager_id,	e2.employee_name	AS	manager_name,
        e2.salary	AS	manager_salary
FROM	employees	e1 
		LEFT		JOIN	employees	e2
		ON	e1.manager_id	=	e2.employee_id
ORDER	BY	e1.employee_id;

--	Employees that have a greater salary than their manager
SELECT	e1.employee_id,	e1.employee_name,	e1.salary	AS employee_salary,
		e2.employee_id	AS manager_id,	e2.employee_name	AS	manager_name,
        e2.salary	AS	manager_salary
FROM	employees	e1 
		INNER		JOIN	employees	e2
		ON		e1.manager_id	=	e2.employee_id	AND	e1.salary	>	e2.salary;
        
--	ASSIGNMENT: BASIC JOINS
--	Find products which within 0.25 cents price unit

--	SOLUTION
--	1.	select product table
SELECT	p1.product_name,	p1.unit_price,
		p2.product_name,	p2.unit_price,
        p1.unit_price	-	p2.unit_price	AS	price_diff
FROM	products	p1
		INNER	JOIN	products	p2
        ON	p1.product_name	<>	p2.product_name
WHERE	p1.unit_price	-	p2.unit_price	BETWEEN	-0.25	AND	0.25
ORDER	BY	price_diff DESC;