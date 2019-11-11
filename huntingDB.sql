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
VALUES  (111111, "Jeff", "L", "Baxter", "Montana"),
        (111112, "Bill", "T", "Boible", "Montana"),
        (111113, "Freddy", "G", "Mercury", "North Dakota"),
        (123456, "Koch", "E", "Babcock", "Idaho"),
        (123457, "Gooch", "F", "Hill", "Montana"),
        (109344, "Alfred", "D", "Stucky", "Montana"),
        (108457, "John", "Q", "Wonton", "Montana"),
        (123467, "Beese", "M", "Churger", "Wyoming"); 


-- Tag_id integer,
-- Hunter_id integer references Hunter(Hunter_id), 
-- District_id integer references District(District_id),
-- Animal text,
-- Bow_rifle text,
-- Liscense_year integer,