USE ArtGalleryManagement;
INSERT INTO Artists (name, birth_year, nationality) VALUES 
('Pablo Picasso', 1881, 'Spanish'),
('Leonardo da Vinci', 1452, 'Italian'),
('Vincent van Gogh', 1853, 'Dutch'),
('Shafic Abboud' , 1850, 'Bangladeshi');

INSERT INTO Exhibitions (title, start_date, end_date, location) VALUES 
('Modern Art Expo', '2025-05-01', '2025-06-01', 'New York'),
('Renaissance Wonders', '2025-07-15', '2025-08-30', 'Paris'),
('Impressionist Showcase', '2025-09-01', '2025-10-01', 'London'),
('Firefly Expo', '2025-08-10', '2025-09-10', 'Washington DC') ;

INSERT INTO Paintings (title, year_created, artist_id, exhibition_id) VALUES 
('Guernica', 1937, 1, 1),
('Mona Lisa', 1503, 2, 2),
('Starry Night', 1889, 3, 3),
('Sentemental', 1899, 4, 4);

INSERT INTO Sales (painting_id, buyer_name, sale_price, sale_date) VALUES 
(1, 'John Doe', 5000000.00, '2025-06-05'),
(2, 'Alice Smith', 7800000.50, '2025-09-01'),
(3, 'Michael Brown', 6200000.75, '2025-10-10'),
(4, 'Bob Ross', 6250000.67, '2025-11-09');







