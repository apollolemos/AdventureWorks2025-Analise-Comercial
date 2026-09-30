-- Receita, pedidos e ticket médio por território

Select 
	territory.TerritoryID,
	Territory.Name,
	SUM(detail.linetotal) as Receita,
	Count(Distinct header.salesorderId) as Pedidos,
	SUM(detail.linetotal) / Count(Distinct header.salesorderId) as TicketMedio

From Sales.SalesOrderDetail as detail
LEFT JOIN sales.SalesOrderHeader as header
on detail.SalesOrderID = header.SalesOrderID
LEFT JOIN sales.SalesTerritory as territory
on header.TerritoryID = territory.TerritoryID

Group by territory.TerritoryID, Territory.Name, Territory.CountryRegionCode
Order by SUM(detail.linetotal) desc
