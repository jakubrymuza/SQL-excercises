INSERT INTO Airports VALUES
(1,'Beijing Daxing International Airport', 'China'),
(2,'King Fahd International Airport', 'Saudi Arabia'),
(3,'Denver International Airport', 'USA'),
(4,'Dallas/Fort Worth International Airport', 'USA'),
(5,'Orlando International Airport', 'USA')

INSERT INTO Airlines VALUES
(1,'Delta Air Lines', 'US123', 'USA', null),
(2,'American Airlines Group', 'US124', 'USA', null),
(3,'Lufthansa Group', 'DE123', 'Germany', null),
(4,'United Airlines', 'US125', 'USA', null),
(5,'Air France–KLM', 'FR123', 'France', null)

INSERT INTO Connections VALUES
(1,1,1,3,10,'2021-05-26 13:30:0','04:00:00',1,1,1,2),
(2,2,3,4,20,'2021-04-20 14:30:0','04:30:00',0,1,0,2),
(3,3,2,5,25,'2021-03-12 18:00:0','03:00:00',1,0,1,0),
(4,4,4,1,30,'2021-05-15 12:45:0','02:30:00',0,0,0,0),
(5,5,1,2,10,'2021-03-02 08:30:0','04:20:00',1,1,5,5),
(6,1,4,2,3,'2021-05-06 07:00:0','07:20:00',0,1,0,2),
(7,2,3,2,10,'2021-02-28 20:30:0','02:20:00',1,0,1,0),
(8,3,2,4,15,'2021-05-23 15:00:0','01:50:00',0,1,0,2),
(9,4,2,5,13,'2021-05-24 16:00:0','05:00:00',1,1,3,2),
(10,5,5,3,20,'2021-05-26 16:00:0','04:40:00',0,1,0,2)

INSERT INTO Owners VALUES
(1),
(2),
(3),
(4),
(5)

INSERT INTO Cargo VALUES
(1,1,'produkt1',1,1,10,'package'),
(2,1,'produkt2',2,2,200,'frozen'),
(3,1,'produkt3',7,3,3000,'other'),
(4,2,'produkt4',10,4,300,'other'),
(5,3,'produkt5',1,5,40,'package'),
(6,5,'produkt2',2,1,100,'frozen'),
(7,4,'produkt3',13,2,400,'other'),
(8,6,'produkt4',1,3,100,'other'),
(9,7,'produkt5',1,4,120,'package'),
(10,10,'produkt1',19,5,400,'package'),
(11,8,'produkt2',1,2,500,'frozen'),
(12,5,'produkt3',1,3,400,'other'),
(13,5,'produkt4',1,4,300,'other'),
(14,9,'produkt5',1,5,300,'package'),
(15,3,'produkt1',5,1,500,'package'),
(16,9,'produkt1',2,2,500,'package'),
(17,7,'produkt3',1,4,300,'other')
