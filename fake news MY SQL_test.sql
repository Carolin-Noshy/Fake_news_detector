create database fake_news;
use fake_news;
create table test(
id int primary Key,
label text,
statment text,
subjects text,
speaker text,
job text,
state text,
party text,
barely_true int,
isfalse int,
half_true int,
mostly_true int,
pants_on_fire int,
acontext text
) ;
update test
set party=replace(party,"None" , "Unknown");
 select * from test;
 
select distinct speaker, job , state ,party from test;

-- general distribution of labels
select count(*),label from test group by label order by count(*) desc;
 
 -- hytal3 el speakers ele fe el ghaleb klamhom msh sah 
select speaker ,party, count(label) from test 
where label="false"
group by speaker, party 
having count(label)>1
order by count(label) desc;
 
 
select  party,concat( round((
 ((sum(case when label="True"  then 1 else 0 end))/count(*))*100),2), "%")
 as True_News ,
 concat( round((
 ((sum(case when label="False"  then 1 else 0 end))/count(*))*100),2), "%")
 as False_News 
 from test  group by party ;  

 -- avg of liar news and most-true news for each state
 select round(avg(mostly_true),2) as 'History counts of mostly true news',
 round(avg(pants_on_fire),2) as 'History counts of liar news'  , state from test
 group by state;
 
 
 