-- 1. Create a VIEW
-- view for paintings that hides the price information
CREATE VIEW PaintingView AS
SELECT painting_id, title, year_created, artist_id
FROM paintings;
SELECT * FROM PaintingView;

-- 2. TWO INTEGRITY CONSTRAINTS
-- NOT NULL constraint to artists.name
ALTER TABLE artists 
MODIFY name VARCHAR(100) NOT NULL;
-- CHECK constraint to ensure sale_price is positive in sales table
ALTER TABLE sales 
ADD CONSTRAINT chk_sale_price CHECK (sale_price > 0);

-- 3. CREATE INDEX
-- index on artist_id in paintings table for faster JOIN
CREATE INDEX idx_paintings_artist_id ON paintings(artist_id);

-- 4. TRANSACTION
START TRANSACTION;
-- Insert a new artist
INSERT INTO artists (name, birth_year, nationality)
VALUES ('Vincent van Gogh', 1853, 'Dutch');
-- Update a painting's year
UPDATE paintings 
SET year_created = 1889 
WHERE painting_id = 3;

-- Checking the changes before committing
SELECT * FROM artists WHERE artist_id = 5;
SELECT * FROM paintings WHERE painting_id = 3;

-- To keep changes:
COMMIT;

-- 5. COMPLEX QUERY
SELECT 
    a.artist_id,
    a.name AS artist_name,
    COUNT(s.sale_id) AS total_sales,
    SUM(s.sale_price) AS total_revenue
FROM artists a
JOIN paintings p ON a.artist_id = p.artist_id
JOIN sales s ON p.painting_id = s.painting_id
WHERE s.sale_price > (
    SELECT AVG(sale_price) FROM sales
)
GROUP BY a.artist_id, a.name
HAVING COUNT(s.sale_id) >= 1;

-- USER and GRANT Privileges
-- Create a new user 
CREATE USER 'gallery_viewer'@'localhost' IDENTIFIED BY '12345';

-- Grant SELECT on the view
GRANT SELECT ON ArtGalleryManagement.PaintingView TO 'gallery_viewer'@'localhost';

-- Show grants
SHOW GRANTS FOR 'gallery_viewer'@'localhost';

