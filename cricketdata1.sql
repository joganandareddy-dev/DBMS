 


create table Player
(
    pid int primary key,
    pname varchar(50) not null,
    Age int not null,
    Gender varchar(10),
    Role varchar(20),
    Country varchar(30)
)
insert into Player values
(1, 'Virat kohli', 39, 'Male', 'Batsman', 'India'),
(2, 'Rohit Sharma', 38, 'Male', 'Batsman', 'India'),
(3, 'Shubman Gill', 29, 'Male', 'Batsman', 'India'),
(4, 'ABDevillers', 41, 'Male', 'Batsman', 'South Africa'),
(5, 'David Warner', 39, 'Male', 'Batsman', 'Australia'),
(6, 'devdutt padikkal', 32, 'Male', 'Batter', 'India'),
(7, 'Jofra Archer', 41, 'Male', 'Bowler', 'England'),
(8, 'SarfarazKhan', 27, 'Male', 'Bowler', 'India'),
(9, 'Sanju Samson', 32, 'Male', 'Wicketkeeper', 'India'),
(10, 'prince Yadav', 25, 'Male', 'Batsman', 'India'),
(11, 'Russel', 28, 'Male', 'All-rounder', 'West Indies'),
(12, 'RachunRavindra', 34, 'Male', 'Batsman', 'New Zealand')

create table Team
(
    tid int primary key,
    tname varchar(50) not null,
    Country varchar(30),
    Coach varchar(50),
    Ranking int
)
insert into Team values
(101, 'India', 'India', 'MSDhoni', 5),
(102, 'Australia', 'Australia', 'Ricky ponting', 1),
(103, 'England', 'England', 'Johny bairstow', 4),
(104, 'Pakistan', 'Pakistan', 'Babar Azam', 7),
(105, 'New Zealand', 'New Zealand', 'Tom Latham', 3),
(106, 'Afghanistan', 'Afghanistan', 'Mohammad Nabi', 2)

create table Match
(
    mid int primary key,
    tid1 int,
    tid2 int,
    mdate date,
    Venue varchar(100),
    mtype varchar(20),
    winnerid int,

    foreign key (tid1) references Team(tid),
    foreign key (tid2) references Team(tid),
    foreign key (winnerid) references Team(tid)
)
insert into Match values
(201, 101, 102, '2026-01-10', 'chinnaswamy Stadium', 'T20', 101),
(202, 101, 103, '2026-01-15', ' Arun Jaitley Stadium', 'ODI', 101),
(203, 102, 104, '2026-02-05', 'Melbourne Cricket Ground', 'T20', 102),
(204, 101, 105, '2026-02-15', 'Eden Gardens', 'ODI', 105),
(205, 104, 105, '2026-03-01', 'Gaddafi Stadium', 'T20', 104),
(206, 101, 106, '2026-03-10', 'Rajiv Gandhi  Stadium', 'T20', 101)

create table PlayerPerformance
(
    Perfid int primary key,
    mid int,
    pid int,
    Runs int,
    Wickets int,
    Catches int,

    foreign key (mid) references Match(mid),
    foreign key (pid) references Player(pid)
)
insert into PlayerPerformance values
(301, 201, 1, 85, 0, 2),
(302, 202, 1, 150, 0, 1),
(303, 201, 2, 72, 0, 1),
(304, 203, 2, 110, 0, 2),
(305, 202, 3, 35, 0, 1),
(306, 204, 3, 68, 0, 0),
(307, 201, 4, 90, 0, 1),
(308, 205, 4, 55, 0, 1),
(309, 202, 5, 75, 0, 1),
(310, 206, 5, 60, 0, 0),
(311, 201, 6, 12, 3, 0),
(312, 203, 6, 8, 2, 1),
(313, 202, 7, 5, 4, 0),
(314, 204, 7, 7, 2, 1),
(315, 203, 8, 3, 3, 0),
(316, 205, 8, 6, 2, 1),
(317, 204, 9, 65, 0, 3),
(318, 206, 9, 20, 0, 2),
(319, 205, 10, 80, 0, 2),
(320, 206, 10, 40, 0, 1),
(321, 205, 11, 70, 0, 1),
(322, 206, 11, 45, 2, 0),
(323, 204, 12, 95, 0, 1),
(324, 206, 12, 35, 0, 1)

create table Matchofficial
(
    oid int primary key,
    oname varchar(50),
    Role varchar(30),
    Country varchar(30),
    mid int,

    foreign key (mid) references Match(mid)
)
insert into Matchofficial values
(401, 'Micheal Gough', 'Umpire', 'England', 201),
(402, 'Ashok de silva', 'Umpire', 'Sri Lanka', 202),
(403, 'Ahsan Raza', 'Umpire', 'Pakistan', 203),
(404, 'Joel wilson', 'Umpire', 'West Indies', 204),
(405, 'Billy Bowden', 'Umpire', 'New Zealand', 205),
(406, 'Nitin Menon', 'Umpire', 'India', 206)

create table Payment
(
    payid int primary key,
    bid int,
    Amount decimal(10,2),
    Pmode varchar(30),
    Pstatus varchar(30)
)
insert into Payment values
(501, 601, 500.00, 'UPI', 'Success'),
(502, 602, 750.00, 'Card', 'Success'),
(503, 603, 1200.00, 'UPI', 'Success'),
(504, 604, 1500.00, 'Net Banking', 'Success'),
(505, 605, 450.00, 'Card', 'Pending'),
(506, 606, 900.00, 'UPI', 'Success'),
(507, 607, 600.00, 'Cash', 'Success'),
(508, 608, 1800.00, 'Card', 'Success')

select * from Player
select * from Team
select * from Match
select * from PlayerPerformance
select * from Matchofficial
select * from Payment


1
select pname, country from player where role = 'batsman' and age > 25
output:
Virat kohli	India
Rohit Sharma	India
Shubman Gill	India
ABDevillers	South Africa
David Warner	Australia
RachunRavindra	New Zealand


 2
select pname from player where (country = 'india' or country = 'australia') and age < 30
output:
Shubman Gill
SarfarazKhan
prince Yadav

 3
select * from team where ranking <= 10 and country = 'india'
output:
101	India	India	MSDhoni	5

 4
select mid, venue, mtype from match where mtype = 't20' and venue = 'chinnaswamy stadium'
output:201	chinnaswamy Stadium	T20

 5
select pid, runs, wickets from playerperformance where runs > 50 or wickets > 2
output:1	85	0
1	150	0
2	72	0
2	110	0
3	68	0
4	90	0
4	55	0
5	75	0
5	60	0
6	12	3
7	5	4
8	3	3
9	65	0
10	80	0
11	70	0
12	95	0

 6
select distinct country from player
output:Australia
England
India
New Zealand
South Africa
West Indies

 7
select distinct mtype from match
output:ODI
      T20

8
select pname from player where pname like 's%' and country = 'india'
output:Shubman Gill
SarfarazKhan
Sanju Samson

9
select count(*) from player where country = 'india'
output:7

 10
select max(runs) from playerperformance
output:150
 11
select avg(runs) from playerperformance where runs > 20
output:72
12
select sum(wickets) from playerperformance
output:18

13
select min(catches), max(catches), avg(catches) from playerperformance
output:0	3	1

 14
select role, count(*) from player where age > 25 group by role
output:All-rounder	1
Batsman	6
Batter	1
Bowler	2
Wicketkeeper	1
15
select country, count(*) from player where role = 'bowler' group by country
output:1	235
2	182
3	103
4	145
5	135
9	65
10	120
11	115
12	130
 16
select pid, sum(runs) from playerperformance where runs > 20 group by pid
output:1	235
2	182
3	103
4	145
5	135
9	65
10	120
11	115
12	130

 17
select mid, sum(wickets) from playerperformance where wickets > 0 group by mid
output:201	3
202	4
203	5
204	2
205	2
206	2

18
select country, count(*) from player group by country having count(*) > 2
output:India	7

 19
select pname, sum(runs) from player as p
join playerperformance as pp on p.pid = pp.pid
group by p.pid, pname having sum(runs) > 100

 20
select mid, sum(wickets) from playerperformance
group by mid having sum(wickets) > 3

 21
select pname, sum(runs) from player as p
join playerperformance as pp on p.pid = pp.pid
group by p.pid, p.pname
having sum(runs) > 100
order by sum(runs) desc

22
select pname, avg(runs) from player as p
join playerperformance as pp on p.pid = pp.pid
group by p.pid, pname
having avg(runs) > 30
order by avg(runs) asc
output:Virat kohli	Batsman	85
Virat kohli	Batsman	150
Rohit Sharma	Batsman	72
Rohit Sharma	Batsman	110
Shubman Gill	Batsman	35
Shubman Gill	Batsman	68
ABDevillers	Batsman	90
ABDevillers	Batsman	55
David Warner	Batsman	75
David Warner	Batsman	60
devdutt padikkal	Batter	12
devdutt padikkal	Batter	8
Jofra Archer	Bowler	5
Jofra Archer	Bowler	7
SarfarazKhan	Bowler	3
SarfarazKhan	Bowler	6
Sanju Samson	Wicketkeeper	65
Sanju Samson	Wicketkeeper	20
prince Yadav	Batsman	80
prince Yadav	Batsman	40
Russel	All-rounder	70
Russel	All-rounder	45
RachunRavindra	Batsman	95
RachunRavindra	Batsman	35

23
update team set ranking = 1 where tid = 101
output:null
 24
update player set age = age + 1 where age > 30 and role = 'batsman'
output:null
25
update playerperformance set catches = catches + 1 where wickets > 2 and catches < 3
output:null
 26
delete from player where age > 45 and country <> 'india'
output:null
 27
delete from playerperformance where runs < 5 and wickets = 0
output:null

 28
delete from team where ranking > 15 and country = 'india'
output:null
 29
select pname, role, runs from player as p
join playerperformance as pp on p.pid = pp.pid
output:Virat kohli	Batsman	85
Virat kohli	Batsman	150
Rohit Sharma	Batsman	72
Rohit Sharma	Batsman	110
Shubman Gill	Batsman	35
Shubman Gill	Batsman	68
ABDevillers	Batsman	90
ABDevillers	Batsman	55
David Warner	Batsman	75
David Warner	Batsman	60
devdutt padikkal	Batter	12
devdutt padikkal	Batter	8
Jofra Archer	Bowler	5
Jofra Archer	Bowler	7
SarfarazKhan	Bowler	3
SarfarazKhan	Bowler	6
Sanju Samson	Wicketkeeper	65
Sanju Samson	Wicketkeeper	20
prince Yadav	Batsman	80
prince Yadav	Batsman	40
Russel	All-rounder	70
Russel	All-rounder	45
RachunRavindra	Batsman	95
RachunRavindra	Batsman	35



 30
select tname, mdate, venue from team as t
join match as m on t.tid = m.tid1
output:India	2026-01-10	chinnaswamy Stadium
India	2026-01-15	 Arun Jaitley Stadium
Australia	2026-02-05	Melbourne Cricket Ground
India	2026-02-15	Eden Gardens
Pakistan	2026-03-01	Gaddafi Stadium
India	2026-03-10	Rajiv Gandhi  Stadium

31
select pname, mid, runs, wickets from player as p
join playerperformance as pp on p.pid = pp.pid
where pp.runs > 50
output:Virat kohli	2026-01-10	chinnaswamy Stadium	85
Virat kohli	2026-01-15	 Arun Jaitley Stadium	150
Rohit Sharma	2026-01-10	chinnaswamy Stadium	72
Rohit Sharma	2026-02-05	Melbourne Cricket Ground	110
Shubman Gill	2026-01-15	 Arun Jaitley Stadium	35
Shubman Gill	2026-02-15	Eden Gardens	68
ABDevillers	2026-01-10	chinnaswamy Stadium	90
ABDevillers	2026-03-01	Gaddafi Stadium	55
David Warner	2026-01-15	 Arun Jaitley Stadium	75
David Warner	2026-03-10	Rajiv Gandhi  Stadium	60
devdutt padikkal	2026-01-10	chinnaswamy Stadium	12


padikkal	2026-02-05	Melbourne Cricket Ground	8
Jofra Archer	2026-01-15	 Arun Jaitley Stadium	5
Jofra Archer	2026-02-15	Eden Gardens	7
SarfarazKhan	2026-02-05	Melbourne Cricket Ground	3
SarfarazKhan	2026-03-01	Gaddafi Stadium	6
Sanju Samson	2026-02-15	Eden Gardens	65
Sanju Samson	2026-03-10	Rajiv Gandhi  Stadium	20
prince Yadav	2026-03-01	Gaddafi Stadium	80
prince Yadav	2026-03-10	Rajiv Gandhi  Stadium	40
Russel	2026-03-01	Gaddafi Stadium	70
Russel	2026-03-10	Rajiv Gandhi  Stadium	45
RachunRavindra	2026-02-15	Eden Gardens	95
RachunRavindra	2026-03-10	Rajiv Gandhi  Stadium	35
32
select pname, mdate, venue, runs from player as p
join playerperformance as pp on p.pid = pp.pid
join match as m on pp.mid = m.mid
output:Virat kohli	2026-01-10	chinnaswamy Stadium	85
Virat kohli	2026-01-15	 Arun Jaitley Stadium	150
Rohit Sharma	2026-01-10	chinnaswamy Stadium	72
Rohit Sharma	2026-02-05	Melbourne Cricket Ground	110
Shubman Gill	2026-01-15	 Arun Jaitley Stadium	35
Shubman Gill	2026-02-15	Eden Gardens	68
ABDevillers	2026-01-10	chinnaswamy Stadium	90
ABDevillers	2026-03-01	Gaddafi Stadium	55
David Warner	2026-01-15	 Arun Jaitley Stadium	75
David Warner	2026-03-10	Rajiv Gandhi  Stadium	60
devdutt padikkal	2026-01-10	chinnaswamy Stadium	12
devdutt padikkal	2026-02-05	Melbourne Cricket Ground	8
Jofra Archer	2026-01-15	 Arun Jaitley Stadium	5
Jofra Archer	2026-02-15	Eden Gardens	7
SarfarazKhan	2026-02-05	Melbourne Cricket Ground	3
SarfarazKhan	2026-03-01	Gaddafi Stadium	6
Sanju Samson	2026-02-15	Eden Gardens	65
Sanju Samson	2026-03-10	Rajiv Gandhi  Stadium	20
prince Yadav	2026-03-01	Gaddafi Stadium	80
prince Yadav	2026-03-10	Rajiv Gandhi  Stadium	40
Russel	2026-03-01	Gaddafi Stadium	70
Russel	2026-03-10	Rajiv Gandhi  Stadium	45
RachunRavindra	2026-02-15	Eden Gardens	95
RachunRavindra	2026-03-10	Rajiv Gandhi  Stadium	35


33
select pname, mtype, venue, wickets from player as p
join playerperformance as pp on p.pid = pp.pid
join match as m on pp.mid = m.mid
where pp.wickets > 2
output:
devdutt padikkal	T20	chinnaswamy Stadium	3
Jofra Archer	ODI	 Arun Jaitley Stadium	4
SarfarazKhan	T20	Melbourne Cricket Ground	3


 34
select pname from player as p
join playerperformance as pp on p.pid = pp.pid
where runs > (select avg(runs) from playerperformance)
output:
Virat kohli
Virat kohli
Rohit Sharma
Rohit Sharma
Shubman Gill
ABDevillers
ABDevillers
David Warner
David Warner
Sanju Samson
prince Yadav
Russel
RachunRavindra

35
select pname, sum(runs) from player as p
join playerperformance as pp on p.pid = pp.pid
group by p.pid, pname
having sum(runs) > (select sum(runs) from playerperformance where pid = 1)
output:null