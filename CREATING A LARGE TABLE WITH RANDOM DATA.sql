-- If Table exists drop the tables
IF EXISTS (SELECT * FROM information_schema.tables WHERE table_name = 'tblProductSales')
BEGIN
    DROP TABLE tblProductSales
END

IF EXISTS (SELECT * FROM information_schema.tables WHERE table_name = 'tblProducts')
BEGIN
    DROP TABLE tblProducts
END

-- Recreate tables
CREATE TABLE tblProducts
(
    [Id] INT IDENTITY PRIMARY KEY,
    [Name] NVARCHAR(50),
    [Description] NVARCHAR(250)
)

CREATE TABLE tblProductSales
(
    Id INT IDENTITY PRIMARY KEY,
    ProductId INT FOREIGN KEY REFERENCES tblProducts(Id),
    UnitPrice INT,
    QuantitySold INT
)

-- Insert Sample data into tblProducts table
DECLARE @Id INT
SET @Id = 1

WHILE (@Id <= 300000)
BEGIN
    INSERT INTO tblProducts ([Name], [Description]) 
    VALUES ('Product - ' + CAST(@Id AS NVARCHAR(20)), 'Product - ' + CAST(@Id AS NVARCHAR(20)) + ' Description')
    
    PRINT @Id
    SET @Id = @Id + 1
END

-- Declare variables to hold a random ProductId, UnitPrice, and QuantitySold
DECLARE @RandomProductId INT
DECLARE @RandomUnitPrice INT
DECLARE @RandomQuantitySold INT

-- Declare and set variables to generate random values
DECLARE @UpperLimitForProductId INT = 100000
DECLARE @LowerLimitForProductId INT = 1

DECLARE @UpperLimitForUnitPrice INT = 100
DECLARE @LowerLimitForUnitPrice INT = 1

DECLARE @UpperLimitForQuantitySold INT = 10
DECLARE @LowerLimitForQuantitySold INT = 1

-- Insert Sample data into tblProductSales table
DECLARE @Counter INT
SET @Counter = 1

WHILE (@Counter <= 450000)
BEGIN
    SELECT @RandomProductId = ROUND(((@UpperLimitForProductId - @LowerLimitForProductId) * RAND() + @LowerLimitForProductId), 0)
    SELECT @RandomUnitPrice = ROUND(((@UpperLimitForUnitPrice - @LowerLimitForUnitPrice) * RAND() + @LowerLimitForUnitPrice), 0)
    SELECT @RandomQuantitySold = ROUND(((@UpperLimitForQuantitySold - @LowerLimitForQuantitySold) * RAND() + @LowerLimitForQuantitySold), 0)
    
    INSERT INTO tblProductSales (ProductId, UnitPrice, QuantitySold) 
    VALUES (@RandomProductId, @RandomUnitPrice, @RandomQuantitySold)

    PRINT @Counter
    SET @Counter = @Counter + 1
END

SELECT * FROM tblProducts
SELECT * FROM tblProductSales


