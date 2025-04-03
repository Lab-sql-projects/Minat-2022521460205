USE ArtGalleryManagement;
SELECT * FROM Artists;
SELECT * FROM Exhibitions;
SELECT * FROM Paintings;
SELECT * FROM sales;

-- inner join
SELECT p.painting_id, p.title, p.price, a.name AS artist_name
FROM Paintings p
INNER JOIN Artists a ON p.artist_id = a.artist_id;

SET SQL_SAFE_UPDATES = 0;

-- left join
SELECT p.painting_id, p.title, s.buyer_name, s.sale_price, s.sale_date
FROM Paintings p
LEFT JOIN Sales s ON p.painting_id = s.painting_id;

-- query using UPDATE 
UPDATE Paintings
SET price = price * 1.10
WHERE price < 1000000;

-- query using DELETE
DELETE FROM Exhibitions
WHERE end_date = '2025-10-28';
SELECT * FROM Exhibitions;

-- Aggregation query (Filters artists who sold at least 2 paintings)
SELECT a.name AS artist_name, COUNT(s.sale_id) AS total_sales, SUM(s.sale_price) AS total_revenue
FROM sales s
JOIN Paintings p ON s.painting_id = p.painting_id
JOIN Artists a ON p.artist_id = a.artist_id
GROUP BY a.name
HAVING COUNT(s.sale_id) >= 1;

-- Subquery (Most expensive painting sold)
SELECT p.title, p.price 
FROM paintings p
JOIN sales s ON p.painting_id = s.painting_id
WHERE s.sale_price = (SELECT MAX(sale_price) FROM sales);


