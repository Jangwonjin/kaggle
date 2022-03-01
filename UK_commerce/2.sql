SELECT *, ROW_NUMBER() OVER(ORDER BY QTY DESC) RNK
FROM (
	SELECT StockCode, sum(Quantity) as QTY
	FROM challenge_final.final
	GROUP BY 1
) t;

-- 가장 많이 판매된 상품 2개: 84077, 85123A
CREATE TABLE challenge_final.c_list AS
SELECT CustomerID
FROM challenge_final.final
GROUP BY 1
HAVING MAX(CASE WHEN StockCode = '84077' THEN 1 ELSE 0 END) = 1
AND MAX(CASE WHEN StockCode = '85123A' THEN 1 ELSE 0 END) = 1;

SELECT DISTINCT StockCode, sum(Quantity) as QTY
FROM challenge_final.final
WHERE CustomerID IN (
	SELECT CustomerID
    FROM challenge_final.c_list
) AND StockCode NOT IN ('84077', '85123A')
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
