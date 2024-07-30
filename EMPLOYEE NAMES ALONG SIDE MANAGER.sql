--finding manager details
WITH managerdetails AS (
    SELECT 
        ec.BusinessEntityID,
        ec.Name,
        ec.JobTitle
    FROM 
        (SELECT 
             p.BusinessEntityID,
             p.FirstName + ' ' + p.LastName AS Name,
             e.JobTitle
         FROM 
             Person.Person p
         JOIN 
             HumanResources.Employee e
         ON 
             p.BusinessEntityID = e.BusinessEntityID) ec
    JOIN 
        HumanResources.EmployeeDepartmentHistory edh
    ON 
        ec.BusinessEntityID = edh.BusinessEntityID
WHERE 
        ec.JobTitle LIKE '%Manager%'
)
SELECT 
    md.BusinessEntityID,
    md.Name,
    md.JobTitle,
    vd.DeptName
FROM 
    managerdetails md
INNER JOIN 
    vWDEPT vd
ON 
    md.BusinessEntityID = vd.BusinessEntityID;



-- employees details
WITH managerdetails AS (
    SELECT 
        ec.BusinessEntityID,
        ec.Name,
        ec.JobTitle
    FROM 
        (SELECT 
             p.BusinessEntityID,
             p.FirstName + ' ' + p.LastName AS Name,
             e.JobTitle
         FROM 
             Person.Person p
         JOIN 
             HumanResources.Employee e
         ON 
             p.BusinessEntityID = e.BusinessEntityID) ec
    JOIN 
        HumanResources.EmployeeDepartmentHistory edh
    ON 
        ec.BusinessEntityID = edh.BusinessEntityID
    WHERE 
        ec.JobTitle  not LIKE '%Manager%'
)
SELECT 
    md.BusinessEntityID,
    md.Name,
    md.JobTitle,
    vd.DeptName
FROM 
    managerdetails md
INNER JOIN 
    vWDEPT vd
ON 
    md.BusinessEntityID = vd.BusinessEntityID;




	-- CTE for Manager Details
WITH managerdetail AS (
    SELECT 
        ec.BusinessEntityID AS ManagerID,
        ec.Name AS ManagerName,
        ec.JobTitle AS ManagerJobTitle,
        edh.DepartmentID
		,NTILE(6) over(partition by(ec.BusinessEntityID) order by (edh.DepartmentID) ) cn
    FROM 
        (SELECT 
             p.BusinessEntityID,
             p.FirstName + ' ' + p.LastName AS Name,
             e.JobTitle
         FROM 
             Person.Person p
         JOIN 
             HumanResources.Employee e
         ON 
             p.BusinessEntityID = e.BusinessEntityID) ec
    JOIN 
        HumanResources.EmployeeDepartmentHistory edh
    ON 
        ec.BusinessEntityID = edh.BusinessEntityID
    WHERE 
        ec.JobTitle LIKE '%Manager%'
), managerdetails as (
		select * from managerdetail where cn=1
),
-- CTE for Employee Details
employeedetail AS (
    SELECT 
        ec.BusinessEntityID AS EmployeeID,
        ec.Name AS EmployeeName,
        ec.JobTitle AS EmployeeJobTitle,
        edh.DepartmentID
				,NTILE(6) over(partition by(ec.BusinessEntityID) order by (edh.DepartmentID) ) cn

    FROM 
        (SELECT 
             p.BusinessEntityID,
             p.FirstName + ' ' + p.LastName AS Name,
             e.JobTitle
         FROM 
             Person.Person p
         JOIN 
             HumanResources.Employee e
         ON 
             p.BusinessEntityID = e.BusinessEntityID) ec
    JOIN 
        HumanResources.EmployeeDepartmentHistory edh
    ON 
        ec.BusinessEntityID = edh.BusinessEntityID
    WHERE 
        ec.JobTitle NOT LIKE '%Manager%'
), employeedetails as(
	select * from employeedetail where cn=1
)
-- Select Employees along with their Managers
SELECT DISTINCT
    ed.EmployeeName,
    ed.EmployeeJobTitle,
    md.ManagerName,
    md.ManagerJobTitle,
    vd.DeptName

	into #tmp
FROM 
    employeedetails ed
INNER JOIN 
    managerdetails md
ON 
    ed.DepartmentID = md.DepartmentID
INNER JOIN 
    vWDEPT vd
ON 
    ed.DepartmentID = vd.DepartmentID

	order by md.ManagerName, ed.EmployeeName


	--SELECT DISTINCT * FROM vWDEPT
	--order by BusinessEntityID

	select * from #tmp

	drop table #tmp