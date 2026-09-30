-- Top 10 produtos por receita

SELECT top 10
	detail.productID,
	prod.Name,
	SUM(detail.linetotal) as ReceitaPorProduto
FROM sales.salesorderheader as header
LEFT JOIN sales.SalesOrderDetail as detail
on header.SalesOrderID = detail.SalesOrderID
LEFT JOIN Production.Product as Prod
on detail.ProductID = prod.ProductID
GROUP BY detail.productID, prod.Name
ORDER BY SUM(detail.linetotal) desc

-- Receita por categoria

SELECT 
	prodcat.ProductCategoryID,
	prodcat.Name,
	SUM(detail.LineTotal) as ReceitaPorCategoria

FROM sales.salesorderheader as header
LEFT JOIN sales.SalesOrderDetail as detail
on header.SalesOrderID = detail.SalesOrderID
LEFT JOIN Production.Product as Prod
on detail.ProductID = prod.ProductID
LEFT JOIN Production.ProductSubcategory as prodsub
on prod.ProductSubcategoryID = prodsub.ProductSubcategoryID
LEFT JOIN Production.ProductCategory as prodcat
on prodsub.ProductCategoryID = prodcat.ProductCategoryID

GROUP BY prodcat.ProductCategoryID, prodcat.Name
ORDER BY SUM(detail.LineTotal
