select * from admin order by username desc

select * from admin where Admin_id < 5

select * from admin where username like '%i%'
select * from admin where username not like '%T'

select username from admin where Admin_id in (5,1,2,4)

select * from admin where username like '_b%'

select distinct BloodType from Donor

SELECT DISTINCT username FROM Admin

select TOP 3 * from Blood_Stock order by Quantity asc
SELECT TOP 50 PERCENT * from Donation Where Quantity > 10 

select Fname as [First Name], Lname as [Last Name] from Donor

select * from Hospital where City in ('Faiyum', 'Giza', 'Cairo')

select * from Donor where RegistrationDate between '2026-01-01' and '2026-03-30'

select * from Blood_Stock where BloodType like '%[-]'
select * from Hospital where Name like '[ABC]%'

select * from Donor where Gender = 'Female' and BloodType = 'O-'

select * from Donation where Quantity >= 450 or Status = 'Urgent'

select top 25 percent * from Blood_Request order by RequestDate desc

select * from Donor where Email not like '%yahoo.com'

select count(Admin_id) from Admin

select count(distinct Fname) from Donor

select avg(Quantity) from Blood_Stock
-----------------------------------------------------------------


-- GTOUP BY
select City, BloodType, COUNT(*) as Total
FROM Donor
GROUP BY City, BloodType;

SELECT Hospital_id, SUM(Quantity) AS Total_Requested_Bags
FROM Blood_Request
GROUP BY Hospital_id ;

SELECT City, BloodType, COUNT(*) AS Total_Donors
FROM Donor
GROUP BY City, BloodType; 

SELECT  SUM(Quantity) AS Total_Bags
FROM Blood_Request
WHERE Quantity > 2
GROUP BY Hospital_id
HAVING SUM(Quantity) > 10;

select BloodType , UrgencyLevel , count(*) as Total
From Blood_Request
Group by BloodType , UrgencyLevel

select BloodType  , count(*) as Total
From Blood_Request
Group by BloodType , UrgencyLevel

SELECT City, BloodType, Gender, COUNT(*) AS NumberOfDonors
From Donor
Group by City, BloodType, Gender;

SELECT City, COUNT(*) as Total
FROM Donor
WHERE Fname LIKE 'A%'  
GROUP BY City;  

SELECT City, COUNT(*) AS Gender
FROM Donor
WHERE Gender = 'Male'              
GROUP BY City                
HAVING COUNT(*) > 0;     

SELECT BloodType, SUM(Quantity) AS TotalBags
FROM Blood_Stock
WHERE ExpiryDate = '2026-05-05'   
GROUP BY BloodType           
HAVING SUM(Quantity) >= 5;
-----------------------------------------------------------------


-- INNER JOIN With Old Type
SELECT DO.Quantity, S.MinimumThreshold
FROM Donation AS DO, Blood_Stock AS S
WHERE DO.Stock_id = S.Stock_id;

SELECT H.Name, A.username
FROM Hospital AS H, Admin AS A
WHERE H.Admin_id = A.Admin_id;

SELECT R.Content , A.username
FROM Report as R , Admin As A
Where R.Admin_id = A.Admin_id;

SELECT D.Fname, DO.DonationDate
FROM Donor AS D, Donation AS DO
WHERE D.Donor_id = DO.Donor_id AND D.City = 'Beni-Suef';
-----------------------------------------------------------------


-- INNER JOIN With Modern Type
SELECT D.Fname, D.Lname, DO.DonationDate
FROM Donor AS D
INNER JOIN Donation AS DO
ON D.Donor_id = DO.Donor_id;

SELECT H.Name, R.BloodType, R.Quantity
FROM Hospital AS H
INNER JOIN Blood_Request AS R 
ON H.Hospital_id = R.Hospital_id;

SELECT D.Fname, A.username
FROM Donor AS D
INNER JOIN Admin AS A 
ON D.Admin_id = A.Admin_id;

SELECT R.Request_id, S.BloodType
FROM Blood_Request AS R
INNER JOIN Blood_Stock AS S 
ON R.Stock_id = S.Stock_id;

SELECT R.Request_id, S.BloodType
FROM Blood_Request AS R
INNER JOIN Blood_Stock AS S
ON R.Stock_id = S.Stock_id;
-----------------------------------------------------------------


-- Left Outer Join
SELECT A.username, R.Content, R.ReportType
FROM Admin AS A
LEFT OUTER JOIN Report AS R ON A.Admin_id = R.Admin_id;

SELECT A.username, R.Content, R.ReportType
FROM Admin AS A
INNER JOIN Report AS R ON A.Admin_id = R.Admin_id;
-----------------------------------------------------------------

-- Full Outer Join
SELECT D.Fname, N.Message, N.IsRead
FROM Donor AS D
FULL OUTER JOIN Notification AS N ON D.Donor_id = N.Donor_id;

SELECT D.Fname, N.Message, N.IsRead
FROM Donor AS D
INNER JOIN Notification AS N ON D.Donor_id = N.Donor_id;
-----------------------------------------------------------------

-- Right Outer Goin
SELECT H.Name, BR.Notes , BR.UrgencyLevel
FROM Hospital AS H 
RIGHT JOIN Blood_Request AS BR
ON H.Hospital_id = BR.Hospital_id
-----------------------------------------------------------------


-- Certisian Product
SELECT H.Name AS Hospital_Name, S.BloodType
FROM Hospital AS H , Blood_Stock As S;

SELECT A.username , A.Email , D.Fname
FROM Admin As A , Donor As D
-----------------------------------------------------------------


-- Self Join --
SELECT 
    A.Fname AS Donor_1, 
    B.Fname AS Donor_2, 
    A.BloodType
FROM Donor AS A  
INNER JOIN Donor AS B
ON A.BloodType = B.BloodType 
AND A.Donor_id <> B.Donor_id; 

-----------------------------------------------------------------

-- Non-equijoin
SELECT 
    D.Fname, 
    D.RegistrationDate, 
    DO.DonationDate
FROM Donor AS D
JOIN Donation AS DO 
    ON D.Donor_id = DO.Donor_id
    AND DO.DonationDate > D.RegistrationDate; 


SELECT 
    R.Hospital_id, 
    R.BloodType, 
    R.Quantity AS Requested_Amount,
    S.Quantity AS Available_In_Stock
FROM Blood_Request AS R
JOIN Blood_Stock AS S 
    ON R.BloodType = S.BloodType   
    AND S.Quantity > R.Quantity;     
-----------------------------------------------------------------

-- Subqueries -- 
SELECT BloodType, Quantity
FROM Blood_Stock
WHERE Quantity > (SELECT AVG(Quantity) FROM Blood_Stock);


SELECT Name, City
FROM Hospital
WHERE Hospital_id IN (SELECT Hospital_id 
                     FROM Blood_Request);
-----------------------------------------------------------------


-- Single-Row Subqueries  
SELECT Fname, City, BloodType
FROM Donor
WHERE City = (SELECT City FROM Donor WHERE Donor_id = 5);
-----------------------------------------------------------------


-- Group Functions Single-Row Subqueries  -- 
SELECT BloodType, Quantity
FROM Blood_Stock
WHERE Quantity = (SELECT MIN(Quantity) FROM Blood_Stock);
-----------------------------------------------------------------


-- HAVING Clause With Subquery
SELECT City, COUNT(Donor_id) As NumberOfDonors
FROM Donor
GROUP BY City
HAVING COUNT(Donor_id) > (SELECT COUNT(*) FROM Donor WHERE City = 'Suez');
-----------------------------------------------------------------


-- No Rows Returned
SELECT Fname FROM Donor
WHERE BloodType = (SELECT BloodType FROM Donor WHERE Fname = 'Zaki');
-----------------------------------------------------------------


--Multiple-row Subquery
SELECT Name, City 
FROM Hospital
WHERE Hospital_id IN (SELECT DISTINCT Hospital_id FROM Blood_Request);
-----------------------------------------------------------------


-- IN Operator with Multiple-Row Subqueries
SELECT Fname, BloodType 
FROM Donor
WHERE BloodType IN (SELECT DISTINCT BloodType FROM Blood_Request);
-----------------------------------------------------------------


-- Any Operator with Multiple-Row Subqueries
SELECT BloodType, Quantity
FROM Blood_Stock
WHERE Quantity < ANY (SELECT Quantity FROM Blood_Request);
-----------------------------------------------------------------


-- ALL Operator with Multiple-Row Subqueries
SELECT BloodType, Quantity
FROM Blood_Stock
WHERE Quantity > ALL (SELECT Quantity FROM Blood_Request);
-------------------------------------------------------------------


-- Creating a Simple View 
CREATE VIEW Emergency_O_Donors AS 
SELECT Donor_id, Fname, Phone, BloodType
FROM Donor
WHERE BloodType = 'O-';

SELECT * FROM Emergency_O_Donors;

-- Ex2
CREATE VIEW Low_Stock_Alert AS
SELECT BloodType, Quantity
FROM Blood_Stock
WHERE Quantity < 10;

SELECT * FROM Low_Stock_Alert;
-----------------------------------------------------------------


-- Creating a Complex View 
CREATE VIEW Hospital_Order_Summary 
  (Hospital_Name, Total_Requested_Bags, Max_Single_Order, Average_Order_Size)
AS 
SELECT 
    H.Name, 
    SUM(R.Quantity), 
    MAX(R.Quantity), 
    AVG(R.Quantity)
FROM Hospital AS H 
JOIN Blood_Request AS R 
    ON H.Hospital_id = R.Hospital_id
GROUP BY H.Name;

SELECT * FROM Hospital_Order_Summary;
-----------------------------------------------------------------


-- Performing Top-N Analysis

SELECT TOP 3 Donor_id, Fname, BloodType, Total_Donated_Amount
FROM (
    SELECT D.Donor_id, D.Fname, D.BloodType, SUM(DO.Quantity) AS Total_Donated_Amount
    FROM Donor AS D
    JOIN Donation AS DO ON D.Donor_id = DO.Donor_id
    GROUP BY D.Donor_id, D.Fname, D.BloodType
) AS DonorStats
ORDER BY Total_Donated_Amount DESC;
-----------------------------------------------------------------


-- Create Stored Procedure
CREATE PROCEDURE GetDonorsByBloodType
    @BType VARCHAR(5)
AS
BEGIN
    SELECT Donor_id, Fname, Phone, BloodType 
    FROM Donor
    WHERE BloodType = @BType;
END;

EXEC GetDonorsByBloodType @BType = 'A+';
EXEC GetDonorsByBloodType @BType = 'O-';
EXEC GetDonorsByBloodType @BType = 'AB-';
-----------------------------------------------------------------


-- Stored Procedure With Multiple Parameters
CREATE PROCEDURE GetRequestsByBloodAndQty
    @BType VARCHAR(5),
    @Qty INT
AS
BEGIN
    SELECT Request_id, Hospital_id, BloodType, Quantity, RequestDate
    FROM Blood_Request
    WHERE BloodType = @BType AND Quantity = @Qty;
END;

EXEC GetRequestsByBloodAndQty @BType = 'A-', @Qty = 3;

-- EX2
CREATE PROCEDURE UpdateHospitalContact
    @HospitalID INT,
    @NewName VARCHAR(100),
    @NewPhone VARCHAR(15)
AS
BEGIN
    UPDATE Hospital
    SET Name = @NewName, Phone = @NewPhone
    WHERE Hospital_id = @HospitalID;
END;

EXEC UpdateHospitalContact 
    @HospitalID = 15, 
    @NewName = 'Beni-Suef Specialized Hospital', 
    @NewPhone = '01125478888';
    
    
    SELECT H.Name , H.Phone
    FROM Hospital As H
    WHERE H.Hospital_id = 15
-----------------------------------------------------------------



-- Drop Procedure
CREATE PROCEDURE Temporary_Donor_Count
AS
BEGIN
    SELECT COUNT(*) AS Total_Donors FROM Donor;
END;

EXEC Temporary_Donor_Count;

DROP PROCEDURE Temporary_Donor_Count;
-------------------------------------------------------------------


--------------------------  End Of Course --------------------------





