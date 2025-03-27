CREATE DATABASE ArtGalleryManagement;
CREATE TABLE Artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year YEAR ,
    nationality VARCHAR(50)
);
CREATE TABLE Exhibitions (
    exhibition_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    location VARCHAR(100)
);
CREATE TABLE Paintings (
    painting_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    year_created YEAR,
    artist_id INT,
    exhibition_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id) ON DELETE CASCADE,
    FOREIGN KEY (exhibition_id) REFERENCES Exhibitions(exhibition_id) ON DELETE SET NULL
);
CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    painting_id INT,
    buyer_name VARCHAR(100) NOT NULL,
    sale_price DECIMAL(10,2) NOT NULL,
    sale_date DATE NOT NULL,
	FOREIGN KEY (painting_id) REFERENCES Paintings(painting_id) ON DELETE CASCADE
);
ALTER TABLE Artists MODIFY COLUMN birth_year INT;
ALTER TABLE Paintings MODIFY COLUMN year_created INT;
