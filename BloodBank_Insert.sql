INSERT INTO Admin (username, Email, Password, phone) 
VALUES 
('Abdo_QA', 'abdo.qa@email.com', 'Admin@123', '01011111111'),
('Ahmed_Dev', 'ahmed@email.com', 'Pass@2028', '01122222222'),
('Sara_HR', 'sara.hr@email.com', 'Sara#Secure', '01233333333'),
('Mona_Manager', 'mona@email.com', 'Mona@2026', '01544444444'),
('Ziad_IT', 'ziad@email.com', 'Ziad_IT_99', '01055555555'),
('Omar_DB', 'omar@email.com', 'Omar_Pass', '01166666666'),
('Layla_Ops', 'layla@email.com', 'Layla_123', '01277777777'),
('Hana_Admin', 'hana@email.com', 'Hana_P@ss', '01588888888'),
('Karem_Support', 'karem@email.com', 'Karem_789', '01099999999'),
('Nora_Security', 'nora@email.com', 'Nora_Safe', '01100000000');


INSERT INTO Donor 
(BloodType, Email, Gender, Fname, Lname, Admin_id, RegistrationDate, City, Street, Phone, Medical_History, Country) 
VALUES 
('A+', 'ali@gmail.com', 'Male', 'Ali', 'Ahmed', 1, '2026-01-10', 'Faiyum', 'El-Bahr', '01011223344', 'Good', 'Egypt'),
('O-', 'mariam@gmail.com', 'Female', 'Mariam', 'Zaki', 2, '2026-01-15', 'Cairo', 'Maadi', '01122334455', 'Good', 'Egypt'),
('B+', 'hassan@gmail.com', 'Male', 'Hassan', 'Ali', 4, '2026-02-01', 'Giza', 'Dokki', '01233445566', 'Stable', 'Egypt'),
('AB+', 'nour@gmail.com', 'Female', 'Nour', 'Sayed', 5, '2026-02-05', 'Faiyum', 'Dalla', '01544556677', 'Excellent', 'Egypt'),
('O+', 'yassin@gmail.com', 'Male', 'Yassin', 'Ehab', 6, '2026-02-10', 'Alex', 'Corniche', '01099887766', 'Good', 'Egypt'),
('A-', 'salma@gmail.com', 'Female', 'Salma', 'Hany', 7, '2026-02-15', 'Beni-Suef', 'Main St', '01155667788', 'Good', 'Egypt'),
('B-', 'tarek@gmail.com', 'Male', 'Tarek', 'Fouad', 8, '2026-02-20', 'Tanta', 'Saeed St', '01277889900', 'Stable', 'Egypt'),
('AB-', 'reem@gmail.com', 'Female', 'Reem', 'Adel', 9, '2026-03-01', 'Suez', 'Port St', '01012345678', 'Good', 'Egypt'),
('O+', 'khaled@gmail.com', 'Male', 'Khaled', 'Nabil', 10, '2026-03-05', 'Mansoura', 'Gaya St', '01112223334', 'Excellent', 'Egypt'),
('A+', 'jana@gmail.com', 'Female', 'Jana', 'Wael', 12, '2026-03-10', 'Cairo', 'Zamalek', '01555666777', 'Good', 'Egypt');

INSERT INTO Blood_Stock (BloodType, Quantity, MinimumThreshold, Admin_id, ExpiryDate) VALUES 
('A+', 50, 10, 1, '2026-05-01'),
('A-', 20, 5, 1, '2026-05-05'),
('B+', 45, 10, 1, '2026-05-10'),
('B-', 15, 5, 1, '2026-05-15'),
('O+', 100, 20, 1, '2026-05-20'),
('O-', 30, 10, 1, '2026-05-25'),
('AB+', 10, 5, 1, '2026-05-30'),
('AB-', 5, 2, 1, '2026-06-05'),
('A+', 15, 5, 2, '2026-06-10'),
('O+', 40, 15, 2, '2026-06-15');


INSERT INTO Donation (DonationDate, Quantity, BloodType, Status, Donor_id, Stock_id) VALUES 
('2026-03-15', 500, 'A+', 'Completed', 1, 1),
('2026-03-16', 450, 'O-', 'Completed', 2, 6),
('2026-03-17', 500, 'B+', 'Pending', 3, 3),
('2026-03-18', 400, 'AB+', 'Completed', 4, 7),
('2026-03-19', 500, 'O+', 'Completed', 5, 5),
('2026-03-20', 450, 'A-', 'Completed', 6, 2),
('2026-03-21', 500, 'B-', 'Rejected', 7, 4),
('2026-03-22', 400, 'AB-', 'Completed', 8, 8),
('2026-03-23', 500, 'O+', 'Pending', 9, 10),
('2026-03-24', 450, 'A+', 'Completed', 10, 9);



INSERT INTO Hospital (Name, City, Street, Phone, Status, Admin_id, RegistrationDate) VALUES 
('El-Safwa Hospital', 'Faiyum', 'Liberty St', '084111', 'Active', 1, '2026-01-01'),
('Cairo Medical Center', 'Cairo', 'Tahrir Sq', '022222', 'Active', 1, '2026-01-05'),
('Children Hospital', 'Beni-Suef', 'University St', '082333', 'Active', 1, '2026-01-10'),
('Nile Care', 'Giza', 'Nile St', '024444', 'Pending', 2, '2026-01-15'),
('International Clinic', 'Alex', 'Coastal Rd', '035555', 'Active', 2, '2026-01-20'),
('General Health', 'Tanta', 'Army St', '040666', 'Active', 5, '2026-01-25'),
('Suez Hospital', 'Suez', 'Canal St', '062777', 'Active', 7, '2026-02-01'),
('Mansoura Hope', 'Mansoura', 'Talkha', '050888', 'Inactive', 4, '2026-02-05'),
('Aswan Heart Center', 'Aswan', 'Corniche', '097999', 'Active', 4, '2026-02-10'),
('Red Sea Clinic', 'Hurghada', 'Sheraton St', '065000', 'Active', 5, '2026-02-15');

INSERT INTO Blood_Request (Hospital_id, BloodType, Status, Quantity, UrgencyLevel, RequestDate) VALUES 
(13, 'A+', 'Approved', 5, 'High', '2026-03-25'),
(14, 'O-', 'Pending', 2, 'Critical', '2026-03-26'),
(13, 'B+', 'Approved', 10, 'Normal', '2026-03-27'),
(15, 'AB+', 'Rejected', 1, 'Low', '2026-03-28'),
(16, 'O+', 'Approved', 20, 'High', '2026-03-29'),
(17, 'A-', 'Pending', 3, 'Normal', '2026-03-30'),
(18, 'B-', 'Approved', 4, 'Critical', '2026-03-31'),
(19, 'AB-', 'Approved', 2, 'High', '2026-04-01'),
(20, 'O+', 'Pending', 15, 'Normal', '2026-04-02'),
(21, 'A+', 'Rejected', 8, 'Low', '2026-04-03');


INSERT INTO Notification (Message, [Type], DateOfSent, Hospital_id) VALUES 
('Your request for A+ is approved', 'Approval', GETDATE(), 15),
('Blood stock for O- is low', 'Alert', GETDATE(), 18),
('New donor registered', 'Info', GETDATE(), 17),
('Emergency request received', 'Urgent', GETDATE(), 20),
('Report generated successfully', 'System', GETDATE(), 21);

INSERT INTO Report (ReportType, Content, GeneratedDate, Admin_id) VALUES 
('Monthly Stock', 'Summary of all blood units', GETDATE(), 1),
('Donor Activity', 'List of active donors', GETDATE(), 2),
('Hospital Usage', 'Stats of blood requests', GETDATE(), 4),
('Expiry Alert', 'Units expiring soon', GETDATE(), 4),
('System Log', 'Admin activities log', GETDATE(), 5);

