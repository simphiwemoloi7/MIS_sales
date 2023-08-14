 

  --EDA for MIS Data--


  --Number of records in the dataset--

  SELECT count(*) as 'Total Records'

  FROM [MIS].[dbo].[Sales_Data]



  --Number of columns in the dataset--

SELECT COUNT(*) AS 'column_count'
   FROM information_schema.columns
   WHERE table_name = 'Sales_Data';


	--Timeline of the dataset--

SELECT min(Year([Order Date])) as 'From(Year)'
      ,max(Year([Order Date])) as 'To(Year)'
	  ,((max(Year([Order Date])))-(min(Year([Order Date])))+1) as 'Timeline(Years)'
FROM [MIS].[dbo].[Sales_Data]

    --geopraphical overview of the dataset--

SELECT (count(DISTINCT [Country])) as '# Of Countries'
      ,(count(DISTINCT [State])) as '# of States'
	  ,(count(DISTINCT [City])) as '# Of Cities'

FROM [MIS].[dbo].[Sales_Data]


   --product overview of the dataset--

SELECT (count(DISTINCT [Category])) as '# Of Categries'
      ,(count(DISTINCT [Sub-Category])) as '# of Sub-Categories'
	  ,(count(DISTINCT [Product Name])) as '# Of Products'

FROM [MIS].[dbo].[Sales_Data]


  --check Order/Ship date accuracy(ensure there's Ship Date that falls before the Order Date--
  SELECT [Order ID]
    FROM [MIS].[dbo].[Sales_Data]

	WHERE [Ship Date]<[Order Date]

