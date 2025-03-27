USE ArtGalleryManagement;
SELECT * FROM Artists;
SELECT * FROM Exhibitions;
SELECT * FROM Paintings;
SELECT * FROM Sales;

-- Find all paintings created by Pablo Picasso
SELECT Paintings.title, Paintings.year_created 
FROM Paintings 
JOIN Artists ON Paintings.artist_id = Artists.artist_id
WHERE Artists.name = 'Pablo Picasso';

-- Find all paintings sold for more than 5 million
SELECT * FROM Sales WHERE sale_price > 5000000;

-- Find all exhibitions held in Paris
SELECT * FROM Exhibitions WHERE location = 'Paris';

-- Sort paintings by year of creation (oldest first)
SELECT * FROM Paintings ORDER BY year_created ASC;

-- Limit results to the first 2 sales
SELECT * FROM Sales LIMIT 2;



