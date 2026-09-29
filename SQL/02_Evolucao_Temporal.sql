-- Receita por ano

SELECT 
	YEAR(header.OrderDate) as Ano,
	SUM(detail.LineTotal) as Receita 

FROM sales.SalesOrderDetail as detail
	LEFT JOIN sales.SalesOrderHeader as header
	on detail.SalesOrderID = header.SalesOrderID
Group By YEAR(header.OrderDate)
Order by YEAR(header.OrderDate) asc

-- Pedidos por ano

  SELECT 
	YEAR(header.OrderDate) as Ano,
	COUNT(DISTINCT header.SalesOrderID) as Pedidos 

FROM sales.SalesOrderDetail as detail
	LEFT JOIN sales.SalesOrderHeader as header
	on detail.SalesOrderID = header.SalesOrderID
Group By YEAR(header.OrderDate)
Order by YEAR(header.OrderDate) asc

-- Receita por mês

SELECT 
	YEAR(header.OrderDate) as Ano,
	MONTH(header.OrderDate) as Mes,
	SUM(detail.LineTotal) as Receita 

FROM sales.SalesOrderDetail as detail
	LEFT JOIN sales.SalesOrderHeader as header
	on detail.SalesOrderID = header.SalesOrderID
Group By YEAR(header.OrderDate), MONTH(header.OrderDate)
Order by YEAR(header.OrderDate), MONTH(header.OrderDate) asc
