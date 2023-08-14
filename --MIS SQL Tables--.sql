--MIS data queries for multiple tables--

--sales specific data with additional calculated columns---

--Order Details--

SELECT
      [Order ID]
      ,[Order Date]
      ,[Product Name]
      ,[Sales]
	  ,[Quantity]
      ,[Discount]
      ,[Profit]
	  ,([sales]/[Quantity]) as 'Sale_Per_Item'
	  ,([Discount]/[Quantity]) as 'Discount_Per_Item'
	  ,([Profit]/[Quantity]) as 'Profit_Per_Item'
	  ,(([sales]/[Quantity])-([Profit]/[Quantity])) as 'Cost_of_sale'
	  ,(([Profit]/[Quantity])/(([sales]/[Quantity])-([Profit]/[Quantity]))) as Profit_Margin

  FROM [MIS].[dbo].[Sales_Data]



--Sales summary table--

SELECT

 SUM([Sales]) as 'Total Sales'
,SUM([Quantity]) as 'Total_Quantity'
,SUM([Profit]) as 'Total_Profit'
,SUM(([Sales]/[Quantity])) as 'Total_Sales(PI)'
,SUM(([Profit]/[Quantity])) as 'Total_Profit(PI)'
,AVG(([Sales]/[Quantity])) as 'AVG_Sale_Per_Item'
,AVG([Quantity]) as 'AVG_Sales_Quantity'
,AVG(([Profit]/[Quantity])) as 'AVG_Profit_Per_Item'

,AVG(DATEDIFF(DAY,[Order Date],[Ship Date])) as 'AVG_days_to_ship'



 FROM [MIS].[dbo].[Sales_Data]



 --shipping data with additional calculated column(s)--

--Shipping Details--

 SELECT
       [Row ID]
      ,[Order ID]
      ,[Order Date]
      ,[Ship Date]
      ,[Ship Mode]
	  ,DATEDIFF(DAY,[Order Date],[Ship Date]) as 'Days_To_Ship'

 FROM [MIS].[dbo].[Sales_Data]


--Customer details--

SELECT 
       [Row ID]
	  ,[Customer ID]
      ,[Customer Name]
      ,[Segment]
      ,[Country]
      ,[City]
      ,[State]
      ,[Postal Code]
      ,[Region]

FROM [MIS].[dbo].[Sales_Data]

ORDER BY [Customer ID] asc



--Product details--

SELECT

	  [Product ID]
     ,[Category]
     ,[Sub-Category]
     ,[Product Name]

FROM [MIS].[dbo].[Sales_Data]