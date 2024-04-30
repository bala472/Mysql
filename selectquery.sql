use election;
show tables;
select * from areas;
select * from candidatelist;
select * from result;
alter table candidatelist add column party varchar(200);
update candidatelist set party="DMK" where id=1;
update candidatelist set party="ADMK" where id=2;
update candidatelist set party="NTK" where id=3;
update candidatelist set party="BJP" where id=4;
describe result;
select votedfor,count(votedfor) totalvotes  from result group by votedfor order by count(votedfor) desc; -- total result
select votedfor,count(votedfor) totalvotes from result where area=1 group by votedfor order by count(votedfor) desc; -- area 1 
select votedfor,count(votedfor) totalvotes from result where areas=2 group by votedfor order by count(votedfor) desc; -- area 2
select votedfor,count(votedfor) totalvotes from result where areas=3 group by votedfor order by count(votedfor) desc; -- area 3
select votedfor,count(votedfor) totalvotes from result where areas=4 group by votedfor order by count(votedfor) desc; -- area 4
alter table result rename column voted_for to votedfor;
alter table result rename column constituency_id to area;
alter table result rename column candidate_id to candidateid;
SELECT candidatelist.name, candidatelist.party, COALESCE(vote_counts.totalvotes, 0) AS totalvotes
FROM candidatelist
RIGHT JOIN (
    SELECT votedfor, COUNT(votedfor) AS totalvotes
    FROM result
    WHERE area = 1
    GROUP BY votedfor
    order by count(votedfor) desc
) AS vote_counts ON vote_counts.votedfor = candidatelist.id;
SELECT (select areas.name from areas where id=1) AS area_name, candidatelist.name, candidatelist.party, COALESCE(vote_counts.totalvotes, 0) AS totalvotes
FROM candidatelist
RIGHT JOIN (
    SELECT votedfor, COUNT(votedfor) AS totalvotes
    FROM result
    WHERE area = 1
    GROUP BY votedfor
    order by count(votedfor) desc
) AS vote_counts ON vote_counts.votedfor = candidatelist.id;
