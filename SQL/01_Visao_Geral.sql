-- Quantidade total de pedidos
SELECT 
COUNT(SalesOrderID) as Pedidos
FROM sales.SalesOrderHeader;

-- Quantidade de clientes distintos
SELECT 
COUNT (Distinct CustomerID) as ClientesDistintos
FROM sales.SalesOrderHeader;

-- Período coberto pela base
SELECT
	MIN(OrderDate) as PeríodoMínimo,
	MAX(OrderDate) as PeríodoMáximo
FROM Sales.SalesOrderHeader

-- Receita total e ticket médio
SELECT
SUM(LineTotal) as Receita,
SUM(LineTotal) / NULLIF (Count(Distinct SalesOrderID), 0) as TicketMedio
FROM Sales.salesorderdetail
