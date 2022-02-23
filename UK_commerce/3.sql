SELECT a.Country, 
       year(a.InvoiceDate) as Y, 
       count(DISTINCT b.CustomerID)/count(DISTINCT a.CustomerID) as RetentionRate
FROM (
	SELECT DISTINCT Country, InvoiceDate, CustomerID
	FROM data.uk_commerce
) a
LEFT JOIN (
	SELECT DISTINCT Country, InvoiceDate, CustomerID
        FROM data.uk_commerce
) b
ON year(a.InvoiceDate) = year(b.InvoiceDate) - 1
AND a.Country = b.Country
AND a.CustomerID = b.CustomerID
GROUP BY 1, 2
ORDER BY 1, 2;
