SELECT Country, 
       StockCode, 
       count(DISTINCT CustomerID) as BU, 
       sum(Quantity*UnitPrice) as Total
FROM data.uk_commerce
GROUP BY 1, 2;
