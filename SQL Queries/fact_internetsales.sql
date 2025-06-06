/* 
 * Clean up what is needed in the table by excluding columns not needed by using --.
 * Then renamed kept columns using AS command.
*/

SELECT
ints.[ProductKey] AS "Product Key"
,ints.[OrderDateKey] AS "Order Date Key"
,ints.[DueDateKey] AS "Due Date Key"
,ints.[ShipDateKey] AS "Ship Date Key"
,ints.[CustomerKey] AS "Customer Key"
--,[PromotionKey]
--,[CurrencyKey]
--,[SalesTerritoryKey]
,ints.[SalesOrderNumber] AS "Sales Order Num"
--,[SalesOrderLineNumber]
--,[RevisionNumber]
--,[OrderQuantity]
--,[UnitPrice]
--,[ExtendedAmount]
--,[UnitPriceDiscountPct]
--,[DiscountAmount]
--,[ProductStandardCost]
--,[TotalProductCost]
,ints.[SalesAmount] AS "Sales Amt"
--,[TaxAmt]
--,[Freight]
--,[CarrierTrackingNumber]
--,[CustomerPONumber]
--,[OrderDate]
--,[DueDate]
--,[ShipDate]

-- Call this table ints for short
FROM [AdventureWorksDW2022].[dbo].[FactInternetSales] as ints

-- Only grab the last 2 years of order data
WHERE
LEFT(ints.[OrderDateKey], 4) >= YEAR(GETDATE()) - 2

-- Order the list by OrderDateKey in ascending order
ORDER BY
[OrderDateKey] ASC
