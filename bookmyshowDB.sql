   
CREATE DATABASE BookmyShowDB


USE BookmyShowDB
CREATE TABLE Customer
(
    CID INT PRIMARY KEY,
    Cname VARCHAR(50),
    Mobile VARCHAR(15),
    Email VARCHAR(100),
    City VARCHAR(50)
)





INSERT INTO Customer VALUES
(101, 'charan', '9876543210', 'chran@gmail.com', 'Hyderabad'),
(102, 'joga', '9876543211', 'joga@gmail.com', 'Bangalore'),
(103, 'abhi', '9876543212', 'abhi@gmail.com', 'Chennai'),
(104, 'bhagi', '9876543213', 'bhagi@gmail.com', 'Mumbai'),
(105, 'sudheer', '9876543214', 'sudheer@gmail.com', 'Delhi'),
(106, 'rohith', '9876543215', 'rohith@gmail.com', 'Kurnool'),
(107, 'pavan', '9876543216', 'pavan@gmail.com', 'Pune'),
(108, 'praveen', '9876543217', 'praveen@gmail.com', 'Hyderabad'),
(109, 'bharani', '9876543218', 'bharani@gmail.com', 'Bangalore'),
(110, 'Suresh', '9876543219', 'suresh@gmail.com', 'Chennai'),
(111, 'jagadessh', '9876543220', 'jagadeesh@gmail.com', 'Mumbai'),
(112, 'vasanth', '9876543221', 'vasanth@gmail.com', 'Delhi'),
(113, 'pavankalyan', '9876543222', 'pavan@gmail.com', 'Kurnool'),
(114, 'Manoj', '9876543223', 'manoj@gmail.com', 'Pune'),
(115, 'sai', '9876543224', 'sai@gmail.com', 'Hyderabad')


CREATE TABLE Movie
(
    MID INT PRIMARY KEY,
    Mname VARCHAR(100),
    Language VARCHAR(30),
    Gender VARCHAR(20),
    Duration INT
)

INSERT INTO Movie VALUES
(201, 'Pushpa 2', 'Telugu', 'Action', 200),
(202, 'resugurram', 'Telugu', 'Action', 187),
(203, 'KGF Chapter 2', 'Kannada', 'Action', 168),
(204, 'Julayi', 'telugu', 'Action', 169),
(205, 'Kalki 2898 AD', 'Telugu', 'Sci-Fi', 180),
(206, 'Leo', 'Tamil', 'Action', 164),
(207, 'varudu', 'Telugu', 'Action', 172),
(208, 'vedham', 'Telugu', 'Action', 175),
(209, '12th Fail', 'Hindi', 'Drama', 147),
(210, 'Premalu', 'Malayalam', 'Romance', 156)


CREATE TABLE Theatre
(
    TID INT PRIMARY KEY,
    Tname VARCHAR(100),
    Location VARCHAR(100),
    City VARCHAR(50),
    Screens INT
)

INSERT INTO Theatre VALUES
(301, 'PVR Cinemas', 'Banjara Hills', 'Hyderabad', 6),
(302, 'INOX', 'MG Road', 'Bangalore', 5),
(303, 'Cinepolis', 'Anna Nagar', 'Chennai', 4),
(304, 'prasad mall pcx', 'Gachibowli', 'Hyderabad', 7),
(305, 'devi theatre', 'Kukatpally', 'Hyderabad', 5)


CREATE TABLE Show
(
    SID INT PRIMARY KEY,
    MID INT,
    TID INT,
    Sdate DATE,
    ShowTime TIME,
    FOREIGN KEY (MID) REFERENCES Movie(MID),
    FOREIGN KEY (TID) REFERENCES Theatre(TID)
)

INSERT INTO Show VALUES
(401, 201, 301, '2026-08-23', '10:00:00'),
(402, 202, 301, '2026-08-23', '14:00:00'),
(403, 203, 302, '2026-08-24', '11:00:00'),
(404, 204, 303, '2026-08-24', '15:00:00'),5
(405, 205, 304, '2026-08-25', '18:00:00'),
(406, 206, 302, '2026-08-25', '19:30:00'),
(407, 207, 305, '2026-08-26', '12:00:00'),
(408, 208, 304, '2026-08-26', '20:00:00'),
(409, 209, 303, '2026-08-27', '16:00:00'),
(410, 210, 302, '2026-08-27', '21:00:00');


CREATE TABLE Booking
(
    BID INT PRIMARY KEY,
    CID INT,
    SID INT,
    Seats INT,
    BookingDate DATE,
    FOREIGN KEY (CID) REFERENCES Customer(CID),
    FOREIGN KEY (SID) REFERENCES Show(SID)
)

INSERT INTO Booking VALUES
(501, 101, 401, 2, '2026-08-20'),
(502, 102, 402, 3, '2026-08-20'),
(503, 103, 403, 2, '2026-08-21'),
(504, 104, 404, 4, '2026-08-21'),
(505, 105, 405, 2, '2026-08-21'),
(506, 106, 406, 3, '2026-08-22'),
(507, 107, 407, 5, '2026-08-22'),
(508, 108, 408, 2, '2026-08-22'),
(509, 109, 409, 4, '2026-08-23'),
(510, 110, 410, 3, '2026-08-23')


CREATE TABLE Payment
(
    PID INT PRIMARY KEY,
    BID INT,
    Amount DECIMAL(10,2),
    PType VARCHAR(20),
    PStatus VARCHAR(20),
    FOREIGN KEY (BID) REFERENCES Booking(BID)
)./dr

INSERT INTO Payment VALUES
(601, 501, 400.00, 'UPI', 'Success'),
(602, 502, 600.00, 'Card', 'Success'),
(603, 503, 400.00, 'UPI', 'Success'),
(604, 504, 800.00, 'Card', 'Success'),
(605, 505, 400.00, 'Cash', 'Success'),
(606, 506, 600.00, 'UPI', 'Success'),
(607, 507, 1000.00, 'Card', 'Success'),
(608, 508, 400.00, 'UPI', 'Success'),
(609, 509, 800.00, 'NetBanking', 'Success'),
(610, 510, 600.00, 'UPI', 'Pending')

SELECT * FROM Customer
SELECT * FROM Movie
SELECT * FROM Theatre
SELECT * FROM Show
SELECT * FROM Booking
SELECT * FROM Payment



1.
select cname from customer where city = 'kurnool'
output:rohith,pavankalyan

2.
select cname , mobile from customer where city ='hyderabad'
output:
charan	9876543210
praveen	9876543217
sai	9876543224

3.select * from movie where language  = 'telugu'
output:

201	Pushpa 2	Telugu	Action	200
202	resugurram	Telugu	Action	187
204	Julayi	telugu	Action	169
205	Kalki 2898 AD	Telugu	Sci-Fi	180
207	varudu	Telugu	Action	172
208	vedham	Telugu	Action	175

4.select Mname, Gender from movie where Gender = 'Action'
output:
 Pushpa 2	Action
resugurram	Action
KGF Chapter 2	Action
Julayi	Action
Leo	Action
varudu	Action
vedham	Action

5.select Mname from movie  where Duration > 150
output:

Pushpa 2
resugurram
KGF Chapter 2
Julayi
Kalki 2898 AD
Leo
varudu
vedham
Premalu

6.select*from theatre where city = 'hyderabad'
output: 

PVR Cinemas	Banjara Hills	Hyderabad	6
prasad mall pcx	Gachibowli	Hyderabad	7
devi theatre	Kukatpally	Hyderabad	5


7. select Tname  , location from theatre where screens > 5  
output:
PVR Cinemas	Banjara Hills
prasad mall pcx	Gachibowli


8.select * from  show where Sdate = '2026-08-23'
output:
401	201	301	2026-08-23	10:00:00.0000000
402	202	301	2026-08-23	14:00:00.0000000


9.select SID,MID,ShowTime from show where ShowTime >  '06:30'
output: 

401	201	10:00:00.0000000
402	202	14:00:00.0000000
403	203	11:00:00.0000000
404	204	15:00:00.0000000
405	205	18:00:00.0000000
406	206	19:30:00.0000000
407	207	12:00:00.0000000
408	208	20:00:00.0000000
409	209	16:00:00.0000000
410	210	21:00:00.0000000

10.select *from Booking where seats >3
output:
504	104	404	4	2026-08-21
507	107	407	5	2026-08-22
509	109	409	4	2026-08-23

11.select BID,CID,Seats from booking where BookingDate = '2026-08-20'
output:

501	101	2
502	102	3

12. select * from payment where amount  > '500.00'
output:

602	502	600.00	Card	Success
604	504	800.00	Card	Success
606	506	600.00	UPI	Success
607	507	1000.00	Card	Success
609	509	800.00	NetBanking	Success
610	510	600.00	UPI	Pending

13. select PID,BID,Ptype from payment where Ptype ='UPI'
output:
601	501	UPI
603	503	UPI
606	506	UPI
608	508	UPI
610	510	UPI

14. select * from payment where Pstatus ='pending'
output:
610	510	600.00	UPI	Pending

15.  select Cname ,Email from customer where city = 'tirupati' or city = 'hyderabad'
output:

charan	chran@gmail.com
praveen	praveen@gmail.com
sai	sai@gmail.com

16. select Mname from movie where language  = 'Telugu' and gender = 'Sci-Fi'
output:

Kalki 2898 AD
17. select  Mname  from movie where  duration > 120 and duration < 175
output:
KGF Chapter 2
Julayi
Leo
varudu
vedham
12th Fail
Premalu

18. select * from customer where city = 'pune' and Email is NOT NULL
output:
107	pavan	9876543216	pavan@gmail.com	Pune
114	Manoj	9876543223	manoj@gmail.com	Pune

 19. select *from theatre  where city = 'hyderabad' or city = 'chennai'
 output:
 301	PVR Cinemas	Banjara Hills	Hyderabad	6
303	Cinepolis	Anna Nagar	Chennai	4
304	prasad mall pcx	Gachibowli	Hyderabad	7
305	devi theatre	Kukatpally	Hyderabad	5

20. select Tname from  theatre  where screens >2 and city  = 'hyderabad'
output:
PVR Cinemas
prasad mall pcx
devi theatre


21. select * from Booking where seats  >=2 and seats <=5
output:
501	101	401	2	2026-08-20
502	102	402	3	2026-08-20
503	103	403	2	2026-08-21
504	104	404	4	2026-08-21
505	105	405	2	2026-08-21
506	106	406	3	2026-08-22
507	107	407	5	2026-08-22
508	108	408	2	2026-08-22
509	109	409	4	2026-08-23
510	110	410	3	2026-08-23

22. select BID ,CID from Booking where BookingDate = '2026-08-20'
output1:

501	101
502	102



23. select * from payment  where amount > 500 and Pstatus = 'success'
output:

602	502	600.00	Card	Success
604	504	800.00	Card	Success
606	506	600.00	UPI	Success
607	507	1000.00	Card	Success
609	509	800.00	NetBanking	Success

24. select PID,Amount ,Ptype from payment  where ptype = 'UPI' or Ptype  = 'Credit card'
output:

601	400.00	UPI
603	400.00	UPI
606	600.00	UPI
608	400.00	UPI
610	600.00	UPI


25. select Cname  from customer where city = 'Tirupati' or city  = 'Hyderabad' and Mobile is NOT NULL
OUTPUT:

charan
praveen
sai

26. select CID, Cname  from customer  where city  ='chennai'
output:

103	abhi
110	Suresh
Suresh

27.
select Mname, language,gender from movie where duration >120 
output:
Pushpa 2	Telugu	Action
resugurram	Telugu	Action
KGF Chapter 2	Kannada	Action
Julayi	telugu	Action
Kalki 2898 AD	Telugu	Sci-Fi
Leo	Tamil	Action
varudu	Telugu	Action
vedham	Telugu	Action
12th Fail	Hindi	Drama
Premalu	Malayalam	Romance

28. select Tname ,city,screens from theatre where screens>3
output:
PVR Cinemas	Hyderabad	6
INOX	Bangalore	5

Cinepolis	Chennai	4
prasad mall pcx	Hyderabad	7
devi theatre	Hyderabad	5


29.select SID,MID,ShowTime from Show where ShowTime > '06:00'
output:
401	201	10:00:00.0000000
402	202	14:00:00.0000000
403	203	11:00:00.0000000
404	204	15:00:00.0000000
405	205	18:00:00.0000000
406	206	19:30:00.0000000
407	207	12:00:00.0000000
408	208	20:00:00.0000000
409	209	16:00:00.0000000
410	210	21:00:00.0000000

30.SELECT PID, Amount, PStatus FROM Payment WHERE Amount > 500
output:
602	600.00	Success
604	800.00	Success
606	600.00	Success
607	1000.00	Success
609	800.00	Success
610	600.00	Pending

 31. SELECT C.Cname, B.BID FROM Customer C INNER JOIN Booking B ON C.CID = B.CID

 output:
 charan	501
joga	502
abhi	503
bhagi	504
sudheer	505
rohith	506
pavan	507
praveen	508
bharani	509
Suresh	510

 32. SELECT C.Cname, C.Mobile, B.Seats FROM Customer C INNER JOIN Booking B ON C.CID = B.CID

 output:
 charan	501
joga	502
abhi	503
bhagi	504
sudheer	505
rohith	506
pavan	507
praveen	508
bharani	509
Suresh	510

 33. SELECT M.Mname, S.ShowTime FROM Movie M INNER JOIN Show S ON M.MID = S.MID
 output:
 Pushpa 2	10:00:00.0000000
resugurram	14:00:00.0000000
KGF Chapter 2	11:00:00.0000000
Julayi	15:00:00.0000000
Kalki 2898 AD	18:00:00.0000000
Leo	19:30:00.0000000
varudu	12:00:00.0000000
vedham	20:00:00.0000000
12th Fail	16:00:00.0000000
Premalu	21:00:00.0000000

 34. SELECT M.Mname, M.Language, S.Sdate FROM Movie M INNER JOIN Show S ON M.MID = S.MID
 output:
 Pushpa 2	10:00:00.0000000
resugurram	14:00:00.0000000
KGF Chapter 2	11:00:00.0000000
Julayi	15:00:00.0000000
Kalki 2898 AD	18:00:00.0000000
Leo	19:30:00.0000000
varudu	12:00:00.0000000
vedham	20:00:00.0000000
12th Fail	16:00:00.0000000
Premalu	21:00:00.0000000


35. SELECT T.Tname, S.ShowTime FROM Theatre T INNER JOIN Show S ON T.TID = S.TID
ouput:

PVR Cinemas	10:00:00.0000000
PVR Cinemas	14:00:00.0000000
INOX	11:00:00.0000000
Cinepolis	15:00:00.0000000
prasad mall pcx	18:00:00.0000000
INOX	19:30:00.0000000
devi theatre	12:00:00.0000000
prasad mall pcx	20:00:00.0000000
Cinepolis	16:00:00.0000000
INOX	21:00:00.0000000


36. SELECT T.Tname, T.City, S.Sdate FROM Theatre T INNER JOIN Show S ON T.TID = S.TID

output:
PVR Cinemas	Hyderabad	2026-08-23
PVR Cinemas	Hyderabad	2026-08-23
INOX	Bangalore	2026-08-24
Cinepolis	Chennai	2026-08-24
prasad mall pcx	Hyderabad	2026-08-25
INOX	Bangalore	2026-08-25
devi theatre	Hyderabad	2026-08-26
prasad mall pcx	Hyderabad	2026-08-26
Cinepolis	Chennai	2026-08-27
INOX	Bangalore	2026-08-27


 37. SELECT M.Mname, T.Tname FROM Movie M INNER JOIN Show S ON M.MID = S.MID INNER JOIN Theatre T ON S.TID = T.TID
 output:
 Pushpa 2	  PVR Cinemas
resugurram	  PVR Cinemas
KGF Chapter 2	  INOX
Julayi	       Cinepolis
Kalki 2898 AD	prasad mall pcx
Leo	            INOX
varudu	      devi theatre
vedham	     prasad mall pcx
12th Fail     	Cinepolis
Premalu	        INOX

 38. SELECT Mname,Tname, City FROM Movie as  M INNER JOIN Show as S ON M.MID = S.MID INNER JOIN Theatre as T ON S.TID = T.TID WHERE City = 'Tirupati'
      select * from movie 
      output:
201	Pushpa 2	Telugu	Action	200
202	resugurram	Telugu	Action	187
203	KGF Chapter 2	Kannada	Action	168
204	Julayi	telugu	Action	169
205	Kalki 2898 AD	Telugu	Sci-Fi	180
206	Leo	Tamil	Action	164
207	varudu	Telugu	Action	172
208	vedham	Telugu	Action	175
209	12th Fail	Hindi	Drama	147
210	Premalu	Malayalam	Romance	156

 39. SELECT C.Cname, M.Mname, B.Seats FROM Customer C INNER JOIN Booking B ON C.CID = B.CID INNER JOIN Show S ON B.SID = S.SID INNER JOIN Movie M ON S.MID = M.MID WHERE B.Seats > 2
 output:
 joga	resugurram	3
bhagi	Julayi	4
rohith	Leo	3
pavan	varudu	5
bharani	12th Fail	4
Suresh	Premalu	3
 
 40. SELECT M.Mname, T.Tname, S.ShowTime FROM Movie M INNER JOIN Show S ON M.MID = S.MID INNER JOIN Theatre T ON S.TID = T.TID WHERE T.City = 'Tirupati' AND S.ShowTime > '18:00:00'
     select * from movie
     output:
201	Pushpa 2	Telugu	Action	200
202	resugurram	Telugu	Action	187
203	KGF Chapter 2	Kannada	Action	168
204	Julayi	telugu	Action	169
205	Kalki 2898 AD	Telugu	Sci-Fi	180
206	Leo	Tamil	Action	164
207	varudu	Telugu	Action	172
208	vedham	Telugu	Action	175
209	12th Fail	Hindi	Drama	147
210	Premalu	Malayalam	Romance	156

 41. SELECT C.Cname, M.Mname, B.BookingDate FROM Customer C INNER JOIN Booking B ON C.CID = B.CID INNER JOIN Show S ON B.SID = S.SID INNER JOIN Movie M ON S.MID = M.MID WHERE B.BookingDate > '2026-08-21'
   output:
rohith	Leo	2026-08-22
pavan	varudu	2026-08-22
praveen	vedham	2026-08-22
bharani	12th Fail	2026-08-23
Suresh	Premalu	2026-08-23


 42. SELECT M.Mname, T.Tname, T.City FROM Movie M INNER JOIN Show S ON M.MID = S.MID INNER JOIN Theatre T ON S.TID = T.TID WHERE LOWER(M.Language) = 'telugu' AND T.City = 'Tirupati'
     select * from movie
     output:
201	Pushpa 2	Telugu	Action	200
202	resugurram	Telugu	Action	187
203	KGF Chapter 2	Kannada	Action	168
204	Julayi	telugu	Action	169
205	Kalki 2898 AD	Telugu	Sci-Fi	180
206	Leo	Tamil	Action	164
207	varudu	Telugu	Action	172
208	vedham	Telugu	Action	175
209	12th Fail	Hindi	Drama	147
210	Premalu	Malayalam	Romance	156


 43. UPDATE Customer SET City = 'Chittoor' WHERE CID = 101
     select * from customer where cid = 101
     output:
     101	charan	9876543210	chran@gmail.com	Chittoor


 44. UPDATE Movie SET Gender = 'Action' WHERE MID = 209
      select * from customer
      output:
101	charan	9876543210	chran@gmail.com	Chittoor
102	joga	9876543211	joga@gmail.com	Bangalore
103	abhi	9876543212	abhi@gmail.com	Chennai
104	bhagi	9876543213	bhagi@gmail.com	Mumbai
105	sudheer	9876543214	sudheer@gmail.com	Delhi
106	rohith	9876543215	rohith@gmail.com	Kurnool
107	pavan	9876543216	pavan@gmail.com	  Pune
108	praveen	9876543217	praveen@gmail.com	Hyderabad
109	bharani	9876543218	bharani@gmail.com	Bangalore
110	Suresh	9876543219	suresh@gmail.com	Chennai
111	jagadessh	9876543220	jagadeesh@gmail.com	Mumbai
112	vasanth	9876543221	vasanth@gmail.com	Delhi
113	pavankalyan	9876543222	pavan@gmail.com	Kurnool
114	Manoj	9876543223	manoj@gmail.com	Pune
115	sai	9876543224	sai@gmail.com	Hyderabad


 45. UPDATE Theatre SET Screens = Screens + 1 WHERE TID = 301
     select * from theatre 
     output:
301	PVR Cinemas	Banjara Hills	Hyderabad	8
302	INOX	MG Road	Bangalore	5
303	Cinepolis	Anna Nagar	Chennai	4
304	prasad mall pcx	Gachibowli	Hyderabad	7
305	devi theatre	Kukatpally	Hyderabad	5


 46. UPDATE Payment SET PStatus = 'Success' WHERE PID = 610
      select * from payment
      output:
601	501	400.00	UPI	Success
602	502	600.00	Card	Success
603	503	400.00	UPI	Success
604	504	800.00	Card	Success
605	505	400.00	Cash	Success
606	506	600.00	UPI	Success
607	507	1000.00	Card	Success
608	508	400.00	UPI	Success
609	509	800.00	NetBanking	Success
610	510	600.00	UPI	Success


 47. UPDATE Payment SET PType = 'UPI' WHERE PStatus = 'Pending' AND Amount < 500
      select * from payment
      output:
 601	501	400.00	UPI	Success
602	502	600.00	Card	Success
603	503	400.00	UPI	Success
604	504	800.00	Card	Success
605	505	400.00	Cash	Success
606	506	600.00	UPI	Success
607	507	1000.00	Card	Success
608	508	400.00	UPI	Success
609	509	800.00	NetBanking	Success
610	510	600.00	UPI	Success

 48. DELETE FROM Customer WHERE CID = 115
     select * from customer
     output:
101	charan	9876543210	chran@gmail.com	Chittoor
102	joga	9876543211	joga@gmail.com	Bangalore
103	abhi	9876543212	abhi@gmail.com	Chennai
104	bhagi	9876543213	bhagi@gmail.com	Mumbai
105	sudheer	9876543214	sudheer@gmail.com	Delhi
106	rohith	9876543215	rohith@gmail.com	Kurnool
107	pavan	9876543216	pavan@gmail.com	Pune
108	praveen	9876543217	praveen@gmail.com	Hyderabad
109	bharani	9876543218	bharani@gmail.com	Bangalore
110	Suresh	9876543219	suresh@gmail.com	Chennai
111	jagadessh	9876543220	jagadeesh@gmail.com	Mumbai
112	vasanth	9876543221	vasanth@gmail.com	Delhi
113	pavankalyan	9876543222	pavan@gmail.com	Kurnool
114	Manoj	9876543223	manoj@gmail.com	Pune


 49. DELETE FROM Movie WHERE Duration < 90
     select * from  movie
     output:
201	Pushpa 2	Telugu	Action	200
202	resugurram	Telugu	Action	187
203	KGF Chapter 2	Kannada	Action	168
204	Julayi	telugu	Action	169
205	Kalki 2898 AD	Telugu	Sci-Fi	180
206	Leo	Tamil	Action	164
207	varudu	Telugu	Action	172
208	vedham	Telugu	Action	175
209	12th Fail	Hindi	Action	147
210	Premalu	Malayalam	Romance	156


  50. DELETE FROM Theatre WHERE Screens < 2 AND City = 'Hyderabad'
       select * from theatre
       output:
301	PVR Cinemas	Banjara Hills	Hyderabad	8
302	INOX	MG Road	Bangalore	5
303	Cinepolis	Anna Nagar	Chennai	4
304	prasad mall pcx	Gachibowli	Hyderabad	7
305	devi theatre	Kukatpally	Hyderabad	5


 51. DELETE FROM Booking WHERE Seats = 1 AND BookingDate < '2026-08-22'
      select * from booking
      output:
 501	101	401	2	2026-08-20
502	102	402	3	2026-08-20
503	103	403	2	2026-08-21
504	104	404	4	2026-08-21
505	105	405	2	2026-08-21
506	106	406	3	2026-08-22
507	107	407	5	2026-08-22
508	108	408	2	2026-08-22
509	109	409	4	2026-08-23
510	110	410	3	2026-08-23


 52. DELETE FROM Payment WHERE PStatus = 'Failed' AND Amount < 300
      select * from payment
           output
601 501	400.00	UPI	Success
602	502	600.00	Card	Success
603	503	400.00	UPI	Success
604	504	800.00	Card	Success
605	505	400.00	Cash	Success
606	506	600.00	UPI	Success
607	507	1000.00	Card	Success
608	508	400.00	UPI	Success
609	509	800.00	NetBanking	Success
610	510	600.00	UPI	Success


 53. UPDATE Movie SET Duration = Duration + 10 WHERE Duration < 120
     select * from movie
          output
 201	Pushpa 2	Telugu	Action	200
202	resugurram	Telugu	Action	187
203	KGF Chapter 2	Kannada	Action	168
204	Julayi	telugu	Action	169
205	Kalki 2898 AD	Telugu	Sci-Fi	180
206	Leo	Tamil	Action	164
207	varudu	Telugu	Action	172
208	vedham	Telugu	Action	175
209	12th Fail	Hindi	Action	147
210	Premalu	Malayalam	Romance	156


 54. UPDATE Theatre SET Screens = Screens + 1 WHERE Screens < 3
     select * from theatre
       output
301	PVR Cinemas	Banjara Hills	Hyderabad	8
302	INOX	MG  Road	 Bangalore	5
303	Cinepolis	Anna Nagar	Chennai	4
304	prasad mall pcx	Gachibowli	Hyderabad	7
305	devi theatre	Kukatpally	Hyderabad	5

 55. UPDATE Theatre SET City = 'Tirupati' WHERE City = 'Chittoor' AND Screens >= 3
     select * from theatre
          output:
  301	PVR Cinemas	Banjara Hills	Hyderabad	8
302	INOX	MG Road	Bangalore	5
303	Cinepolis	Anna Nagar	Chennai	4
304	prasad mall pcx	Gachibowli	Hyderabad	7
305	devi theatre	Kukatpally	Hyderabad	5

 56. UPDATE Movie SET Language = 'Telugu' WHERE LOWER(Language) = 'english' AND Gender = 'Drama'
     select * from movie
   output:
 201	Pushpa 2	Telugu	Action	200
202	resugurram	Telugu	Action	187
203	KGF Chapter 2	Kannada	Action	168
204	Julayi	telugu	Action	169
205	Kalki 2898 AD	Telugu	Sci-Fi	180
206	Leo	Tamil	Action	164
207	varudu	Telugu	Action	172
208	vedham	Telugu	Action	175
209	12th Fail	Hindi	Action	147
210	Premalu	Malayalam	Romance	156


 57. UPDATE Movie SET Gender = 'Action' WHERE LOWER(Language) = 'telugu' AND Duration > 120
     select * from movie
          output:
 201	Pushpa 2	Telugu	Action	200
202	resugurram	Telugu	Action	187
203	KGF Chapter 2	Kannada	Action	168
204	Julayi	telugu	Action	169
205	Kalki 2898 AD	Telugu	Action	180
206	Leo	Tamil	Action	164
207	varudu	Telugu	Action	172
208	vedham	Telugu	Action	175
209	12th Fail	Hindi	Action	147
210	Premalu	Malayalam	Romance	156


 58. UPDATE Show SET ShowTime = '18:00:00' WHERE Sdate = '2026-08-23' AND ShowTime < '18:00:00'
     select * from show
          output:
 401 201 301	2026-08-23	18:00:00.0000000
402	202	301	2026-08-23	18:00:00.0000000
403	203	302	2026-08-24	11:00:00.0000000
404	204	303	2026-08-24	15:00:00.0000000
405	205	304	2026-08-25	18:00:00.0000000
406	206	302	2026-08-25	19:30:00.0000000
407	207	305	2026-08-26	12:00:00.0000000
408	208	304	2026-08-26	20:00:00.0000000
409	209	303	2026-08-27	16:00:00.0000000
410	210	302	2026-08-27	21:00:00.0000000


 59. UPDATE Booking SET Seats = Seats + 1 WHERE Seats < 3
     select * from booking
      output
 501	101	401	3	2026-08-20
502	102	402	3	2026-08-20
503	103	403	3	2026-08-21
504	104	404	4	2026-08-21
505	105	405	3	2026-08-21
506	106	406	3	2026-08-22
507	107	407	5	2026-08-22
508	108	408	3	2026-08-22
509	109	409	4	2026-08-23
510	110	410	3	2026-08-23


 60. UPDATE Booking SET BookingDate = '2026-08-25' WHERE Seats > 4 AND BookingDate < '2026-08-23'
     select * from booking
          output
 501	101	401	3	2026-08-20
502	102	402	3	2026-08-20
503	103	403	3	2026-08-21
504	104	404	4	2026-08-21
505	105	405	3	2026-08-21
506	106	406	3	2026-08-22
507	107	407	5	2026-08-25
508	108	408	3	2026-08-22
509	109	409	4	2026-08-23
510	110	410	3	2026-08-23

 61. UPDATE Payment SET PType = 'UPI' WHERE PType = 'Cash'
     select * from payment
          output:
601 501	400.00	UPI	Success
602	502	600.00	Card	Success
603	503	400.00	UPI	Success
604	504	800.00	Card	Success
605	505	400.00	UPI	Success
606	506	600.00	UPI	Success
607	507	1000.00	Card	Success
608	508	400.00	UPI	Success
609	509	800.00	NetBanking	Success
610	510	600.00	UPI	Success

 62. UPDATE Payment SET PStatus = 'Success' WHERE Amount > 500 AND PStatus = 'Pending'
     select * from payment
   output:
601	501	400.00	UPI	Success
602	502	600.00	Card	Success
603	503	400.00	UPI	Success
604	504	800.00	Card	Success
605	505	400.00	UPI	Success
606	506	600.00	UPI	Success
607	507	1000.00	Card	Success
608	508	400.00	UPI	Success
609	509	800.00	NetBanking	Success
610	510	600.00	UPI	Success


 63. UPDATE Payment SET PStatus = 'Failed' WHERE Amount < 100 AND PStatus = 'Pending'
     select * from payment
          output
601 501	400.00	UPI	Success
602	502	600.00	Card	Success
603	503	400.00	UPI	Success
604	504	800.00	Card	Success
605	505	400.00	UPI	Success
606	506	600.00	UPI	Success
607	507	1000.00	Card	Success
608	508	400.00	UPI	Success
609	509	800.00	NetBanking	Success
610	510	600.00	UPI	Success


 64. UPDATE Payment SET Amount = Amount + 50 WHERE PType = 'UPI' AND Amount < 500
     select * from payment
          output:
601	501	450.00	UPI	Success
602	502	600.00	Card	Success
603	503	450.00	UPI	Success
604	504	800.00	Card	Success
605	505	450.00	UPI	Success
606	506	600.00	UPI	Success
607	507	1000.00	Card	Success
608	508	450.00	UPI	Success
609	509	800.00	NetBanking	Success
610	510	600.00	UPI	Success

65. DELETE FROM Customer WHERE City = 'Tirupati' AND Email LIKE '%@gmail.com'
    select * from customer
         output:
101	charan	9876543210	chran@gmail.com	Chittoor
102	joga	9876543211	joga@gmail.com	Bangalore
103	abhi	9876543212	abhi@gmail.com	Chennai
104	bhagi	9876543213	bhagi@gmail.com	Mumbai
105	sudheer	9876543214	sudheer@gmail.com	Delhi
106	rohith	9876543215	rohith@gmail.com	Kurnool
107	pavan	9876543216	pavan@gmail.com	Pune
108	praveen	9876543217	praveen@gmail.com	Hyderabad
109	bharani	9876543218	bharani@gmail.com	Bangalore
110	Suresh	9876543219	suresh@gmail.com	Chennai
111	jagadessh	9876543220	jagadeesh@gmail.com	Mumbai
112	vasanth	9876543221	vasanth@gmail.com	Delhi
113	pavankalyan	9876543222	pavan@gmail.com	Kurnool
114	Manoj	9876543223	manoj@gmail.com	Pune


 66. DELETE FROM Movie WHERE LOWER(Language) = 'english' AND Duration > 180
     select * from movie
    output:
201	Pushpa 2	Telugu	Action	200
202	resugurram	Telugu	Action	187
203	KGF Chapter 2	Kannada	Action	168
204	Julayi	telugu	Action	169
205	Kalki 2898 AD	Telugu	Action	180
206	Leo	Tamil	Action	164
207	varudu	Telugu	Action	172
208	vedham	Telugu	Action	175
209	12th Fail	Hindi	Action	147
210	Premalu	Malayalam	Romance	156


 67. DELETE FROM Theatre WHERE (City = 'Hyderabad' OR City = 'Chennai') AND Screens < 3
     select * from theatre
     output:
301	PVR Cinemas	Banjara Hills	Hyderabad	8
302	INOX	MG Road	Bangalore	5
303	Cinepolis	Anna Nagar	Chennai	4
304	prasad mall pcx	Gachibowli	Hyderabad	7
305	devi theatre	Kukatpally	Hyderabad	5


 68. DELETE FROM Show WHERE Sdate = '2026-08-23' AND ShowTime < '17:00:00'
     select * from  show
      output:
401 201	301	2026-08-23	18:00:00.0000000
402	202	301	2026-08-23	18:00:00.0000000
403	203	302	2026-08-24	11:00:00.0000000
404	204	303	2026-08-24	15:00:00.0000000
405	205	304	2026-08-25	18:00:00.0000000
406	206	302	2026-08-25	19:30:00.0000000
407	207	305	2026-08-26	12:00:00.0000000
408	208	304	2026-08-26	20:00:00.0000000
409	209	303	2026-08-27	16:00:00.0000000
410	210	302	2026-08-27	21:00:00.0000000


 69. DELETE FROM Booking WHERE Seats > 4 AND BookingDate < '2026-08-23'
     select * from booking
     output:
501	101	401	3	2026-08-20
502	102	402	3	2026-08-20
503	103	403	3	2026-08-21
504	104	404	4	2026-08-21
505	105	405	3	2026-08-21
506	106	406	3	2026-08-22
507	107	407	5	2026-08-25
508	108	408	3	2026-08-22
509	109	409	4	2026-08-23
510	110	410	3	2026-08-23

 70. DELETE FROM Payment WHERE Amount > 1000 AND PStatus = 'Failed'
     select * from payment
     output:
601	501	400.00	UPI	Success
602	502	600.00	Card	Success
603	503	400.00	UPI	Success
604	504	800.00	Card	Success
605	505	400.00	Cash	Success
606	506	600.00	UPI	Success
607	507	1000.00	Card	Success
608	508	400.00	UPI	Success
609	509	800.00	NetBanking	Success
610	510	600.00	UPI	Success

71.select count (*) from customer where city = 'pune' and email like 'manoj@gmail.com'
   output:1

72. select count(*) from customer where city = 'hydderabad' or city = 'chennai'
   output:2


73. select count (*) from movie where language  ='telugu' and gender ='action'
   output:6

74. select count (*) from movie  where  duration >120 and duration<160        
   output: 2

75 select count (*) from theatre where city = 'hyderabad'and screens >3
    output: 3
  

 76. select count (*) from   booking    where seats >=3  and seats<=5
     output: 10

  77. select MIN(duration) from movie where language  = ' telugu' and gender ='action' 
      output: null


  78.   select count(*) from customer where city = 'tirupati' and email like '%@gmail.com'
      output: 0

  79.   select count(*) from customer where city = 'hyderabad' or city = 'chennai'
       output: 3


  80. select count(*) from movie where lower(language) = 'telugu' and gender = 'action'
      output: 6


   81. select count(*) from movie where duration > 120 and duration < 180
       output: 7
 
82 .select count(*) from booking where seats >= 3 and seats <= 5
     output:0


83. select min(duration) from movie where lower(language) = 'telugu' and gender = 'action'
    output: 169


84 .select max(duration) from movie where lower(language) = 'english' or language = 'hindi'
    output: 147


 85. select avg(duration) from movie where duration > 120 and duration < 180
output: 164


 86.select min(screens) from theatre where city = 'tirupati' and screens > 2
output: null


 87.select max(screens) from theatre where city = 'hyderabad' or city = 'chennai'
output:8


88.select avg(screens) from theatre where city = 'tirupati' and screens >= 3
output:null


89.select min(seats) from booking where seats > 1 and seats < 5
output:3


90. select max(seats) from booking where bookingdate > '2026-08-21' and seats > 2
output:5


91. select avg(amount) from payment where pstatus = 'success' and amount > 500
output: 733.33


92.select sum(amount) from payment where pstatus = 'success' and amount > 500
output: 4400.00


93.select sum(amount) from payment where ptype = 'upi' and amount > 300
output: 3000.00


94.select sum(amount) from payment where pstatus = 'success' and ptype = 'upi' and amount > 500
output:1200.00


95.select distinct city from theatre where screens > 2 and screens < 6
output:
Bangalore
Chennai
Hyderabad


96.select distinct pstatus from payment where ptype = 'upi' or ptype = 'card'
output:success

97.select distinct sdate from show where showtime > '18:00:00' and showtime < '22:00:00'
output:
2026-08-25
2026-08-26
2026-08-27


98.select cname from customer where cname like 'a%' and city = 'tirupati'
output:null


99.select cname from customer where (cname like 'r%' or cname like 's%') and city = 'hyderabad'
output:null

100.select cname, email from customer where cname like '%a%' and email like '%@gmail.com'
output:
charan	chran@gmail.com
joga	joga@gmail.com
abhi	abhi@gmail.com
bhagi	bhagi@gmail.com
pavan	pavan@gmail.com
praveen	praveen@gmail.com
bharani	bharani@gmail.com
jagadessh	jagadeesh@gmail.com
vasanth	vasanth@gmail.com
pavankalyan	pavan@gmail.com
Manoj	manoj@gmail.com

101.select mname from movie where mname like 's%' and lower(language) = 'telugu'
output: null

102.select language, avg(duration) from movie where duration > 100 group by language
output:
Hindi	147
Kannada	168
Malayalam	156
Tamil	164
Telugu	180

103.select city, count(*) from theatre where screens >= 3 group by city
output:
Bangalore	1
Chennai	1
Hyderabad	3

104.select city, avg(screens) from theatre where screens > 2 group by city
output:
Bangalore	5
Chennai	4
Hyderabad	6


105.select ptype, sum(amount) from payment where pstatus = 'success' group by ptype
output:
Card	2400.00
NetBanking	800.00
UPI	3000.00


106.select city, count(*) from customer group by city having count(*) > 2
output: null

107. select language, count(*) from movie group by language having count(*) > 3
output:Telu                 gu	6

108.select gender, avg(duration) from movie group by gender having avg(duration) > 120
output:
Action	173
Romance	156



109.select gender, count(*) from movie where lower(language) = 'telugu' group by gender having count(*) > 2
output:Action	6

 110 select cid, sum(seats) from booking where seats > 1 group by cid having sum(seats) > 5
output:null

 111. select * from movie
      where duration = (select max(duration) from movie);
      output: 201	Pushpa 2	Telugu	Action	200

 112. select * from movie
      where duration = (select min(duration) from movie);
      output 209	12th Fail	Hindi	Action	147

 113. select * from theatre
     where screens = (select max(screens) from theatre);
     output:301	PVR Cinemas	Banjara Hills	Hyderabad	8


 114. select * from theatre
      where screens = (select min(screens) from theatre);
      output:303	Cinepolis	Anna Nagar	Chennai	4

 115. select * from booking
where seats = (select max(seats) from booking);
 output: 507	107	407	5	2026-08-25

116.select * from booking
where seats = (select min(seats) from booking);
 output:501	101	401	3	2026-08-20
502	102	402	3	2026-08-20
503	103	403	3	2026-08-21
505	105	405	3	2026-08-21
506	106	406	3	2026-08-22
508	108	408	3	2026-08-22
510	110	410	3	2026-08-23

117. select * from payment
where amount = (select max(amount) from payment);
 output:607	507	1000.00	Card	Success

 118. 
select * from payment
where amount = (select min(amount) from payment);
output:601	501	450.00	UPI	Success
603	503	450.00	UPI	Success
605	505	450.00	UPI	Success
608	508	450.00	UPI	Success

 119. select mname from movie
where duration > (select avg(duration) from movie);
output:Pushpa 2
resugurram
Kalki 2898 AD
varudu
vedham


120.select tname from theatre
where screens > (select avg(screens) from theatre);
output:PVR Cinemas
prasad mall pcx

121. select mname from movie
where duration > (select duration from movie where mid = 205);
output:Pushpa 2
   resugurram

122. 
select tname from theatre
where screens > (select screens from theatre where tid = 102);
output: null

123. 
select cname from customer
where city = (select city from customer where cid = 105);
output:sudheer
vasanth

 124. select * from booking
where seats > (select seats from booking where bid = 305);
output:null
 125.select * from payment
where amount > (select amount from payment where pid = 405);
output:null

 126. select mname from movie
where duration < (select avg(duration) from movie);
output:KGF Chapter 2
Julayi
Leo
12th Fail
Premalu

 127. select tname from theatre
where screens < (select avg(screens) from theatre);
output:Cinepolis

 128. select cname from customer
where cid in (select cid from booking);
 output:charan
joga
abhi
bhagi
sudheer
rohith
pavan
praveen
bharani
Suresh

 129.select mname from movie
where mid in (select mid from show);
output:Pushpa 2
resugurram
KGF Chapter 2
Julayi
Kalki 2898 AD
Leo
varudu
vedham
12th Fail
Premalu

 130. select tname from theatre
where tid in (select tid from show);
output:PVR Cinemas
INOX
Cinepolis
prasad mall pcx
devi theatre

 131. select cname from customer
where cid not in (select cid from booking);
output:jagadessh
vasanth
pavankalyan
Manoj
 132. select mname from movie
where duration > (select avg(duration) from movie)
and lower(language) = 'telugu';
output:Pushpa 2
resugurram
Kalki 2898 AD
varudu
vedham

133.select tname from theatre
where screens > (select avg(screens) from theatre)
and city = 'tirupati';
output: null


134.select * from payment
where amount > (select avg(amount) from payment)
and pstatus = 'success';
output:604	504	800.00	Card	Success
607	507	1000.00	Card	Success
609	509	800.00	NetBanking	Success

 135.select cname from customer
where cid in (select cid from booking where seats > 2);
output:charan
joga
abhi
bhagi
sudheer
rohith
pavan
praveen
bharani
Suresh