/* 
 * Description: Customer data, including customer name, email, and city, from the customer dimension table called DimCustomer.
 *
 * Overview of Cleanup:
 * Clean up what is needed in the table by excluding columns not needed by using --.
 * Then renamed kept columns using AS command.
 * Added CASE to clarify Male and Female genders.
*/

SELECT
c.[CustomerKey] AS "Customer Key"
--,[GeographyKey]
--,[CustomerAlternateKey]
--,[Title]
,c.[FirstName] AS "First Name"
--,[MiddleName]
,c.[LastName] AS "Last Name"
,c.[LastName] + ', ' + c.[FirstName] AS "Full Name"
--,[NameStyle]
--,[BirthDate]
--,[MaritalStatus]
--,[Suffix]
,CASE
	WHEN c.[Gender] = 'M' THEN 'Male'
	WHEN c.[Gender] = 'F' THEN 'Female'
	ELSE 'NA'
END AS Gender
,c.[EmailAddress] AS Email
--,[YearlyIncome]
--,[TotalChildren]
--,[NumberChildrenAtHome]
--,[EnglishEducation]
--,[SpanishEducation]
--,[FrenchEducation]
--,[EnglishOccupation]
--,[SpanishOccupation]
--,[FrenchOccupation]
--,[HouseOwnerFlag]
--,[NumberCarsOwned]
--,[AddressLine1]
--,[AddressLine2]
--,[Phone]
,c.[DateFirstPurchase] AS "Date First Purchase"
--,[CommuteDistance]
,g.[City] AS "City" -- pulled from DimGeography table

-- Call this table c for short
FROM [AdventureWorksDW2022].[dbo].[DimCustomer] AS c
-- JOIN c to DimGeography table, called g for short
LEFT JOIN [AdventureWOrksDW2022].[dbo].[DimGeography] AS g ON g.GeographyKey = c.GeographyKey

-- Order the list by the CustomerKey in ascending order
ORDER BY
c.[CustomerKey] ASC