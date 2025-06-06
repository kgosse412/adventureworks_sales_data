/* 
 * Clean up what is needed in the table by excluding columns not needed by using --.
 * Then rename kept columns using AS command.
 * Added ISNULL to replace NULL status values with Outdated.
*/

SELECT
p.[ProductKey] AS "Product Key"
,p.[ProductAlternateKey] AS "Product Item Code"
--,[ProductSubcategoryKey]
--,[WeightUnitMeasureCode]
--,[SizeUnitMeasureCode]
,p.[EnglishProductName] AS "Product Name"
,pc.[EnglishProductCategoryName] AS "Product Category" -- Pulled from DimProductCategory
,ps.[EnglishProductSubcategoryName] AS "Product Subcategory" -- Pulled from DimProductSubcategory
--,[SpanishProductName]
--,[FrenchProductName]
--,[StandardCost]
--,[FinishedGoodsFlag]
,p.[Color] AS "Product Color"
--,[SafetyStockLevel]
--,[ReorderPoint]
--,[ListPrice]
,p.[Size] AS "Product Size"
--,[SizeRange]
--,[Weight]
--,[DaysToManufacture]
,p.[ProductLine] AS "Product Line"
--,[DealerPrice]
--,[Class]
--,[Style]
,p.[ModelName] AS "Product Model Name"
--,[LargePhoto]
,p.[EnglishDescription] AS "Product Description"
--,[FrenchDescription]
--,[ChineseDescription]
--,[ArabicDescription]
--,[HebrewDescription]
--,[ThaiDescription]
--,[GermanDescription]
--,[JapaneseDescription]
--,[TurkishDescription]
--,[StartDate]
--,[EndDate]
,ISNULL(p.[Status], 'Outdated') AS "Product Status"

FROM [AdventureWorksDW2022].[dbo].[DimProduct] AS p
-- JOIN p to DimProductSubcategory table, called ps for short
LEFT JOIN [AdventureWorksDW2022].[dbo].[DimProductSubcategory] AS ps ON ps.[ProductSubcategoryKey] = p.[ProductSubcategoryKey]
-- JOIN ps to DimProductCategory, called pc for short
LEFT JOIN [AdventureWorksDW2022].[dbo].[DimProductCategory] AS pc ON pc.[ProductCategoryKey] = ps.[ProductCategoryKey]

-- Order the list by ProductKey in ascending order
ORDER BY
p.[ProductKey] ASC
