/*
 * Copied from movieDBScript
 * We need to change this to make it how the hunting database should be
 */

/* Delete the tables if they already exist */
drop table if exists Rating;


/* Create the schema for our tables */
create table District(
District_id integer primary key, 
Area_coordinates text not null);

create table Hunter(
Hunter_id integer primary key, 
Fname text not null,
Minit text,
Lname text not null,
Resident text);

create table Tags(
Tag_id integer,
Hunter_id integer references Hunter(Hunter_id), 
District_id integer references District(District_id),
Animal text,
Bow_rifle text,
Liscense_year integer,
primary key (Tag_id,Hunter_id,District_id));

create table Employee(
Ssn integer primary key,
Fname text not null,
Minit text,
Lname text not null,
Hours_worked int);

create table Hunting_trip(
Trip_id integer,
Tag_id integer references Tags(Tag_id),
Hunter_id integer references Hunter(Hunter_id),
ESsn integer references Employee(Ssn),
Harvest text,
Points integer,
First_year text,
Days integer);

create table Harvest_estimate(
Liscense_year integer,
Distrit integer references District(District_id),
Num_hunters integer,
Residency text,
Total_harvest integer,
Days_hunted integer,
Num_males integer,
Num_females integer,
Num_first_years integer,
Num_points integer);


/* Populate the tables with our data */

INSERT INTO District (District_id, Area_coordinates)
VALUES  (1, "(0,0),(3,0),(0,3),(3,3)"),
        (2, "(3,3),(6,3),(3,6),(6,6)"),
        (3, "(0,3),(3,3),(0,6),(3,6)"),
        (4, "(3,0),(6,0),(3,3),(6,3)"),
        (5, "(6,6),(9,6),(6,9),(9,9)"),
        (6, "(0,6),(3,6),(0,9),(3,9)"),
        (7, "(6,0),(9,0),(6,3),(9,3)"); 

INSERT INTO Hunter (Hunter_id, Fname,Minit, Lname, Resident)
VALUES  (111111, "Jeff", "L", "Baxter", "Montana"),
        (111112, "Bill", "T", "Boible", "Montana"),
        (111113, "Freddy", "G", "Mercury", "North Dakota"),
        (123456, "Koch", "E", "Babcock", "Idaho"), 
        (123457, "Gooch", "F", "Hill", "Montana"),
        (109344, "Alfred", "D", "Stucky", "Montana"),
        (108457, "John", "Q", "Wonton", "Montana"),
        (123467, "Beese", "M", "Churger", "Wyoming"); 

INSERT INTO Tags (Tag_id, Hunter_id,District_id, Animal, Bow_rifle, Liscense_year)
VALUES  (0001, 111111, 1, "Elk Bull", "Rifle", 2019),
        (0002, 111111, 2, "Mule Deer Buck", "Rifle", 2018),
        (0003, 111113, 3, "Elk Cow", "Bow", 2019),
        (0004, 123467, 4, "Elk Bull", "Rifle", 2017),
        (0005, 108457, 1, "Elk Cow", "Bow", 2019),
        (0006, 108457, 2, "Bear", "Rifle", 2019),
        (0007, 123457, 3, "White Tail Deeer Doe", "Rifle", 2018),
        (0008, 123457, 7, "Elk Cow", "Bow", 2020); 

INSERT INTO Employee (Ssn, Fname, Minit, Lname, Hours_worked)
VALUES  (000112222, "Saul", "T", "Bowser", "40"),
        (111223333, "Jackson", "A", "Woofer", "20"),
        (222334444, "Thomas", "D", "Woofer", "32"),
        (123456789, "Caleb", "West", "Couser", null);H

INSERT INTO Hunting_trip(Trip_id, Tag_id, Hunter_id, ESsn, Points, First_year)
VALUES  (001, 0002, 111111, 000112222, "Mule Deer Buck", 16, "false"),
        (002, 0004, 123467, 111223333, "Elk Bull", 4, "true"),
        (003, 0007, 123457, 222334444, "Mule Deer Doe", null, "false"),

INSERT INTO Harvest_estimate(Liscence_year, Disctrict, Num_hunters, Residency, Total_harvest, Days_hunted, Num_males, Num_females, Num_first_years, Num_points)
VALUES  (2017, 1, 15, "Montana", 3, 15, 30, 25, 10, 50),
        (2018, 1, 15, "Montana", 3, 15, 15, 20, 6, 35),
        (2019, 1, 15, "Montana", 3, 15, 22, 30, 18, 45);

