-- Retention rate
WITH RetentionRate AS (
	SELECT count(b.CustomerID)/count(a.CustomerID) as RetentionRate
	FROM (
		SELECT DISTINCT CustomerID
		FROM challenge_final.final
		WHERE year(InvoiceDate) = 2010
	) a 
	LEFT JOIN (
		SELECT DISTINCT CustomerID
		FROM challenge_final.final
		WHERE year(InvoiceDate) = 2011
	) b
	ON a.CustomerID = b.CustomerID),
-- ARPPU
    ARPPU AS (
		SELECT sum(Quantity*UnitPrice)/count(DISTINCT CustomerID) as ARPPU
		FROM challenge_final.final
		WHERE year(InvoiceDate) = 2011),
-- 2011년 구매자수
    BU_2011 AS (
		SELECT count(DISTINCT CustomerID) as BU_2011
		FROM challenge_final.final
		WHERE year(InvoiceDate) = 2011),
-- 2012년 구매자수
	BU_2012 AS (
		SELECT B.BU_2011 * R.RetentionRate as BU_2012
        FROM RetentionRate R, BU_2011 B),
-- 2012년 예상매출
	Expected_ARPPU_2012 AS (
		SELECT B.BU_2012 * A.ARPPU as Expected_ARPPU_2012
        FROM BU_2012 B, ARPPU A),
-- 2011년 총매출액 
	Total_2011 AS (
		SELECT sum(Quantity * UnitPrice) as Total_2011
        FROM challenge_final.final
        WHERE year(InvoiceDate) = 2011)
        
SELECT (e.Expected_ARPPU_2012 + t.Total_2011) / b.BU_2011 as LTV
FROM Expected_ARPPU_2012 e, Total_2011 t, BU_2011 b;
