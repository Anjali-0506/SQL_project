-- create database
create database Blood_bank_management_system;
use blood_bank_management_system;
-- create table
create table donor(
donorID int primary key Auto_increment,
name varchar(100)not null,
age int check(age>=18),
gender enum('male','female','other'),
bloodtype enum ('A+','A-','B+','B-','O+','O-','AB+','AB-')not null,
phone varchar(15)unique not null,
address varchar(100),
lastdonationDate DATE
);
-- insert data to the table
INSERT INTO donor (name, age, gender, bloodtype, phone, address, lastdonationDate) VALUES
('John Doe', 28, 'male', 'O+', '1111111111', '123 Street, New York', '2024-01-15'),
('Jane Smith', 35, 'female', 'A-', '2222222222', '456 Avenue, Los Angeles', '2024-02-10'),
('Michael Johnson', 40, 'male', 'B+', '3333333333', '789 Road, Chicago', '2024-03-05'),
('Emily Davis', 29, 'female', 'AB-', '4444444444', '567 Blvd, Houston', '2024-03-20'),
('Daniel Martinez', 37, 'male', 'O-', '5555555555', '901 Lane, Miami', '2024-04-01'),
('Sophia Brown', 32, 'female', 'A+', '6666666666', '102 Street, San Francisco', '2023-12-20'),
('Ethan Williams', 45, 'male', 'B-', '7777777777', '222 Road, Boston', '2024-02-25'),
('Olivia Taylor', 30, 'female', 'O+', '8888888888', '333 Avenue, Seattle', '2024-03-12'),
('Liam Wilson', 42, 'male', 'AB+', '9999999999', '444 Lane, Denver', '2023-11-18'),
('Emma Johnson', 38, 'female', 'O-', '1010101010', '555 Blvd, Austin', '2024-01-30'),
('Noah Garcia', 29, 'male', 'A-', '1212121212', '666 Road, Phoenix', '2024-03-01'),
('Ava Martinez', 34, 'female', 'B+', '1313131313', '777 Drive, Philadelphia', '2023-12-15'),
('William Lee', 41, 'male', 'AB-', '1414141414', '888 Circle, Dallas', '2024-02-05'),
('Mia Anderson', 36, 'female', 'O+', '1515151515', '999 Street, San Diego', '2024-03-08'),
('James Thomas', 27, 'male', 'A+', '1616161616', '111 Lane, Atlanta', '2024-01-12'),
('Charlotte Hernandez', 39, 'female', 'B-', '1717171717', '222 Road, Las Vegas', '2023-11-25'),
('Benjamin Young', 44, 'male', 'O+', '1818181818', '333 Drive, Detroit', '2024-02-14'),
('Amelia King', 31, 'female', 'AB+', '1919191919', '444 Blvd, Portland', '2023-12-30'),
('Lucas Scott', 26, 'male', 'B+', '2020202020', '555 Avenue, Houston', '2024-03-15'),
('Isabella Lopez', 33, 'female', 'A-', '2121212121', '666 Circle, Tampa', '2024-02-28');

-- create table
create table Recipient(
RecipientID int primary key auto_increment,
name varchar(100)not null,
age int not null,
Gender enum('male','female','other'),
BloodtypeRequired enum('A+','A-','B+','B-','O+','O-','AB+','AB-')not null,
phone varchar(15)unique not null,
address varchar(100),
hospital varchar(100)not null
);
-- insert data to the table
INSERT INTO Recipient (name, age, Gender, BloodtypeRequired, phone, address, hospital) VALUES
('Alice Brown', 40, 'female', 'O+', '3111111111', '101 Avenue, NY', 'City Hospital'),
('Bob Johnson', 50, 'male', 'A-', '3222222222', '202 Road, LA', 'Red Cross Hospital'),
('Chris Wilson', 45, 'male', 'B+', '3333333333', '303 Street, Chicago', 'Metro Health Center'),
('Sophia Lee', 30, 'female', 'AB-', '3444444444', '404 Drive, Houston', 'Sunrise Hospital'),
('Ethan Thomas', 55, 'male', 'O-', '3555555555', '505 Circle, Miami', 'National Blood Center'),
('Emma Scott', 29, 'female', 'A+', '3666666666', '606 Lane, Dallas', 'St. Mary\'s Hospital'),
('Daniel White', 42, 'male', 'B-', '3777777777', '707 Avenue, Seattle', 'City Hospital'),
('Olivia Green', 33, 'female', 'O+', '3888888888', '808 Road, Boston', 'General Medical Center'),
('Liam Carter', 48, 'male', 'AB+', '3999999999', '909 Street, Denver', 'Hope Clinic'),
('Mia Hall', 37, 'female', 'O-', '3101010101', '1010 Blvd, Austin', 'Unity Health Center'),
('Noah Adams', 31, 'male', 'A-', '3112121212', '1111 Drive, Phoenix', 'City Hospital'),
('Ava Nelson', 43, 'female', 'B+', '3123131313', '1212 Lane, Philadelphia', 'Community Medical Center'),
('William Baker', 46, 'male', 'AB-', '3134141414', '1313 Road, Detroit', 'Grace Hospital'),
('Charlotte Harris', 39, 'female', 'O+', '3145151515', '1414 Circle, San Diego', 'Wellness Medical Center'),
('James Rivera', 28, 'male', 'A+', '3156161616', '1515 Avenue, Atlanta', 'St. Luke\'s Hospital'),
('Evelyn Cooper', 41, 'female', 'B-', '3167171717', '1616 Street, Las Vegas', 'Providence Medical Center'),
('Benjamin Torres', 44, 'male', 'O+', '3178181818', '1717 Blvd, Portland', 'Health First Hospital'),
('Amelia Ramirez', 32, 'female', 'AB+', '3189191919', '1818 Road, Tampa', 'Mercy Medical Center'),
('Lucas Martinez', 36, 'male', 'B+', '3190202020', '1919 Lane, Houston', 'Guardian Hospital'),
('Isabella Walker', 34, 'female', 'A-', '3201212121', '2020 Circle, New Orleans', 'New Hope Medical Center');
-- create table
create table Bloodstock(
bloodID int primary key auto_increment,
bloodtype enum('A+','A-','B+','B-','O+','O-','AB+','AB-')not null,
quantityavailable int default 0,
collectionDate DATE not null,
expiryDate DATE not null
);
-- insert data to the table
INSERT INTO BloodStock (bloodtype, quantityavailable, collectionDate, expiryDate) VALUES
('O+', 5, '2024-03-01', '2024-06-01'),
('A-', 3, '2024-03-05', '2024-06-05'),
('B+', 7, '2024-03-10', '2024-06-10'),
('AB-', 4, '2024-03-12', '2024-06-12'),
('O-', 6, '2024-03-15', '2024-06-15'),
('A+', 8, '2024-03-18', '2024-06-18'),
('B-', 2, '2024-03-20', '2024-06-20'),
('AB+', 9, '2024-03-22', '2024-06-22'),
('O+', 10, '2024-03-25', '2024-06-25'),
('A-', 5, '2024-03-28', '2024-06-28'),
('B+', 6, '2024-04-01', '2024-07-01'),
('AB-', 3, '2024-04-05', '2024-07-05'),
('O-', 7, '2024-04-10', '2024-07-10'),
('A+', 4, '2024-04-12', '2024-07-12'),
('B-', 5, '2024-04-15', '2024-07-15'),
('AB+', 8, '2024-04-18', '2024-07-18'),
('O+', 9, '2024-04-20', '2024-07-20'),
('A-', 2, '2024-04-22', '2024-07-22'),
('B+', 3, '2024-04-25', '2024-07-25'),
('AB-', 10, '2024-04-28', '2024-07-28');

-- create table 
create table donation(
donationID int primary key auto_increment,
donorID int,
bloodID int,
donationDate DATE not null,
quantity int not null,
foreign key(donorid)references
donor(donorid)on delete cascade,
foreign key(bloodid)references
bloodstock(bloodid)on delete cascade
);
-- insert data to the table
INSERT INTO Donation (donorID, bloodID, donationDate, quantity) VALUES
(1, 1, '2024-03-01', 1),
(2, 2, '2024-03-05', 2),
(3, 3, '2024-03-10', 1),
(4, 4, '2024-03-12', 3),
(5, 5, '2024-03-15', 2),
(6, 6, '2024-03-18', 1),
(7, 7, '2024-03-20', 2),
(8, 8, '2024-03-22', 3),
(9, 9, '2024-03-25', 1),
(10, 10, '2024-03-28', 2),
(11, 11, '2024-04-01', 1),
(12, 12, '2024-04-05', 2),
(13, 13, '2024-04-10', 3),
(14, 14, '2024-04-12', 1),
(15, 15, '2024-04-15', 2),
(16, 16, '2024-04-18', 1),
(17, 17, '2024-04-20', 3),
(18, 18, '2024-04-22', 2),
(19, 19, '2024-04-25', 1),
(20, 20, '2024-04-28', 3);

-- create table
create table request(
requestID int primary key auto_increment,
recipientid int,
bloodid  int,
requestdate DATE not null,
status enum('pending','approved', 'rejected','completed')default 'pending',
foreign key(recipientid)
references recipient(recipientid) on delete cascade,
foreign key(bloodid)references
bloodstock(bloodid)on delete cascade
);
-- insert data to the table
INSERT INTO Request (recipientID, bloodID, requestDate, status) VALUES
(1, 1, '2024-03-01', 'pending'),
(2, 2, '2024-03-05', 'approved'),
(3, 3, '2024-03-10', 'pending'),
(4, 4, '2024-03-12', 'completed'),
(5, 5, '2024-03-15', 'rejected'),
(6, 6, '2024-03-18', 'approved'),
(7, 7, '2024-03-20', 'pending'),
(8, 8, '2024-03-22', 'completed'),
(9, 9, '2024-03-25', 'approved'),
(10, 10, '2024-03-28', 'rejected'),
(11, 11, '2024-04-01', 'pending'),
(12, 12, '2024-04-05', 'approved'),
(13, 13, '2024-04-10', 'completed'),
(14, 14, '2024-04-12', 'rejected'),
(15, 15, '2024-04-15', 'pending'),
(16, 16, '2024-04-18', 'approved'),
(17, 17, '2024-04-20', 'completed'),
(18, 18, '2024-04-22', 'pending'),
(19, 19, '2024-04-25', 'rejected'),
(20, 20, '2024-04-28', 'approved');

-- create table
create table admin (
adminid int primary key auto_increment,
name varchar(100) not null,
email varchar(100)unique not null,
password varchar(225)not null
);
-- insert data to the table
INSERT INTO Admin (name, email, password) VALUES
('Alice Johnson', 'alice.johnson@example.com', 'admin1234'),
('Bob Smith', 'bob.smith@example.com', 'securePass567'),
('Charlie Brown', 'charlie.brown@example.com', 'password789'),
('David Wilson', 'david.wilson@example.com', 'adminPass321'),
('Emma Davis', 'emma.davis@example.com', 'secure9876'),
('Frank Miller', 'frank.miller@example.com', 'admin2024'),
('Grace Moore', 'grace.moore@example.com', 'passAdmin999'),
('Hannah White', 'hannah.white@example.com', 'superSecure555'),
('Isaac Martinez', 'isaac.martinez@example.com', 'admin777'),
('Jack Taylor', 'jack.taylor@example.com', 'manager123'),
('Karen Anderson', 'karen.anderson@example.com', 'adminSuper456'),
('Liam Thomas', 'liam.thomas@example.com', 'strongPass890'),
('Mia Harris', 'mia.harris@example.com', 'adminProtected111'),
('Noah Clark', 'noah.clark@example.com', 'passwordSafe222'),
('Olivia Lewis', 'olivia.lewis@example.com', 'secureLogIn333'),
('Paul Young', 'paul.young@example.com', 'passAdmin777'),
('Quinn King', 'quinn.king@example.com', 'securityLock888'),
('Rachel Scott', 'rachel.scott@example.com', 'adminSafe999'),
('Samuel Adams', 'samuel.adams@example.com', 'passMaster123'),
('Tina Lopez', 'tina.lopez@example.com', 'ultimateSecure555');

--  Get Donors Who Donated in the Last 6 Months
DELIMITER //
CREATE PROCEDURE GetRecentDonors()
BEGIN
    SELECT * FROM Donor 
    WHERE lastdonationDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
END //
DELIMITER ;
CALL GetRecentDonors();

-- Get Total Blood Stock by Type
DELIMITER //
CREATE PROCEDURE GetBloodStock()
BEGIN
    SELECT bloodtype, SUM(quantityavailable) AS total_quantity 
    FROM BloodStock 
    GROUP BY bloodtype;
END //
DELIMITER ;
CALL GetBloodStock();

-- Get Recipients with Pending Requests
DELIMITER //
CREATE PROCEDURE GetPendingRequests()
BEGIN
    SELECT * FROM Request WHERE status = 'pending';
END //
DELIMITER ;
CALL GetPendingRequests();

-- Get Number of Donations per Donor
DELIMITER //
CREATE PROCEDURE GetDonorDonationCount()
BEGIN
    SELECT donorID, COUNT(*) AS total_donations 
    FROM Donation 
    GROUP BY donorID;
END //
DELIMITER ;
CALL GetDonorDonationCount();

-- Get Blood Requests with Recipient Names
DELIMITER //
 CREATE PROCEDURE GetRequestDetails()
BEGIN
    SELECT R.requestID, Rec.name AS recipient_name, B.bloodtype, R.status 
    FROM Request R
    JOIN Recipient Rec ON R.recipientID = Rec.recipientID
    JOIN BloodStock B ON R.bloodID = B.bloodID;
END //
DELIMITER ;
CALL GetRequestDetails();

-- Get Donors Who Have Donated More Than Twice
DELIMITER //
CREATE PROCEDURE GetFrequentDonors()
BEGIN
    SELECT donorID, COUNT(*) AS total_donations 
    FROM Donation 
    GROUP BY donorID 
    HAVING total_donations > 2;
END //
DELIMITER ;
CALL GetFrequentDonors();

-- Get Hospitals with the Most Blood Requests
DELIMITER //
CREATE PROCEDURE GetTopHospitals()
BEGIN
    SELECT Rec.hospital, COUNT(R.requestID) AS total_requests 
    FROM Request R
    JOIN Recipient Rec ON R.recipientID = Rec.recipientID
    GROUP BY Rec.hospital
    ORDER BY total_requests DESC;
END //
DELIMITER ;
CALL GetTopHospitals();

-- Get the Most Frequently Donated Blood Type
DELIMITER //
CREATE PROCEDURE GetMostDonatedBloodType()
BEGIN
    SELECT B.bloodtype, COUNT(D.donationID) AS total_donations 
    FROM Donation D
    JOIN BloodStock B ON D.bloodID = B.bloodID
    GROUP BY B.bloodtype
    ORDER BY total_donations DESC
    LIMIT 1;
END //
DELIMITER ;
CALL GetMostDonatedBloodType();

-- Get Recipients Who Requested a Specific Blood Type
DELIMITER //
CREATE PROCEDURE GetRecipientsByBloodType(IN blood_type ENUM('A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'))
BEGIN
    SELECT Rec.name, Rec.hospital, R.requestDate, R.status 
    FROM Request R
    JOIN Recipient Rec ON R.recipientID = Rec.recipientID
    JOIN BloodStock B ON R.bloodID = B.bloodID
    WHERE B.bloodtype = blood_type;
END //
DELIMITER ;
CALL GetRecipientsByBloodType('O+');

-- Get All Admins Sorted Alphabetically*
DELIMITER //
CREATE PROCEDURE GetAllAdmins()
BEGIN
    SELECT * FROM Admin 
    ORDER BY name ASC;
END //
DELIMITER ;
CALL GetAllAdmins();






