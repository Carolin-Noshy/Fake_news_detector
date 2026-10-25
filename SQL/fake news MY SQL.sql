use fake_news;
create table train (
id int primary Key,
label text,
statment text,
-- subjects text,
subject1 text,
speaker text,
state_representive text,
state text,
job text,
party text,
barely_true int,
isfalse int,
half_true int,
mostly_true int,
pants_on_fire int,
acontext text,
full_name text,
total_egp text,
sale_size text
);
select * from train;

-- the top 10 subjects has false and liar news 
select subject1, COUNT(*) as total,
sum(case when label in ("False", "Pants_Fire") then 1 else 0 end) as lies_count
from train
group by subject1
order by lies_count DESC
LIMIT 10;

-- top 10 liar context 
select acontext, COUNT(*) as total,
SUM(case when label in ('False', 'Pants-Fire') then 1 else 0 end) as lies_count,
concat(
round(((SUM(case when label in ('False', 'Pants-Fire') then 1 else 0 end)/count(*))*100),2) ,"%")
as percentage
from train
group by acontext
order by lies_count DESC
LIMIT 10;
