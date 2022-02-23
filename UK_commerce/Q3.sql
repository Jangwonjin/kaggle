-- Q3
SELECT a.Country, 
	   year(a.InvoiceDate) as Y, 
       count(DISTINCT b.CustomerID)/count(DISTINCT a.CustomerID) as RetentionRate
FROM (
	SELECT DISTINCT Country, InvoiceDate, CustomerID
	FROM challenge_final.final
    ) a
LEFT JOIN (
	SELECT DISTINCT Country, InvoiceDate, CustomerID
    FROM challenge_final.final
    ) b
ON year(a.InvoiceDate) = year(b.InvoiceDate) - 1
AND a.Country = b.Country
AND a.CustomerID = b.CustomerID
GROUP BY 1, 2
ORDER BY 1, 2;