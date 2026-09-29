-- Top 50 clientes por receita
SELECT Top 50
	header.CustomerID as Clientes,
	SUM(detail.linetotal) as ReceitaPorCliente

FROM Sales.SalesOrderDetail as detail
LEFT JOIN sales.SalesOrderHeader as header
on detail.SalesOrderID = header.SalesOrderID

GROUP BY header.CustomerID
ORDER BY SUM(detail.linetotal) desc

-- Participação dos Top 50 clientes na receita total

With Top50Clientes as (
Select Top 50
	header.CustomerID as Clientes,
	SUM(detail.linetotal) as ReceitaPorCliente
From Sales.SalesOrderDetail as detail
left join sales.SalesOrderHeader as header
on detail.SalesOrderID = header.SalesOrderID
Group By header.CustomerID
order By SUM(detail.linetotal) desc
),

ReceitaTotal as (
Select 
SUM(LineTotal) AS ReceitaBrutaTotal
From Sales.SalesOrderDetail
)

Select
SUM(Top50Clientes.ReceitaporCliente) as ReceitaTOP50,
ReceitaTotal.ReceitaBrutaTotal,
(SUM(Top50Clientes.ReceitaporCliente)/ReceitaTotal.ReceitaBrutaTotal)*100 as PercentualReceitaTOP50
From Top50Clientes
Cross Join ReceitaTotal
Group By ReceitaTotal.ReceitaBrutaTotal

