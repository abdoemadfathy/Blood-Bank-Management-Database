CREATE TABLE Admin
(
    Admin_id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE Donor
(
    Donor_id INT PRIMARY KEY IDENTITY(1,1),
    BloodType VARCHAR(5),
    Email VARCHAR(100) UNIQUE,
    Gender VARCHAR(10),
    Medical_History NVARCHAR(MAX),
    Status VARCHAR(20),
    [Year] INT, 
    [Month] INT, 
    [Day] INT,
    City NVARCHAR(50),
    Street NVARCHAR(100),
    Fname NVARCHAR(50),
    Lname NVARCHAR(50),
    Country NVARCHAR(50),
    RegistrationDate DATE,
    NextEligibleDate DATE,
    Phone VARCHAR(20),
    Admin_id INT,
    FOREIGN KEY (Admin_id) REFERENCES Admin(Admin_id)
);

CREATE TABLE Blood_Stock
(
    Stock_id INT PRIMARY KEY IDENTITY(1,1),
    BloodType VARCHAR(5) NOT NULL,
    ExpiryDate DATE,
    MinimumThreshold INT,
    Quantity INT DEFAULT 0,
    Admin_id INT,
    FOREIGN KEY (Admin_id) REFERENCES Admin(Admin_id)
);

CREATE TABLE Hospital
(
    Hospital_id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    City NVARCHAR(50),
    Street NVARCHAR(100),
    Phone VARCHAR(20),
    ContactPerson NVARCHAR(100),
    Email VARCHAR(100),
    Status VARCHAR(20),
    RegistrationDate DATE,
    LicenseNumber VARCHAR(50),
    Admin_id INT,
    FOREIGN KEY (Admin_id) REFERENCES Admin(Admin_id)
);

CREATE TABLE Donation
(
    Donation_id INT PRIMARY KEY IDENTITY(1,1),
    DonationDate DATE,
    Quantity INT,
    BloodType VARCHAR(5),
    Status VARCHAR(20),
    Donor_id INT,
    Stock_id INT,
    FOREIGN KEY (Donor_id) REFERENCES Donor(Donor_id),
    FOREIGN KEY (Stock_id) REFERENCES Blood_Stock(Stock_id)
);

CREATE TABLE Blood_Request
(
    Request_id INT PRIMARY KEY IDENTITY(1,1),
    Hospital_id INT,
    BloodType VARCHAR(5),
    [Status] VARCHAR(20), 
    Quantity INT,
    UrgencyLevel VARCHAR(20),
    RequestDate DATE,
    Notes NVARCHAR(MAX),
    Stock_id INT,
    FOREIGN KEY (Hospital_id) REFERENCES Hospital(Hospital_id),
    FOREIGN KEY (Stock_id) REFERENCES Blood_Stock(Stock_id)
);

CREATE TABLE Notification
(
    Notification_id INT PRIMARY KEY IDENTITY(1,1),
    Message NVARCHAR(MAX),
    IsRead BIT DEFAULT 0,
    [Type] VARCHAR(50),
    DateOfSent DATETIME,
    Hospital_id INT,
    Donor_id INT,
    FOREIGN KEY (Hospital_id) REFERENCES Hospital(Hospital_id),
    FOREIGN KEY (Donor_id) REFERENCES Donor(Donor_id)
);

CREATE TABLE Report
(
    Report_id INT PRIMARY KEY IDENTITY(1,1),
    ReportType VARCHAR(50),
    Content NVARCHAR(MAX),
    GeneratedDate DATE,
    Admin_id INT,
    FOREIGN KEY (Admin_id) REFERENCES Admin(Admin_id)
);