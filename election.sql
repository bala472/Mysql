use election;
show tables;
create table areas(id int,name varchar(100));
insert into areas values (1,"Tenkasi"),(2,"Shencottai"),(3,"Ilanji"),(4,"Puliyarai");
alter table areas add primary key (id);
alter table candidatelist add primary key (id);
create table result(voterID int,areas int,votedfor int,primary key (voterID),foreign key (areas) references areas(id));
alter table result add foreign key (votedfor) references candidatelist(id);
show tables;
select * from areas;
select * from candidatelist;
select * from result;
alter table result modify column voterid int auto_increment;
select votedfor,count(votedfor) totalvotes  from result group by votedfor order by count(votedfor) desc; -- total result
select votedfor,count(votedfor) totalvotes from result where areas=1 group by votedfor order by count(votedfor) desc; -- area 1 
select votedfor,count(votedfor) totalvotes from result where areas=2 group by votedfor order by count(votedfor) desc; -- area 2
select votedfor,count(votedfor) totalvotes from result where areas=3 group by votedfor order by count(votedfor) desc; -- area 3
select votedfor,count(votedfor) totalvotes from result where areas=4 group by votedfor order by count(votedfor) desc; -- area 4
create or replace view area1 as select result.votedfor,count(result.votedfor) totalvotes  from result group by votedfor order by count(votedfor) desc;
create table candidateMinMax(candidateid int,minimumVote int,maximumvote int);
show tables;
create table party(id int,name varchar(200));
alter table party add primary key (id);
insert into party values (1,"DMK"),(2,"ADMK"),(3,"NTK"),(4,"BJP");
alter table candidatelist add constraint partycandidate foreign key (id) references party(id);
show tables;
select * from party;
alter table candidatelist add column party varchar(200);
update candidatelist set party="DMK" where id=1;
update candidatelist set party="ADMK" where id=2;
update candidatelist set party="NTK" where id=3;
update candidatelist set party="BJP" where id=4;
select * from candidatelist;
-- select name,party from candidatelist left join select votedfor,count(votedfor) totalvotes from result where areas=1 group by votedfor order by count(votedfor) desc;
SELECT cl.name AS candidate_name, cl.party AS party_name, COALESCE(vote_counts.totalvotes, 0) AS total_votes
FROM candidatelist cl
LEFT JOIN (
    SELECT votedfor, COUNT(*) AS totalvotes
    FROM result
    WHERE areas = 1
    GROUP BY votedfor
) AS vote_counts ON cl.id = vote_counts.votedfor
ORDER BY COALESCE(vote_counts.totalvotes, 0) DESC;



