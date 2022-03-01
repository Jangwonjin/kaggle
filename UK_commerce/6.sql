CREATE TABLE data.NorO_list AS
SELECT t.CustomerID,
	   CASE WHEN year(t.MinDate) = '2011' THEN 'New' ELSE 'Original' END NorO 
FROM (
	SELECT CustomerID, min(InvoiceDate) as MinDate
	FROM data.uk_commerce
	GROUP BY 1
) t;

SELECT month(InvoiceDate) as M, sum(Quantity*UnitPrice) as Total
FROM data.uk_commerce
WHERE CustomerID IN (
	SELECT CustomerID
    FROM data.NorO_list
    WHERE NorO = 'Original'
) AND year(InvoiceDate) = 2011
GROUP BY 1
ORDER BY 1;

SELECT month(InvoiceDate) as M, sum(Quantity*UnitPrice) as Total
FROM data.uk_commerce
WHERE CustomerID IN (
	SELECT CustomerID
    FROM data.NorO_list
    WHERE NorO = 'New'
) AND year(InvoiceDate) = 2011
GROUP BY 1
ORDER BY 1;
