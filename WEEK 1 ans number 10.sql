WITH Managerdetails AS (
    SELECT 
        p.BusinessEntityID,
        p.FirstName + ' ' + p.LastName AS Name,
        e.JobTitle,
        d.Name AS DeptName,
        d.DepartmentID
    FROM 
        Person.Person p
    JOIN 
        HumanResources.Employee e
        ON p.BusinessEntityID = e.BusinessEntityID
    JOIN 
        HumanResources.EmployeeDepartmentHistory edh
        ON e.BusinessEntityID = edh.BusinessEntityID
    JOIN 
        HumanResources.Department d
        ON edh.DepartmentID = d.DepartmentID
    WHERE 
        e.JobTitle LIKE '%manager%'
),
Employeedetails AS (
    SELECT 
        p.BusinessEntityID AS EmployeeId,
        p.FirstName + ' ' + p.LastName AS EmployeeName,
        e.JobTitle,
        d.Name AS DeptName,
        d.DepartmentID
    FROM 
        Person.Person p
    JOIN 
        HumanResources.Employee e
        ON p.BusinessEntityID = e.BusinessEntityID
    JOIN 
        HumanResources.EmployeeDepartmentHistory edh
        ON e.BusinessEntityID = edh.BusinessEntityID
    JOIN 
        HumanResources.Department d
        ON edh.DepartmentID = d.DepartmentID
    WHERE 
        e.JobTitle NOT LIKE '%manager%'
)
SELECT DISTINCT
    ed.EmployeeName,
    ed.JobTitle AS EmployeeJobTitle,
    md.Name AS ManagerName,
    md.JobTitle AS ManagerJobTitle
FROM 
    Employeedetails ed
JOIN 
    Managerdetails md
ON 
    ed.DepartmentID = md.DepartmentID;
