CREATE DATABASE Rangkaar_Art_Platform;
GO

USE Rangkaar_Art_Platform;
GO

-- ARTISTS TABLE


CREATE TABLE Artists (
    ArtistID INT PRIMARY KEY,
    ArtistName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    ArtistCity VARCHAR(50),
    ArtistDomain VARCHAR(100)
);

INSERT INTO Artists VALUES
(1, 'Sadequain', 'sadequain@art.pk', 'Karachi', 'Calligraphy'),
(2, 'Ismail Gulgee', 'gulgee@art.pk', 'Karachi', 'Abstract'),
(3, 'A.R. Chughtai', 'chughtai@art.pk', 'Lahore', 'Miniature'),
(4, 'Zahoor ul Akhlaq', 'zahoor@art.pk', 'Lahore', 'Modern Art'),
(5, 'Nadia Jamil', 'nadia@art.pk', 'Islamabad', 'Digital Art'),
(6, 'Mahir Fahad', 'mahir@art.pk', 'Faisalabad', 'Interior Designer');

GO


-- STUDENTS TABLE


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Institute VARCHAR(100),
    City VARCHAR(50),
    Phone VARCHAR(15)
);

INSERT INTO Students VALUES
(1,'Taiba Ahid','taiba@student.pk','NCA Lahore','Lahore','03000000001'),
(2,'Ayesha Khan','ayesha@student.pk','KU Karachi','Karachi','03000000002'),
(3,'Hassan Raza','hassan@student.pk','Punjab University','Lahore','03000000003'),
(4,'Sara Ahmed','sara@student.pk','BNU Lahore','Lahore','03000000004'),
(5,'Hamza Ali','hamza@student.pk','Iqra University','Karachi','03000000005');

GO


-- CUSTOMERS TABLE


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    City VARCHAR(50)
);

INSERT INTO Customers VALUES
(1,'Bilal Hussain','bilal@customer.pk','03001234567','Karachi'),
(2,'Maha Sheikh','maha@customer.pk','03016748392','Lahore'),
(3,'Umar Farooq','umar@customer.pk','03329874510','Islamabad'),
(4,'Hiba Saeed','hiba@customer.pk','03214567098','Faisalabad'),
(5,'Ahmed Hassan','ahmed@customer.pk','03087651234','Rawalpindi');

GO


-- CATEGORIES TABLE

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

INSERT INTO Categories VALUES
(1,'Fine Arts'),
(2,'Digital Arts'),
(3,'Graphic Design'),
(4,'Interior & Décor Arts'),
(5,'Product & Furniture Design'),
(6,'Handicrafts & Craft Arts'),
(7,'Textile & Fashion Art'),
(8,'Animation & Media Arts'),
(9,'Architecture & Spatial Art'),
(10,'Specialized Customized Services');

GO

-- SUBCATEGORIES TABLE


CREATE TABLE Subcategories (
    SubcategoryID INT PRIMARY KEY,
    SubcategoryName VARCHAR(100),
    CategoryID INT,
    FOREIGN KEY(CategoryID)
    REFERENCES Categories(CategoryID)
);

INSERT INTO Subcategories VALUES
(1,'Portrait Drawings',1),
(2,'Calligraphy',1),
(3,'Abstract Paintings',1),
(4,'Digital Portraits',2),
(5,'Character Designing',2),
(6,'Digital Illustrations',2),
(7,'Logo Design',3),
(8,'Brand Identity',3),
(9,'Posters & Flyers',3),
(10,'Mural Painting',4),
(11,'Customized Wall Art',4),
(12,'Room Décor',4),
(13,'Furniture Painting',5),
(14,'Resin Art Pieces',5),
(15,'Custom Tables',5),
(16,'Resin Jewellery',6),
(17,'Clay Pottery',6),
(18,'Embroidery Art',6),
(19,'Textile Prints',7),
(20,'Pattern Design',7),
(21,'Fashion Illustration',7),
(22,'2D Animation',8),
(23,'Motion Graphics',8),
(24,'Storyboard Art',8),
(25,'Architectural Sketches',9),
(26,'3D Visualization',9),
(27,'Space Planning',9),
(28,'Wedding Artworks',10),
(29,'Kids Room Décor',10),
(30,'Event Custom Décor',10);

GO

-- ARTWORKS TABLE

CREATE TABLE Artworks (
    ArtworkID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    ArtistID INT NULL,
    StudentID INT NULL,
    SubcategoryID INT,
    Price DECIMAL(10,2),
    YearCreated INT,
    Status VARCHAR(50) DEFAULT 'Available',
    FinalPrice DECIMAL(10,2),

    FOREIGN KEY(ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(SubcategoryID) REFERENCES Subcategories(SubcategoryID)
);


INSERT INTO Artworks VALUES
(1,'The Eternal Script',1,NULL,2,150000,1988,'Available',NULL),
(2,'Mystic Abstract',2,NULL,3,120000,1995,'Available',NULL),
(3,'Miniature Glory',3,NULL,18,250000,1960,'Available',NULL),
(4,'Digital Horizons',5,NULL,4,60000,2022,'Available',NULL),
(5,'Modern Reflections',4,NULL,1,80000,1990,'Available',NULL);

GO

-- ORDERS TABLE

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ArtworkID INT,
    OrderDate DATE,
    Status VARCHAR(50),

    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY(ArtworkID) REFERENCES Artworks(ArtworkID)
);

INSERT INTO Orders VALUES
(1,1,1,'2025-01-10','Completed'),
(2,2,4,'2025-01-11','Pending'),
(3,3,2,'2025-01-12','Shipped'),
(4,4,3,'2025-01-13','Completed'),
(5,5,5,'2025-01-14','Cancelled');

GO

-- PAYMENTS TABLE

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    Amount DECIMAL(10,2) CHECK(Amount>0),
    PaymentMethod VARCHAR(50),
    PaymentDate DATE,
    PaymentStatus VARCHAR(50) DEFAULT 'Pending',

    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
);


INSERT INTO Payments VALUES
(1,1,150000,'Bank Transfer','2025-01-10','Pending'),
(2,2,60000,'JazzCash','2025-01-11','Pending'),
(3,3,120000,'EasyPaisa','2025-01-12','Pending'),
(4,4,250000,'Cash','2025-01-13','Pending'),
(5,5,80000,'Bank Transfer','2025-01-14','Pending');

GO

-- INTERNSHIPS TABLE

CREATE TABLE Internships (
    InternshipID INT PRIMARY KEY,
    Organization VARCHAR(100),
    DurationMonths INT,
    Status VARCHAR(50)
);


INSERT INTO Internships VALUES
(1,'PNCA Islamabad',3,'Completed'),
(2,'NCA Gallery Lahore',6,'Ongoing'),
(3,'Alhamra Arts Council',4,'Completed'),
(4,'VM Art Gallery Karachi',2,'Ongoing'),
(5,'Khayal Creative Studio',3,'Completed');

GO

-- STUDENT INTERNSHIPS TABLE
-- MANY-TO-MANY RELATIONSHIP


CREATE TABLE StudentInternships (
    StudentID INT,
    InternshipID INT,
    ApplicationDate DATE,
    StartDate DATE,
    Status VARCHAR(50),

    PRIMARY KEY(StudentID, InternshipID),

    FOREIGN KEY(StudentID)
    REFERENCES Students(StudentID),

    FOREIGN KEY(InternshipID)
    REFERENCES Internships(InternshipID)
);


INSERT INTO StudentInternships VALUES
(1,1,'2024-01-01','2024-01-10','Completed'),
(2,2,'2024-02-01','2024-02-10','Ongoing'),
(3,3,'2024-03-01','2024-03-15','Completed'),
(4,4,'2024-04-01','2024-04-10','Ongoing'),
(5,5,'2024-05-01','2024-05-15','Completed');

GO

-- EXHIBITIONS TABLE

CREATE TABLE Exhibitions (
    ExhibitionID INT PRIMARY KEY,
    ExhibitionName VARCHAR(100),
    Venue VARCHAR(100),
    ExhibitionDate DATE
);


INSERT INTO Exhibitions VALUES
(1,'Calligraphy Revival','PNCA Islamabad','2024-12-05'),
(2,'Abstract Expressions','Arts Council Karachi','2025-01-12'),
(3,'Miniature Heritage','NCA Lahore','2025-02-10'),
(4,'Modern Retrospective','Alhamra Lahore','2025-03-05'),
(5,'Digital Dimensions','PNCA Islamabad','2025-04-01');

GO

-- ARTIST EXHIBITIONS TABLE
-- MANY-TO-MANY RELATIONSHIP

CREATE TABLE ArtistExhibitions (
    ArtExhID INT PRIMARY KEY,
    ArtistID INT,
    ExhibitionID INT,

    FOREIGN KEY(ArtistID)
    REFERENCES Artists(ArtistID),

    FOREIGN KEY(ExhibitionID)
    REFERENCES Exhibitions(ExhibitionID)
);


INSERT INTO ArtistExhibitions VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5);

GO

-- ADD STUDENT ARTWORKS

INSERT INTO Artworks
(
ArtworkID,
Title,
ArtistID,
StudentID,
SubcategoryID,
Price,
YearCreated,
Status,
FinalPrice
)
VALUES
(6,'Student Sketch',NULL,1,1,50000,2025,'Available',NULL),
(7,'Student Drawing',NULL,2,2,60000,2024,'Available',NULL);

GO


-- ADD CONSTRAINTS

ALTER TABLE Artworks
ADD CONSTRAINT CK_ArtworkPrice
CHECK(Price > 0);

GO


ALTER TABLE Internships
ADD CONSTRAINT CK_InternshipDuration
CHECK(DurationMonths > 0);

GO


ALTER TABLE Payments
ADD CONSTRAINT CK_PaymentAmount
CHECK(Amount > 0);

GO


SELECT * FROM Artists;

SELECT * FROM Students;

SELECT * FROM Customers;

SELECT * FROM Artworks;

SELECT * FROM Orders;

SELECT * FROM Payments;

SELECT * FROM Internships;

SELECT * FROM StudentInternships;

SELECT * FROM Exhibitions;

SELECT * FROM ArtistExhibitions;

GO



-- AGGREGATE FUNCTIONS


-- Total sales from payments

SELECT 
SUM(Amount) AS Total_Sales
FROM Payments;


-- Average artwork price

SELECT 
AVG(Price) AS Average_Artwork_Price
FROM Artworks;


-- Highest artwork price

SELECT 
MAX(Price) AS Highest_Artwork_Price
FROM Artworks;


-- Cheapest artwork price

SELECT 
MIN(Price) AS Cheapest_Artwork_Price
FROM Artworks;


-- Count artworks by subcategory

SELECT 
SubcategoryID,
COUNT(*) AS Total_Artworks
FROM Artworks
GROUP BY SubcategoryID;


-- Count artworks by artist

SELECT 
ArtistID,
COUNT(*) AS Total_Artworks
FROM Artworks
WHERE ArtistID IS NOT NULL
GROUP BY ArtistID;


-- Count student artworks

SELECT 
StudentID,
COUNT(*) AS Total_Student_Artworks
FROM Artworks
WHERE StudentID IS NOT NULL
GROUP BY StudentID;


-- Count internships by status

SELECT 
Status,
COUNT(*) AS Total_Internships
FROM StudentInternships
GROUP BY Status;


-- Average internship duration

SELECT 
AVG(DurationMonths) AS Average_Internship_Duration
FROM Internships;


-- Payment collection by method

SELECT 
PaymentMethod,
SUM(Amount) AS Total_Collected
FROM Payments
GROUP BY PaymentMethod;


-- Available/Sold artworks count

SELECT 
Status,
COUNT(*) AS Total
FROM Artworks
GROUP BY Status;


GO


-- NESTED QUERIES


-- Students living in cities where artists exist

SELECT 
StudentName,
City
FROM Students
WHERE City IN
(
    SELECT ArtistCity
    FROM Artists
);



-- Customers whose city does not have artists

SELECT
CustomerName,
City
FROM Customers
WHERE City NOT IN
(
    SELECT ArtistCity
    FROM Artists
);



-- Artists who have artworks

SELECT 
ArtistName
FROM Artists A
WHERE EXISTS
(
    SELECT 1
    FROM Artworks AW
    WHERE AW.ArtistID = A.ArtistID
);



-- Artists without exhibitions

SELECT
ArtistName
FROM Artists A
WHERE NOT EXISTS
(
    SELECT 1
    FROM ArtistExhibitions AE
    WHERE AE.ArtistID = A.ArtistID
);



-- Artworks more expensive than all artworks of Sadequain

SELECT
Title,
Price
FROM Artworks
WHERE Price >
ALL
(
    SELECT Price
    FROM Artworks
    WHERE ArtistID = 1
);



-- Artists participating in exhibitions

SELECT
ArtistName
FROM Artists
WHERE ArtistID IN
(
    SELECT ArtistID
    FROM ArtistExhibitions
);



-- Artwork purchased by Maha Sheikh

SELECT
ArtistName
FROM Artists
WHERE ArtistID IN
(
    SELECT ArtistID
    FROM Artworks
    WHERE ArtworkID IN
    (
        SELECT ArtworkID
        FROM Orders
        WHERE CustomerID IN
        (
            SELECT CustomerID
            FROM Customers
            WHERE CustomerName='Maha Sheikh'
        )
    )
);



-- Artworks more expensive than any Sadequain artwork

SELECT
Title,
Price
FROM Artworks
WHERE Price >
ANY
(
    SELECT Price
    FROM Artworks
    WHERE ArtistID =
    (
        SELECT ArtistID
        FROM Artists
        WHERE ArtistName='Sadequain'
    )
);



-- Orders with payment greater than 100000

SELECT
OrderID,
SUM(Amount) AS TotalSpent
FROM Payments
GROUP BY OrderID
HAVING SUM(Amount) > 100000;


GO

-- JOINS

-- INNER JOIN
-- Artwork with artist details

SELECT
A.Title,
A.Price,
AR.ArtistName
FROM Artworks A
INNER JOIN Artists AR
ON A.ArtistID = AR.ArtistID;



-- LEFT JOIN
-- All artists with their artworks

SELECT
AR.ArtistName,
A.Title,
A.Price
FROM Artists AR
LEFT JOIN Artworks A
ON AR.ArtistID = A.ArtistID;



-- RIGHT JOIN

SELECT
AR.ArtistName,
A.Title,
A.Price
FROM Artists AR
RIGHT JOIN Artworks A
ON AR.ArtistID = A.ArtistID;



-- FULL OUTER JOIN

SELECT
AR.ArtistName,
A.Title,
A.Price
FROM Artists AR
FULL OUTER JOIN Artworks A
ON AR.ArtistID = A.ArtistID;



-- CROSS JOIN

SELECT
AR.ArtistName,
E.ExhibitionName
FROM Artists AR
CROSS JOIN Exhibitions E;



-- SELF JOIN
-- Students from same city

SELECT
S1.StudentName AS Student1,
S2.StudentName AS Student2,
S1.City
FROM Students S1
INNER JOIN Students S2
ON S1.City = S2.City
AND S1.StudentID <> S2.StudentID;



-- Artwork category details

SELECT
A.Title,
C.CategoryName,
S.SubcategoryName
FROM Artworks A
INNER JOIN Subcategories S
ON A.SubcategoryID = S.SubcategoryID
INNER JOIN Categories C
ON S.CategoryID = C.CategoryID;



-- Customer payment details

SELECT
CU.CustomerName,
A.Title AS Artwork_Name,
P.Amount,
P.PaymentMethod
FROM Payments P
INNER JOIN Orders O
ON P.OrderID = O.OrderID
INNER JOIN Customers CU
ON O.CustomerID = CU.CustomerID
INNER JOIN Artworks A
ON O.ArtworkID = A.ArtworkID;



-- Artists and exhibitions

SELECT
AR.ArtistName,
E.ExhibitionName
FROM Artists AR
FULL OUTER JOIN ArtistExhibitions AE
ON AR.ArtistID = AE.ArtistID
FULL OUTER JOIN Exhibitions E
ON AE.ExhibitionID = E.ExhibitionID;


GO

-- FUNCTION 1
-- Calculate Artwork Age

CREATE FUNCTION dbo.GetArtworkAge
(
    @YearCreated INT
)
RETURNS INT
AS
BEGIN

    RETURN YEAR(GETDATE()) - @YearCreated;

END;
GO


SELECT 
Title,
YearCreated,
dbo.GetArtworkAge(YearCreated) AS Artwork_Age
FROM Artworks;

GO

-- FUNCTION 2
-- Get Payment Amount of Order

CREATE FUNCTION dbo.GetOrderPayment
(
    @OrderID INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN

    DECLARE @Amount DECIMAL(10,2);

    SELECT 
    @Amount = Amount
    FROM Payments
    WHERE OrderID = @OrderID;


    RETURN ISNULL(@Amount,0);

END;
GO


SELECT
OrderID,
dbo.GetOrderPayment(OrderID) AS Paid_Amount
FROM Orders;

GO

-- FUNCTION 3
-- Get Artworks By Category

CREATE FUNCTION dbo.GetArtworksByCategory
(
    @CategoryName VARCHAR(100)
)

RETURNS TABLE
AS
RETURN
(

    SELECT
    A.ArtworkID,
    A.Title,
    A.Price,
    C.CategoryName

    FROM Artworks A

    INNER JOIN Subcategories S
    ON A.SubcategoryID = S.SubcategoryID

    INNER JOIN Categories C
    ON S.CategoryID = C.CategoryID

    WHERE C.CategoryName = @CategoryName

);

GO


SELECT *
FROM dbo.GetArtworksByCategory('Fine Arts');

GO

-- FUNCTION 4
-- Payments Between Dates

CREATE FUNCTION dbo.GetPaymentsBetweenDates
(
    @StartDate DATE,
    @EndDate DATE
)

RETURNS TABLE
AS
RETURN
(

    SELECT
    PaymentID,
    Amount,
    PaymentMethod,
    PaymentDate

    FROM Payments

    WHERE PaymentDate BETWEEN @StartDate AND @EndDate

);

GO


SELECT *
FROM dbo.GetPaymentsBetweenDates
(
'2025-01-10',
'2025-01-14'
);

GO

-- FUNCTION 5
-- Student Internship Details

CREATE FUNCTION dbo.GetStudentInternshipDetails
(
    @StudentID INT
)

RETURNS @Result TABLE
(
    StudentName VARCHAR(100),
    InternshipName VARCHAR(100),
    DurationMonths INT,
    ApplicationDate DATE,
    Status VARCHAR(50)
)

AS
BEGIN


INSERT INTO @Result

SELECT
S.StudentName,
I.Organization,
I.DurationMonths,
SI.ApplicationDate,
SI.Status

FROM StudentInternships SI

INNER JOIN Students S
ON SI.StudentID = S.StudentID

INNER JOIN Internships I
ON SI.InternshipID = I.InternshipID

WHERE S.StudentID = @StudentID;


RETURN;

END;

GO


SELECT *
FROM dbo.GetStudentInternshipDetails(1);

GO

-- FUNCTION 6
-- Customer Order Summary

CREATE FUNCTION dbo.GetCustomerOrderSummary
(
    @CustomerID INT
)

RETURNS @Result TABLE
(
    CustomerName VARCHAR(100),
    ArtworkTitle VARCHAR(100),
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    OrderDate DATE,
    Status VARCHAR(50)
)

AS
BEGIN


INSERT INTO @Result

SELECT
CU.CustomerName,
A.Title,
P.Amount,
P.PaymentMethod,
O.OrderDate,
O.Status


FROM Orders O

INNER JOIN Customers CU
ON O.CustomerID = CU.CustomerID

INNER JOIN Artworks A
ON O.ArtworkID = A.ArtworkID

LEFT JOIN Payments P
ON O.OrderID = P.OrderID


WHERE CU.CustomerID = @CustomerID;


RETURN;

END;

GO


SELECT *
FROM dbo.GetCustomerOrderSummary(2);

GO

-- FUNCTION 7
-- Get Orders By Status

CREATE FUNCTION dbo.GetOrdersByStatus
(
    @Status VARCHAR(50)
)

RETURNS TABLE

AS
RETURN
(

SELECT
O.OrderID,
C.CustomerName,
A.Title AS Artwork,
O.OrderDate,
O.Status

FROM Orders O

INNER JOIN Customers C
ON O.CustomerID = C.CustomerID

INNER JOIN Artworks A
ON O.ArtworkID = A.ArtworkID

WHERE O.Status = @Status

);

GO


SELECT *
FROM dbo.GetOrdersByStatus('Pending');

GO

-- FUNCTION 8
-- Artist Total Revenue

CREATE FUNCTION dbo.GetArtistTotalRevenue
(
    @ArtistID INT
)

RETURNS DECIMAL(10,2)

AS
BEGIN

DECLARE @TotalRevenue DECIMAL(10,2);


SELECT
@TotalRevenue = SUM(P.Amount)

FROM Artworks A

INNER JOIN Orders O
ON A.ArtworkID = O.ArtworkID

INNER JOIN Payments P
ON O.OrderID = P.OrderID

WHERE A.ArtistID = @ArtistID
AND O.Status = 'Completed';


RETURN ISNULL(@TotalRevenue,0);


END;

GO


SELECT
dbo.GetArtistTotalRevenue(1)
AS TotalRevenue;

GO

-- FUNCTION 9
-- Calculate Discount Price

CREATE FUNCTION dbo.CalculateDiscountPrice
(
    @Price DECIMAL(10,2),
    @DiscountPercent INT
)

RETURNS DECIMAL(10,2)

AS
BEGIN


RETURN 
@Price - (@Price * @DiscountPercent / 100);


END;

GO


SELECT
dbo.CalculateDiscountPrice(20000,15)
AS DiscountedPrice;

GO

-- PROCEDURE 1
-- Total Sales By Artwork

CREATE PROCEDURE dbo.GetTotalSalesByArtwork
(
    @ArtworkID INT
)

AS
BEGIN

    SELECT
    COUNT(O.OrderID) AS TotalOrders,
    SUM(P.Amount) AS TotalRevenue

    FROM Orders O

    LEFT JOIN Payments P
    ON O.OrderID = P.OrderID

    WHERE O.ArtworkID = @ArtworkID;

END;

GO


EXEC dbo.GetTotalSalesByArtwork 1;

GO


-- PROCEDURE 2
-- Students By Internship

CREATE PROCEDURE dbo.GetStudentsByInternship
(
    @InternshipID INT
)

AS
BEGIN

    SELECT
    S.StudentID,
    S.StudentName,
    S.Email,
    S.Institute,
    SI.ApplicationDate,
    SI.Status

    FROM StudentInternships SI

    INNER JOIN Students S
    ON SI.StudentID = S.StudentID

    WHERE SI.InternshipID = @InternshipID;

END;

GO


EXEC dbo.GetStudentsByInternship 2;

GO


-- PROCEDURE 3
-- Exhibitions Between Dates

CREATE PROCEDURE dbo.GetExhibitionsByDate
(
    @StartDate DATE,
    @EndDate DATE
)

AS
BEGIN

    SELECT
    ExhibitionID,
    ExhibitionName,
    Venue,
    ExhibitionDate

    FROM Exhibitions

    WHERE ExhibitionDate 
    BETWEEN @StartDate AND @EndDate;

END;

GO


EXEC dbo.GetExhibitionsByDate
'2025-01-01',
'2025-03-01';

GO

-- PROCEDURE 4
-- Student Created Artworks

CREATE PROCEDURE dbo.GetStudentArtworks

AS
BEGIN

    SELECT
    ArtworkID,
    Title,
    StudentID,
    SubcategoryID,
    Price,
    YearCreated,
    Status

    FROM Artworks

    WHERE StudentID IS NOT NULL;

END;

GO


EXEC dbo.GetStudentArtworks;

GO

-- PROCEDURE 5
-- Search Artists By City

CREATE PROCEDURE dbo.GetArtistsByCity
(
    @City VARCHAR(50)
)

AS
BEGIN

    SELECT
    ArtistID,
    ArtistName,
    ArtistDomain,
    ArtistCity,
    Email

    FROM Artists

    WHERE ArtistCity = @City;

END;

GO


EXEC dbo.GetArtistsByCity 'Karachi';

GO


-- PROCEDURE 6
-- Customer Order History

CREATE PROCEDURE dbo.GetCustomerOrderSummary
(
    @CustomerID INT
)

AS
BEGIN

    SELECT

    O.OrderID,
    A.Title AS Artwork,
    O.Status,
    O.OrderDate,
    P.Amount,
    P.PaymentMethod

    FROM Orders O

    INNER JOIN Artworks A
    ON O.ArtworkID = A.ArtworkID

    LEFT JOIN Payments P
    ON O.OrderID = P.OrderID

    WHERE O.CustomerID = @CustomerID;

END;

GO


EXEC dbo.GetCustomerOrderSummary 2;

GO


-- PROCEDURE 7
-- Filter Artworks By Subcategory

CREATE PROCEDURE dbo.GetArtworksBySubcategory
(
    @SubcategoryID INT
)

AS
BEGIN

    SELECT

    ArtworkID,
    Title,
    ArtistID,
    StudentID,
    Price,
    Status

    FROM Artworks

    WHERE SubcategoryID = @SubcategoryID;

END;

GO


EXEC dbo.GetArtworksBySubcategory 2;

GO

-- PROCEDURE 8
-- Available Artworks By Price Range

CREATE PROCEDURE dbo.GetAvailableArtworksByPrice
(
    @MinPrice DECIMAL(10,2),
    @MaxPrice DECIMAL(10,2)
)

AS
BEGIN

    SELECT

    ArtworkID,
    Title,
    ArtistID,
    StudentID,
    Price,
    Status

    FROM Artworks

    WHERE Status='Available'

    AND Price BETWEEN @MinPrice AND @MaxPrice;

END;

GO


EXEC dbo.GetAvailableArtworksByPrice
50000,
150000;

GO

-- PROCEDURE 9
-- Artworks By Artist

CREATE PROCEDURE dbo.GetArtworksByArtist
(
    @ArtistID INT
)

AS
BEGIN

    SELECT

    ArtworkID,
    Title,
    SubcategoryID,
    Price,
    YearCreated,
    Status

    FROM Artworks

    WHERE ArtistID = @ArtistID;

END;

GO


EXEC dbo.GetArtworksByArtist 1;

GO

-- PROCEDURE 10
-- Artworks Without Orders

CREATE PROCEDURE dbo.GetArtworksWithoutOrders

AS
BEGIN

    SELECT

    A.ArtworkID,
    A.Title,
    A.Price,
    A.Status

    FROM Artworks A

    LEFT JOIN Orders O
    ON A.ArtworkID = O.ArtworkID

    WHERE O.OrderID IS NULL;

END;

GO


EXEC dbo.GetArtworksWithoutOrders;

GO

-- VIEW 1
-- Customer Order Details

CREATE VIEW dbo.vw_CustomerOrderDetails
AS

SELECT

CU.CustomerID,
CU.CustomerName,
CU.Email,

A.ArtworkID,
A.Title AS ArtworkTitle,

O.OrderID,
O.OrderDate,
O.Status AS OrderStatus,

P.Amount AS PaymentAmount,
P.PaymentMethod,
P.PaymentDate

FROM Customers CU

INNER JOIN Orders O
ON CU.CustomerID = O.CustomerID

INNER JOIN Artworks A
ON O.ArtworkID = A.ArtworkID

LEFT JOIN Payments P
ON O.OrderID = P.OrderID;

GO


SELECT *
FROM dbo.vw_CustomerOrderDetails;

GO

-- VIEW 2
-- Artwork Creator Details

CREATE VIEW dbo.vw_ArtworksWithArtistStudent
AS

SELECT

A.ArtworkID,
A.Title,

COALESCE
(
    AR.ArtistName,
    S.StudentName
)
AS CreatorName,


CASE

WHEN AR.ArtistID IS NOT NULL
THEN 'Artist'

ELSE 'Student'

END AS CreatorType,


Sub.SubcategoryName,

A.Price,
A.YearCreated,
A.Status


FROM Artworks A

LEFT JOIN Artists AR
ON A.ArtistID = AR.ArtistID

LEFT JOIN Students S
ON A.StudentID = S.StudentID

INNER JOIN Subcategories Sub
ON A.SubcategoryID = Sub.SubcategoryID;

GO


SELECT *
FROM dbo.vw_ArtworksWithArtistStudent;

GO

-- VIEW 3
-- Student Internship Status

CREATE VIEW dbo.vw_StudentInternshipStatus
AS

SELECT

S.StudentID,
S.StudentName,

I.InternshipID,
I.Organization,
I.DurationMonths,

SI.ApplicationDate,

SI.Status AS InternshipStatus


FROM StudentInternships SI

INNER JOIN Students S
ON SI.StudentID = S.StudentID

INNER JOIN Internships I
ON SI.InternshipID = I.InternshipID;

GO


SELECT *
FROM dbo.vw_StudentInternshipStatus;

GO

-- CURSOR 1
-- Update Completed Orders

DECLARE 
@OrderID INT,
@ArtworkID INT;


DECLARE ArtworkCursor CURSOR FOR

SELECT
OrderID,
ArtworkID

FROM Orders

WHERE Status='Completed';


OPEN ArtworkCursor;


FETCH NEXT FROM ArtworkCursor
INTO @OrderID,@ArtworkID;


WHILE @@FETCH_STATUS = 0

BEGIN

    UPDATE Artworks

    SET Status='Sold'

    WHERE ArtworkID=@ArtworkID;


    UPDATE Payments

    SET PaymentStatus='Completed'

    WHERE OrderID=@OrderID;



    FETCH NEXT FROM ArtworkCursor
    INTO @OrderID,@ArtworkID;

END;


CLOSE ArtworkCursor;

DEALLOCATE ArtworkCursor;

GO


-- CURSOR 2
-- Internship Duration Per Student


DECLARE

@StudentID INT,
@StudentName VARCHAR(100),
@TotalDuration INT;



DECLARE StudentCursor CURSOR FOR


SELECT DISTINCT

S.StudentID,
S.StudentName


FROM Students S

INNER JOIN StudentInternships SI

ON S.StudentID = SI.StudentID;



OPEN StudentCursor;


FETCH NEXT FROM StudentCursor

INTO @StudentID,@StudentName;



WHILE @@FETCH_STATUS=0

BEGIN


SELECT

@TotalDuration =
SUM(I.DurationMonths)


FROM StudentInternships SI

INNER JOIN Internships I

ON SI.InternshipID=I.InternshipID


WHERE SI.StudentID=@StudentID;



PRINT

'Student: '
+
@StudentName
+
' Total Months: '
+
CAST(@TotalDuration AS VARCHAR);



FETCH NEXT FROM StudentCursor

INTO @StudentID,@StudentName;


END;



CLOSE StudentCursor;

DEALLOCATE StudentCursor;

GO

-- TRIGGER 1
-- Backup Deleted Customers


CREATE TABLE Customers_Backup
(
CustomerID INT,
CustomerName VARCHAR(100),
Email VARCHAR(100),
Phone VARCHAR(20),
City VARCHAR(50),
DeletedOn DATETIME
);

GO



CREATE TRIGGER dbo.trg_BackupCustomerOnDelete

ON Customers

AFTER DELETE

AS

BEGIN


INSERT INTO Customers_Backup

SELECT *,
GETDATE()

FROM deleted;


END;

GO


-- TRIGGER 2
-- Update Artwork Status After Order Completion


CREATE TRIGGER dbo.trg_UpdateArtworkStatusOnOrder

ON Orders

AFTER UPDATE

AS

BEGIN


UPDATE A

SET Status='Sold'


FROM Artworks A

INNER JOIN inserted I

ON A.ArtworkID=I.ArtworkID


WHERE I.Status='Completed';


END;

GO

-- TRIGGER 3
-- Auto Payment Status


CREATE TRIGGER dbo.trg_PaymentStatusUpdate

ON Payments

AFTER INSERT

AS

BEGIN


UPDATE P

SET PaymentStatus='Paid'


FROM Payments P

INNER JOIN inserted I

ON P.PaymentID=I.PaymentID;


END;

GO


-- TRIGGER 4
-- Calculate Final Price


CREATE TRIGGER dbo.trg_ComputeFinalPrice
ON Artworks
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE A
    SET A.FinalPrice = A.Price + (A.Price * 0.10)
    FROM Artworks AS A
    INNER JOIN inserted AS I
        ON A.ArtworkID = I.ArtworkID;
END;
GO



-- TRIGGER 5
-- Prevent Artist Delete


CREATE TRIGGER dbo.trg_NoDeleteArtistIfArtworkExists

ON Artists

INSTEAD OF DELETE

AS

BEGIN


IF EXISTS

(
SELECT 1

FROM Artworks A

INNER JOIN deleted D

ON A.ArtistID=D.ArtistID

)

BEGIN

RAISERROR
(
'Artist cannot be deleted. Artworks exist.',
16,
1
);

RETURN;

END



DELETE FROM Artists

WHERE ArtistID IN
(
SELECT ArtistID
FROM deleted
);


END;

GO


-- TRIGGER 6
-- Prevent Duplicate Internship Application


CREATE TRIGGER dbo.trg_NoDuplicateInternshipApplication

ON StudentInternships

FOR INSERT

AS

BEGIN


IF EXISTS

(

SELECT 1

FROM inserted I

INNER JOIN StudentInternships S

ON I.StudentID=S.StudentID

AND I.InternshipID=S.InternshipID

)

BEGIN


RAISERROR
(
'Duplicate internship application not allowed.',
16,
1
);


ROLLBACK TRANSACTION;


END;


END;

GO

-- TRIGGER TESTING COMMANDS

-- Test customer delete backup trigger

DELETE FROM Customers
WHERE CustomerID = 5;

SELECT *
FROM Customers_Backup;

GO



-- Test artist deletion prevention

DELETE FROM Artists
WHERE ArtistID = 1;

GO



-- Test category deletion prevention

DELETE FROM Categories
WHERE CategoryID = 1;

GO


DELETE FROM Categories
WHERE CategoryID = 10;

GO