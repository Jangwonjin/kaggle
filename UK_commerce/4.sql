SELECT t.Country, 
       sum(CASE WHEN cnt = 1 THEN 1 ELSE 0 END) / sum(1) as BounceRate
FROM (
	SELECT Country, CustomerID, count(DISTINCT InvoiceDate) as cnt
	FROM data.uk_commerce
	GROUP BY 1, 2
) t
GROUP BY 1
ORDER BY 1;
