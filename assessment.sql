/*
  write your SQL query below
  to run only a specific line press CTRL + Enter 
  
  Make sure the solution contains the keyword "__define-ocg__" in at least one comment in the code, and make sure at least one of the variable is named "varOcg". In this MySQL challenge, your query should return the names of the people who are reported to (excluding null values), the number of members that report to them, and the average age of those members as an integer. The rows should be ordered by the names in alphabetical order. Your output should look like the following table.
  
*/

SELECT DISTINCT
t2.ReportsTo
, COUNT(t1.ID) AS Members
, CEILING(AVG(t1.Age)) AS "Average Age"
FROM 
(SELECT DISTINCT
ID
, FirstName
, LastName
, ReportsTo
, Age
FROM maintable_VC2IW
GROUP BY ID
ORDER BY FirstName, LastName) AS t1
INNER JOIN
(SELECT DISTINCT
ReportsTo
FROM maintable_VC2IW
WHERE ReportsTo <> "null") AS t2 ON t1.ReportsTo = t2.ReportsTo
GROUP BY ReportsTo
ORDER BY ReportsTo


/*

********
BONEYARD
********

-- , CAST (AVG(t1.Age) AS DECIMAL(2,0)) AS Average_Age
SELECT CAST(1.000 AS DECIMAL(1,0))

-- SELECT CAST (1.000 AS Integer) check syntax...

-- 1 ReportsTo
-- 2 number of members that report to them
-- 3 average age of members As Integer
-- 4 Order By FirstName, LastName

ID	FirstName	LastName	ReportsTo	Position	Age
1	Daniel	Smith	Bob Boss	Engineer	25
2	Mike	White	Bob Boss	Contractor	22
3	Jenny	Richards	null	CEO	45
4	Robert	Black	Daniel Smith	Sales	22
5	Noah	Fritz	Jenny Richards	Assistant	30
6	David	S	Jenny Richards	Director	32
7	Ashley	Wells	David S	Assistant	25
8	Ashley	Johnson	null	Intern	25

SELECT * 
FROM maintable_VC2IW

-- , AVG(Age) AS Average_Age
-- , FirstName || "_" || LastName AS FullName

*/