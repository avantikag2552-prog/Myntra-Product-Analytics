CREATE DATABASE IF NOT EXISTS myntra_db;
USE myntra_db;
CREATE TABLE myntra (
    id INT,
    name TEXT,
    img TEXT,
    asin VARCHAR(100),
    price DOUBLE,
    mrp DOUBLE,
    rating DOUBLE,
    ratingTotal INT,
    discount DOUBLE,
    seller VARCHAR(255),
    purl TEXT
);
SELECT COUNT(*) AS Total_Products
FROM myntra;
SELECT *
FROM myntra
LIMIT 10;
DESCRIBE myntra;

SELECT COUNT(*) AS Total_Products
FROM myntra;
SELECT ROUND(AVG(price),2) AS Average_Price
FROM myntra;
SELECT ROUND(AVG(mrp),2) AS Average_MRP
FROM myntra;
SELECT ROUND(AVG(discount),2) AS Average_Discount
FROM myntra;
SELECT ROUND(AVG(rating),2) AS Average_Rating
FROM myntra;
SELECT name, price
FROM myntra
ORDER BY price DESC
LIMIT 10;
SELECT name, price
FROM myntra
ORDER BY price ASC
LIMIT 10;
SELECT name, rating
FROM myntra
ORDER BY rating DESC
LIMIT 10;
SELECT name, discount
FROM myntra
ORDER BY discount DESC
LIMIT 10;
SELECT seller,
COUNT(*) AS Total_Products
FROM myntra
GROUP BY seller
ORDER BY Total_Products DESC
LIMIT 10;
SELECT seller,
ROUND(AVG(price),2) AS Avg_Price
FROM myntra
GROUP BY seller
ORDER BY Avg_Price DESC
LIMIT 10;
SELECT seller,
ROUND(AVG(rating),2) AS Avg_Rating
FROM myntra
GROUP BY seller
ORDER BY Avg_Rating DESC
LIMIT 10;
SELECT name,
rating
FROM myntra
WHERE rating >= 4.5;
SELECT name,
discount
FROM myntra
WHERE discount > 50;
SELECT name,
price
FROM myntra
WHERE price > 5000;
SELECT MAX(discount) AS Maximum_Discount
FROM myntra;
SELECT MIN(price) AS Minimum_Price
FROM myntra;
SELECT MAX(price) AS Maximum_Price
FROM myntra;
SELECT COUNT(DISTINCT seller) AS Total_Sellers
FROM myntra;
SELECT COUNT(*) AS Products_Without_Rating
FROM myntra
WHERE rating IS NULL;
SELECT name, ratingTotal
FROM myntra
ORDER BY ratingTotal DESC
LIMIT 10;