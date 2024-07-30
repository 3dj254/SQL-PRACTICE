	with managers  as(
		select distinct FirstName+' '+LastName Fullnames ,JobTitle --p.City
		,ntile(17)  over (order by JobTitle) Mid
FROM [HumanResources].[Employee] e
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = e.[BusinessEntityID]
    INNER JOIN [HumanResources].[EmployeeDepartmentHistory] edh 
    ON e.[BusinessEntityID] = edh.[BusinessEntityID] 
    INNER JOIN [HumanResources].[Department] d 
    ON edh.[DepartmentID] = d.[DepartmentID] 

		
		where JobTitle like '%Manager%'

		--order by JobTitle
	)
	,epmloyees as(
		
		select  FirstName+' '+LastName Fullnames ,JobTitle  ---, City
			FROM [HumanResources].[Employee] e
				INNER JOIN [Person].[Person] p
				ON p.[BusinessEntityID] = e.[BusinessEntityID]
				INNER JOIN [HumanResources].[EmployeeDepartmentHistory] edh 
				ON e.[BusinessEntityID] = edh.[BusinessEntityID] 
				INNER JOIN [HumanResources].[Department] d 
				ON edh.[DepartmentID] = d.[DepartmentID] 

		
					where JobTitle 	not like '%Manager%' and JobTitle not in ('Buyer','Janitor')

					--order by JobTitle
	) --, cte  aS(
	--select *
	--,    SUBSTRING(jobtitle, 1,LEN(LEFT(jobtitle, CHARINDEX(' ', jobtitle + ' ') )))             AS LengthBeforeFirstSpace

	
	--from managers
	--)

	--select * from cte
	, firstLayer as(
	select e.*
	, (select top 1  JobTitle  from managers m where e.JobTitle like '%'+ SUBSTRING(jobtitle, 1,LEN(LEFT(jobtitle, CHARINDEX(' ', jobtitle + ' ') )))  +'%'  
		) manager
	from epmloyees e
	--where e.JobTitle like '%engin%'
	)
	select * from firstLayer where manager is null and JobTitle  not like '%executive%' and jobtitle not like '%chief%' and jobtitle not like '%stock%'
	and jobtitle not like '%president%' aND jobtitle not like '%TOOL%'AND jobtitle not like '%SUPER%'

	order by JobTitle


--SELECT 
--    jobtitle,
--    LEN(LEFT(jobtitle, CHARINDEX(' ', jobtitle + ' ') - 1)) AS LengthBeforeFirstSpace
--FROM 
--    your_table_name;
