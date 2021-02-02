use sakila;

-- 1
select distinct last_name from actor;

-- 2
select distinct language_id from film;

-- 3
select sum(rating = 'PG-13') from film; -- v1

select * from film
where rating = 'PG-13'; -- v2

-- 4
select * from film
where release_year = 2006
order by length desc
limit 10;

-- 5
select datediff(max(return_date), min(rental_date)) from rental; -- ?!?!?!

-- 6
select *, date_format(convert(rental_date,date), '%M') as month, date_format(convert(rental_date,date), '%W') as weekday from rental;

-- 7
select *,
case
when date_format(rental_date, '%W') in ('Saturday', 'Sunday') then 'weekend'
else 'workday'
end as day_type
from rental;

-- 8
-- select last_value(rental_date) as LastRentalDate from rental;

select count(rental_id) from rental
where  substr(rental_date,1,7) = '2006-02';

-- select * from rental
-- order by date_format(convert(rental_date,date), '%Y%M') desc;

-- select count(rental_id) from rental
-- where substring(rental_date,1) = '2006-02-14';

-- SELECT rental_id, rental_date, convert(rental_date,date) FROM rental
-- ORDER BY convert(rental_date,date) DESC
-- LIMIT 1;



select count(convert(substring_index(rental_date, ' ', 1), date)) from rental;

select min(substr(rental_date,1,6)) from rental