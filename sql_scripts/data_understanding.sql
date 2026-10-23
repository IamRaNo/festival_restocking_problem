-- Active: 1745477253100@@127.0.0.1@3306@festival_db
select * from festival_dates_clean limit 5;

select * from trends_state_weekly_clean limit 5;


create table dates as
select * from festival_dates_clean;

create table trends as 
select * from trends_state_weekly_clean;


select * from dates;

update dates
set date =  str_to_date(date,"%d-%m-%Y");

select * from dates;

alter table dates
drop column year;

select * from dates;


select count(*) as row_count from dates ;

select * from trends limit 5;

update trends
set week = str_to_date(`week`, "%d-%m-%Y");

select * from trends limit 5;


select count(distinct festival) as unique_festivals from trends;
select count(distinct festival) as unique_festivals from dates;

select count(*) from dates;

select count(*) from trends;