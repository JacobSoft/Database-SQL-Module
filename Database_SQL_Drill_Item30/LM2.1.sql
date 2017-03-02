USE master
GO

IF EXISTS (SELECT * FROM sys.Databases WHERE [name] = 'LibraryManager')
DROP DATABASE LibraryManager
GO

CREATE DATABASE LibraryManager
GO

USE LibraryManager
GO

CREATE TABLE Publisher

(Name varchar (50) PRIMARY KEY, 
[Address] varchar (60) NOT NULL,
Phone varchar (15) NOT NULL
)
GO

INSERT INTO Publisher VALUES ('Hunger Tales','148 Sandy St. Bail, WI 64327','862-634-4618')
INSERT INTO Publisher VALUES ('Wisconsin Books','9837 SW 148th St. Piller, MI 69027','982-674-4456')
INSERT INTO Publisher VALUES ('Pillman Ergo','73823 Eagle Dr. Tampa, FL 27384','362-678-5618')
INSERT INTO Publisher VALUES ('This Is Bananas','90374 Juniper Ct. Millage, NY 83947','832-344-4335')
INSERT INTO Publisher VALUES ('Books Are Not Bananas','9827 Banana Dr. Cleveland, OH 37854','342-611-4446')
INSERT INTO Publisher VALUES ('My Favorite Books','3877 NW Ager St. Preston, WA 98764','360-344-7771')
INSERT INTO Publisher VALUES ('Orbit','9876 SE Jasper Ct. Portland, OR 97221','971-347-6465')
INSERT INTO Publisher VALUES ('Integers','9283 Galaxy Way Chillage, TX 69333','432-134-4589')
INSERT INTO Publisher VALUES ('Thats Weird','2873 Alfred St. Chicago, IL 92875','376-743-5614')
INSERT INTO Publisher VALUES ('Derrick Pub','01837 SW Oak St. Miami, FL 28475','479-163-5689')
INSERT INTO Publisher VALUES ('Barb Matters','36899 Orange Ave. Jollywood, CO 72837','282-309-4891')
INSERT INTO Publisher VALUES ('Question Marks','38994 NW Applet Ave. Pine, MO 98927','738-202-3838')
INSERT INTO Publisher VALUES ('Because Who Needs Em Books','4774 Pepperidge Rd. Biscayne, MI 97363','388-373-2828')
GO

CREATE TABLE Book

(Bookid int PRIMARY KEY, 
Title varchar (60) NOT NULL,
PublisherName varchar (50) NOT NULL FOREIGN KEY REFERENCES Publisher(Name)
)
GO

INSERT INTO Book VALUES (1,'Chubby Apple','Hunger Tales')
INSERT INTO Book VALUES (2,'Skidmore Hotel','Wisconsin Books')
INSERT INTO Book VALUES (3,'Barb Goes Home','Wisconsin Books')
INSERT INTO Book VALUES (4,'The Lost Tribe','Pillman Ergo')
INSERT INTO Book VALUES (5,'Ipsum WHAT','This Is Bananas')
INSERT INTO Book VALUES (6,'Lorem WHO','Books Are Not Bananas')
INSERT INTO Book VALUES (7,'Prescott Bluffs','My Favorite Books')
INSERT INTO Book VALUES (8,'Eat Celery','Hunger Tales')
INSERT INTO Book VALUES (9,'Ted Wants a Cheeseburger','Hunger Tales')
INSERT INTO Book VALUES (10,'Cibola Burn','Orbit')
INSERT INTO Book VALUES (11,'The Expanse','Orbit')
INSERT INTO Book VALUES (12,'Leviathan Wakes','Orbit')
INSERT INTO Book VALUES (13,'Nemesis Games', 'Orbit')
INSERT INTO Book VALUES (14,'Abbadons Gate','Orbit')
INSERT INTO Book VALUES (15,'Avalanche Two','Integers')
INSERT INTO Book VALUES (16,'Synthetic Coma','Thats Weird')
INSERT INTO Book VALUES (17,'But Is It','Derrick Pub')
INSERT INTO Book VALUES (18,'Populating Tables','Barb Matters')
INSERT INTO Book VALUES (19,'Who Is Georgia Comerford?','Question Marks')
INSERT INTO Book VALUES (20,'Billiards For The Weak','Because Who Needs Em Books')
GO

CREATE TABLE Library_Branch

(BranchID int PRIMARY KEY, 
BranchName varchar (30),
[Address] varchar (60)
)
GO

INSERT INTO Library_Branch VALUES (1, 'Sharpstown', '2897 SW Tweed St. Bend, OR 96554')
INSERT INTO Library_Branch VALUES (2, 'Central', '7823 NW Addison Ave. Billings, MT 67833')
INSERT INTO Library_Branch VALUES (3, 'Palace', '9837 SW 104th Ave. St. Paul, MN 78336')
INSERT INTO Library_Branch VALUES (4, 'Bridgewater', '93746 Allison St. Giffer, IN 63748')
GO

CREATE TABLE Book_Copies

(Bookid int FOREIGN KEY REFERENCES Book(Bookid), 
BranchID int FOREIGN KEY REFERENCES Library_Branch(BranchID),
No_of_Copies int
)
GO
--Branch #1
INSERT INTO Book_Copies VALUES (1, 1, 2)
INSERT INTO Book_Copies VALUES (2, 1, 3)
INSERT INTO Book_Copies VALUES (3, 1, 4)
INSERT INTO Book_Copies VALUES (4, 1, 2)
INSERT INTO Book_Copies VALUES (5, 1, 2)
INSERT INTO Book_Copies VALUES (6, 1, 5)
INSERT INTO Book_Copies VALUES (7, 1, 2)
INSERT INTO Book_Copies VALUES (8, 1, 4)
INSERT INTO Book_Copies VALUES (9, 1, 3)
INSERT INTO Book_Copies VALUES (10, 1, 2)
--Brach #2
INSERT INTO Book_Copies VALUES (1, 2, 4)
INSERT INTO Book_Copies VALUES (2, 2, 3)
INSERT INTO Book_Copies VALUES (3, 2, 2)
INSERT INTO Book_Copies VALUES (14, 2, 5)
INSERT INTO Book_Copies VALUES (15, 2, 2)
INSERT INTO Book_Copies VALUES (16, 2, 3)
INSERT INTO Book_Copies VALUES (17, 2, 2)
INSERT INTO Book_Copies VALUES (18, 2, 2)
INSERT INTO Book_Copies VALUES (19, 2, 6)
INSERT INTO Book_Copies VALUES (20, 2, 2)
--Branch #3
INSERT INTO Book_Copies VALUES (11, 3, 2)
INSERT INTO Book_Copies VALUES (10, 3, 3)
INSERT INTO Book_Copies VALUES (12, 3, 4)
INSERT INTO Book_Copies VALUES (13, 3, 2)
INSERT INTO Book_Copies VALUES (1, 3, 5)
INSERT INTO Book_Copies VALUES (20, 3, 3)
INSERT INTO Book_Copies VALUES (8, 3, 2)
INSERT INTO Book_Copies VALUES (9, 3, 2)
INSERT INTO Book_Copies VALUES (6, 3, 8)
INSERT INTO Book_Copies VALUES (5, 3, 2)
--Branch #4
INSERT INTO Book_Copies VALUES (13, 4, 7)
INSERT INTO Book_Copies VALUES (5, 4, 5)
INSERT INTO Book_Copies VALUES (3, 4, 6)
INSERT INTO Book_Copies VALUES (12, 4, 8)
INSERT INTO Book_Copies VALUES (11, 4, 12)
INSERT INTO Book_Copies VALUES (20, 4, 3)
INSERT INTO Book_Copies VALUES (7, 4, 5)
INSERT INTO Book_Copies VALUES (9, 4, 4)
INSERT INTO Book_Copies VALUES (17, 4, 6)
INSERT INTO Book_Copies VALUES (15, 4, 5)
GO

CREATE TABLE Borrower

(CardNo int PRIMARY KEY, 
Name varchar (50),
[Address] varchar (60),
Phone varchar (12)
)
GO

INSERT INTO Borrower VALUES (111666777, 'Janelle Monaco', '8733 NW 123rd Ave Williamsburg, PA 23887', '547-383-9983')
INSERT INTO Borrower VALUES (187490038, 'William Wonson', '893 SW Wonder Dr. Chelsea, NH 33762', '476-323-5689')
INSERT INTO Borrower VALUES (983726722, 'Kelly Kasney', '9928 E Worrick Way Paggs, OH 36823', '468-234-6799')
INSERT INTO Borrower VALUES (178229387, 'Sandeep Pruitt', '39873 W Wonton Place Borgey, WA 98262', '360-453-5456')
INSERT INTO Borrower VALUES (827336782, 'Boris Wyatt', '134 NW 456th St. Denver, CO 98756', '234-655-4478')
INSERT INTO Borrower VALUES (338923699, 'Tray Brushell', '344 NE Prescott St. Portland, OR 97227', '354-383-1445')
INSERT INTO Borrower VALUES (458003448, 'PJ Harmier', '3432 Sandy Circle Loop Pleasanton, PA 34534', '667-778-4690')
INSERT INTO Borrower VALUES (483923477, 'Kathy Berrsing', '39783 Pajama Place Wellfon, CA 98733', '334-776-6433')
INSERT INTO Borrower VALUES (947776312, 'Raj Sakarenakenan', '98711 E Braid Place Saltsman, NJ 89733', '575-133-5467')
INSERT INTO Borrower VALUES (763827987, 'Wilson Stalkher', '9872 W Weird Way Portland, OR 87772', '456-111-5477')
INSERT INTO Borrower VALUES (389477622, 'Patty Parker', '36455 E Burton Rd. Pettigrove, MA 89732', '574-788-1556')
INSERT INTO Borrower VALUES (883122650, 'Benson Derker', '76938 N Bildge Blvd. Zikks, WY 77654', '547-221-5776')
INSERT INTO Borrower VALUES (835099850, 'Jill Jungle', '7638 N Basdge Way Paucks, HI 99872', '353-655-8734')
INSERT INTO Borrower VALUES (988736512, 'Jora Mormont', '234 W Hightop Rd. Jessid, IO 28837', '424-588-3422')
GO

CREATE TABLE Book_Loans

(BookID int FOREIGN KEY REFERENCES Book(BookID), 
BranchID int FOREIGN KEY REFERENCES Library_Branch(BranchID),
CardNo int,
DateOut date,
DueDate date
)
GO
--B1
INSERT INTO Book_Loans VALUES (1, 1, 111666777, '12/18/16', '3/2/17')
INSERT INTO Book_Loans VALUES (2, 1, 111666777, '12/19/16', '3/3/17')
INSERT INTO Book_Loans VALUES (3, 1, 111666777, '11/11/16', '2/24/17')
INSERT INTO Book_Loans VALUES (4, 1, 111666777, '12/23/16', '3/8/17')
INSERT INTO Book_Loans VALUES (5, 1, 111666777, '1/18/17', '4/7/17')
--B2
INSERT INTO Book_Loans VALUES (2, 1, 187490038, '2/18/17', '5/28/17')
INSERT INTO Book_Loans VALUES (6, 1, 187490038, '3/1/17', '6/2/17')
INSERT INTO Book_Loans VALUES (8, 1, 187490038, '1/12/17', '3/19/17')
INSERT INTO Book_Loans VALUES (9, 1, 187490038, '2/17/17', '5/8/17')
INSERT INTO Book_Loans VALUES (3, 1, 187490038, '3/18/17', '6/9/17')
--B3
INSERT INTO Book_Loans VALUES (10, 1, 983726722, '2/8/17', '5/18/17')
INSERT INTO Book_Loans VALUES (6, 1, 983726722, '12/28/16', '3/22/17')
INSERT INTO Book_Loans VALUES (8, 1, 983726722, '1/25/17', '4/21/17')
--B4
INSERT INTO Book_Loans VALUES (9, 1, 178229387, '2/8/17', '3/10/17')
INSERT INTO Book_Loans VALUES (3, 1, 178229387, '4/8/17', '8/22/17')
INSERT INTO Book_Loans VALUES (6, 1, 178229387, '12/28/16', '3/22/17')
--B5
INSERT INTO Book_Loans VALUES (14, 2, 827336782, '2/28/17', '5/2/17')
INSERT INTO Book_Loans VALUES (16, 2, 827336782, '1/3/17', '4/20/17')
INSERT INTO Book_Loans VALUES (19, 2, 827336782, '3/2/17', '5/23/17')
INSERT INTO Book_Loans VALUES (3, 2, 827336782, '2/17/16', '5/18/16')
INSERT INTO Book_Loans VALUES (15, 2, 827336782, '3/6/17', '5/30/17')
INSERT INTO Book_Loans VALUES (17, 4, 827336782, '3/16/17', '6/14/17')
--B6
INSERT INTO Book_Loans VALUES (1, 2, 338923699, '3/22/17', '6/30/17')
INSERT INTO Book_Loans VALUES (2, 2, 338923699, '3/20/17', '6/23/17')
INSERT INTO Book_Loans VALUES (3, 2, 338923699, '4/20/17', '8/13/17')
INSERT INTO Book_Loans VALUES (14, 2, 338923699, '3/2/16', '5/23/16')
--B7
INSERT INTO Book_Loans VALUES (14, 2, 458003448, '2/2/17', '5/29/17')
INSERT INTO Book_Loans VALUES (1, 2, 458003448, '3/21/16', '6/28/16')
INSERT INTO Book_Loans VALUES (19, 2, 458003448, '1/26/17', '5/7/17')
INSERT INTO Book_Loans VALUES (18, 2, 458003448, '2/23/17', '5/14/17')
INSERT INTO Book_Loans VALUES (20, 2, 458003448, '7/17/16', '10/23/16')
INSERT INTO Book_Loans VALUES (15, 4, 458003448, '7/27/16', '10/30/16')
--B8
INSERT INTO Book_Loans VALUES (20, 3, 483923477, '7/28/17', '10/30/17')
INSERT INTO Book_Loans VALUES (12, 3, 483923477, '4/12/17', '7/23/17')
INSERT INTO Book_Loans VALUES (1, 3, 483923477, '2/4/17', '6/20/17')
--B9
INSERT INTO Book_Loans VALUES (10, 3, 947776312, '4/3/17', '8/22/17')
INSERT INTO Book_Loans VALUES (11, 3, 947776312, '1/16/17', '4/25/17')
INSERT INTO Book_Loans VALUES (9, 3, 947776312, '6/5/17', '10/4/17')
INSERT INTO Book_Loans VALUES (6, 3, 947776312, '7/19/17', '10/27/17')
--B10
INSERT INTO Book_Loans VALUES (5, 3, 763827987, '2/3/17', '6/6/17')
INSERT INTO Book_Loans VALUES (1, 3, 763827987, '6/4/17', '9/23/17')
INSERT INTO Book_Loans VALUES (6, 3, 763827987, '2/5/17', '5/2/17')
INSERT INTO Book_Loans VALUES (12, 3, 763827987, '4/2/17', '8/1/17')
--B11
INSERT INTO Book_Loans VALUES (12, 4, 389477622, '5/4/17', '8/6/17')
INSERT INTO Book_Loans VALUES (13, 4, 389477622, '3/28/17', '6/16/17')
INSERT INTO Book_Loans VALUES (17, 4, 389477622, '2/21/17', '5/13/17')
INSERT INTO Book_Loans VALUES (9, 4, 389477622, '6/12/17', '9/30/17')
INSERT INTO Book_Loans VALUES (7, 4, 389477622, '5/17/17', '9/7/17')
--B12
INSERT INTO Book_Loans VALUES (15, 4, 883122650, '3/17/17', '5/7/17')
INSERT INTO Book_Loans VALUES (20, 4, 883122650, '5/16/17', '9/17/17')
INSERT INTO Book_Loans VALUES (3, 4, 883122650, '3/13/17', '6/3/17')
GO

CREATE TABLE Book_Authors

(Bookid int FOREIGN KEY REFERENCES Book(Bookid), 
AuthorName varchar (50) NOT NULL
)
GO

INSERT INTO Book_Authors VALUES (1,'Stephen King')
INSERT INTO Book_Authors VALUES (2,'Bill Johnson')
INSERT INTO Book_Authors VALUES (3,'Cynthia Valenti')
INSERT INTO Book_Authors VALUES (4,'Horace Hamsworth')
INSERT INTO Book_Authors VALUES (5,'Bre Johnson')
INSERT INTO Book_Authors VALUES (6,'Sal Candela')
INSERT INTO Book_Authors VALUES (7,'Jay Yun')
INSERT INTO Book_Authors VALUES (8,'Paul Braestrup')
INSERT INTO Book_Authors VALUES (9,'Barbara Millicent Roberts')
INSERT INTO Book_Authors VALUES (10,'James S.A. Corey')
GO