create database tourplanner;
show databases;
use tourpalnner;
create table friends(name varchar(200),mountainspot boolean,beachspot boolean,hotel boolean,Mall boolean,park boolean,theater boolean);
show tables;
describe friends;
ALTER TABLE friends ALTER COLUMN mountainspot SET DEFAULT false;
ALTER TABLE friends ALTER COLUMN beachspot SET DEFAULT false;
ALTER TABLE friends ALTER COLUMN hotel SET DEFAULT false;
ALTER TABLE friends ALTER COLUMN mall SET DEFAULT false;
ALTER TABLE friends ALTER COLUMN park SET DEFAULT false;
ALTER TABLE friends ALTER COLUMN theater SET DEFAULT false;
insert into friends values ("Narayana",true,false,true,true,false,false);
select * from friends;