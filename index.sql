-- Practice Joins 

-- Question 1
SELECT *
FROM Invoice i
JOIN InvoiceLine il
on il.invoiceID = i.invoiceID
WHERE il.UnitPrice > 0.99; 
-- Question 2
SELECT i.InvoiceDate, c.FirstName, c.LastName, i.Total
from Invoice i 
Join Customer c ON i.CustomerId = c.CustomerId;
-- Question 3
SELECT c.FirstName, c.LastName, e.FirstName, e.LastName
FROM Customer c
Join Employee e ON c.SupportRepId = e.EmployeeId;
-- Question 4
SELECT al.Title, ar.Name
FROM Album al
JOIN Artist ar On al.ArtistId = ar.ArtistId;
-- Question 5
SELECT pt.TrackId
FROM PlaylistTrack pt
JOIN Playlist p ON p.PlaylistId = pt.PlaylistId
WHERE p.Name = 'Music';
-- Question 6
SELECT t.Name
FROM Track t
JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId
WHERE pt.PlaylistId = 5;
-- Question 7
SELECT t.name, p.Name
FROM Track t
JOIN PlaylistTrack pt ON t.TrackId = pt.TrackId
JOIN Playlist p ON pt.PlaylistId = p.PlaylistId;
-- Question 8
SELECT t.Name, a.title
from Track t
JOIN Album a ON t.AlbumId = a.AlbumID
JOIN Genre g ON g.GenreId = t.GenreID
WHERE g.Name = 'Alternative';
-- Practice nested Queeries 

-- Question 1
SELECT *
FROM Invoice
WHERE InvoiceId IN ( SELECT InvoiceId FROM InvoiceLine WHERE UnitPrice > 0.99 );
-- Question 2
SELECT * 
FROM PlaylistTrack
WHERE PlaylistId IN ( SELECT PlaylistId FROM Playlist WHERE Name = "Music");
-- Question 3
SELECT Name
FROM Track
WHERE TrackId IN ( SELECT TrackId FROM PlaylistTrack WHERE PlaylistId = 5 );
-- Question 4
SELECT *
FROM Track
WHERE GenreId IN ( SELECT GenreId FROM Genre WHERE Name = "Comedy" );
-- Question 5
SELECT *
FROM Track
WHERE AlbumId IN ( SELECT AlbumId FROM Album WHERE Title = "Fireball" );
-- Question 6
SELECT *
FROM Track
WHERE AlbumId IN ( 
  SELECT AlbumId FROM Album WHERE ArtistId IN ( 
    SELECT ArtistId FROM Artist WHERE Name = "Queen" 
  )
); 
-- Practice updating Rows

-- Question 1
UPDATE Customer
SET Fax = null
WHERE Fax IS NOT NULL
-- Question 2
UPDATE Customer
SET Company = 'Self'
WHERE Company IS null;
-- Question 3
UPDATE Customer
SET LastName = "Thompson"
WHERE FirstName = "Julia" and LastName = "Barnett"
-- Question 4
UPDATE Customer
SET SupportRepId = 4
WHERE Email = "luisrojas@yahoo.cl";
-- Question 5
UPDATE Tracks
SET Composer = "The darkness around us"
WHERE GenreId = (SELECT GenreId FROM Genre WHERE Name = "Metal")
AND Composer IS Null;

-- Group by

-- Question 1
SELECT Count(*), g.Name
FROM Track t
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name;
-- Question 2
SELECT Count(*), g.Name
FROM Track t
JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = 'Pop' OR g.Name = 'Rock'
GROUP BY g.Name;
-- Question 3
SELECT ar.Name, COUNT(*)
FROM Artist ar
JOIN Album al ON ar.ArtistId = al.ArtistId
GROUP BY al.ArtistId;
-- Use Distinct

-- Question 1
SELECT DISTINCT Composer
FROM Track
-- Question 2
SELECT DISTINCT BillingPostalCode
FROM Invoice
-- Question 3
SELECT DISTINCT Company
FROM Customer

-- Delete Rows

-- Question 1
DELETE FROM practice_delete WHERE Type = "bronze"

-- Question 2
DELETE FROM practice_delete WHERE Type = "silver"
-- Question 3
DELETE FROM practice_delete WHERE Value = 150;
-- eCommerece Simulation 

CREATE TABLE users(
     id integer primary key  autoincrement,
    name varchar(100),
    email text
)

CREATE TABLE products(
    id integer primary key  autoincrement,
    name varchar(100),
    price integer
)

CREATE TABLE orders(
    id integer primary key  autoincrement,
    
)