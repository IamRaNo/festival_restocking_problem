------------------------------------------------
-- Creation of The Data to solve the first question
------------------------------------------------

-- How many weeks before each festival does demand start rising?

select * from dates;

select * from trends;
create view festival_weekly_base as(
    with temp_table as(
    select 
        week, 
        interest, 
        t.festival, 
        state,
        d.date as festival_date,
        round(datediff(d.date, t.week)/7) as wk_before
    from trends t
    join dates d
        on t.festival = d.festival
        and t.week >= d.date - interval 26 week
        and t.week <  d.date + interval 26 week
    ),
    normal_avg as(
        select
            festival, 
            state, 
            year(festival_date) as festiv_year,
            round(avg(interest),2) as normal_interest
        from temp_table
        where wk_before not between -8 and 8
        group by festival, state, year(festival_date)
    )
    select 
        week, 
        interest, 
        tt.festival, 
        tt.state, 
        tt.festival_date,
        tt.wk_before, 
        na.normal_interest 
    from temp_table tt
    join normal_avg na
        on na.state = tt.state 
        and na.festival = tt.festival 
        and na.festiv_year = year(tt.festival_date)
);

Select * from festival_weekly_base;


------------------------------------------------
-- Created The Data to solve the first question
------------------------------------------------