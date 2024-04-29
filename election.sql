show databases;
create database election;
use election;
create table candidatelist(name varchar(200),id int);
insert into candidatelist values ("Sakthi", 1),("Sadhana",2),("Hariharan",3),("Sabarish",4);
select * from candidatelist;
create table tenkasi_Const(id int,area varchar(200));
ALTER TABLE tenkasi_Const MODIFY COLUMN id INT AUTO_INCREMENT,add primary key (id);
insert into tenkasi_Const (area) values ('Ilanji'),('Senkottai'),('Melagaram'),('courtrallam','puliyarai');
select * from tenkasi_const;
start transaction;
create table result(candidate_id int,constituency_id int,voted_For int);
set autocommit=0;
insert into result values (1,1,1);
commit;
set autocommit=1;
truncate table result;
select * from result;
use election;
show tables;
select * from result;
-- Insert candidate IDs from 1 to 200 into the result table
INSERT INTO result (candidate_id)
SELECT n
FROM (
    SELECT ROW_NUMBER() OVER () AS n
    FROM information_schema.tables
    LIMIT 200  -- Limit the number of rows generated to 200
) AS numbers;
select * from result;
truncate table result;
alter table result modify column candidate_id int Auto_increment,add primary key (candidate_id);
call put_pools();
select * from result;
select * from result where constituency_id=2;