use sakila

-- 1. Select all the actors with the first name ‘Scarlett’.
select * from sakila.actor where first_name = 'Scarlett';


-- 2. How many films (movies) are available for rent and how many films have been rented?
select count(distinct(film_id)) as 'Available for Rental' from (sakila.film) where rental_rate > 0;

select count(rental_id) 'Number of Rentals' from sakila.rental; 

-- 3. What are the shortest and longest movie duration? Name the values `max_duration` and `min_duration`.
select MIN(`length`) as 'min_duration',MAX(`length`) as 'max_duration' from sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
select FLOOR(round(AVG(`length`))/60) as 'hours', MOD(round(AVG(`length`)),60) as 'minutes' from sakila.film;

-- 5. How many distinct (different) actors' last names are there?
select count(distinct last_name) from sakila.actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?

select datediff(min(rental_date), max(rental_date)) from sakila.rental; 

-- 7. Show rental info with additional columns month and weekday. Get 20 results.

select *, monthname(rental_date) as 'Rental Month', dayname(rental_date) as 'Rental Day', monthname(return_date) as 'Return Month', dayname(return_date) as 'Return Day' from sakila.rental;  

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *,
case 
when dayname(rental_date) = 'Saturday' then 'Weekend'
when dayname(rental_date) = 'Sunday' then 'Weekend'
else 'Weekday'
end as 'day_type'
from sakila.rental;

-- 9. Get release years.

select release_year from sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.

select * from sakila.film where title like '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.

select * from sakila.film where right(title,6) = 'APOLLO';

-- 12. Get 10 the longest films.

select * from sakila.film order by  `length` desc limit 10;

-- 13. How many films include **Behind the Scenes** content?

select count(*) from sakila.film where special_features like '%Behind the Scenes%';