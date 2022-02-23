-- Q1 
SELECT Country, 
	   StockCode, 
       count(DISTINCT CustomerID) as BU, 
       sum(Quantity*UnitPrice) as Total
FROM challenge_final.final
GROUP BY 1, 2;