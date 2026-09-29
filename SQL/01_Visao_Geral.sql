-- Quantidade total de pedidos

Select 
Count(SalesOrderID) as Pedidos

from sales.SalesOrderHeader;
