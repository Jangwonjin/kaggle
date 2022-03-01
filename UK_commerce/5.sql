SELECT *
FROM (
    SELECT a.StockCode, a.QTY_2011, b.QTY_2010, a.QTY_2011/b.QTY_2010-1 increase_rate
	FROM (
		-- 2011년도
		SELECT StockCode, sum(Quantity) as QTY_2011
		FROM data.uk_commerce
		WHERE year(InvoiceDate) = 2011
		GROUP BY 1
		) a 
	LEFT JOIN (
		-- 2010년도
		SELECT StockCode, sum(Quantity) as QTY_2010
		FROM data.uk_commerce
		WHERE year(InvoiceDate) = 2010
		GROUP BY 1
		) b
	ON a.StockCode = b.StockCode
) T
WHERE increase_rate >= 1.2;
