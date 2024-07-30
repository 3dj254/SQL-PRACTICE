Select Country, Gender, Sum(Salary) as TotalSalary
From Employees  
Group By Country, Gender

UNION ALL

Select Country, NULL, Sum(Salary) as TotalSalary
From Employees  
Group By Country

UNION ALL

Select NULL, Gender, Sum(Salary) as TotalSalary
From Employees  
Group By Gender

union all 

Select NULL, Null, Sum(Salary) as TotalSalary
From Employees  


Select Country, Gender, Sum(Salary) TotalSalary
From Employees
Group BY
      GROUPING SETS
      (
            (Country, Gender), -- Sum of Salary by Country and Gender
            (Country),               -- Sum of Salary by Country
            (Gender) ,               -- Sum of Salary by Gender
            ()                             -- Grand Total
      )

