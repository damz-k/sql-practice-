--TASK 
-- how many actors are in the actor table
SELECT count(actor_id)
from actor--200


-- Return the title and special_features columns from the film table with special_features that are exactly 'Deleted Scenes' or contains the term 'Deleted'
SELECT title, special_features 
from film
where special_features ='Deleted scenes' OR special_features like '%Deleted%'


-- how many films fall under each rating category in the film table
SELECT rating, count(rating) AS rating_category
from film
group by rating


-- whats the average replacement cost of films that are not more than 100 minutes in length (round up to 1 decimal place)
SELECT round(AVG(replacement_cost), 1)
from film
where length <= 100 --20

-- what's the average length of films under each rating category, return only rows whose average length is at least 115 
SELECT rating, AVG(length) as 'Average_length'
FROM film
GROUP by rating
having AVG(length) >= 115

-- TIP (Dont forget to Alias your columns when necessary)


SELECT *
FROM customer
INNER JOIN payment
on customer.customer_id = payment.customer_id

SELECT *
from film 
join language
on film.language_id = language.language_id


SELECT film.title as film, language.name as language
from film 
join language
on film.language_id = language.language_id

SELECT *
FROM customer as c
left join address as a
on c.address_id = a.address_id


SELECT c.first_name, c.last_name, a.address, ci.city, co.country
FROM customer as c
left join address as a
on c.address_id = a.address_id
left join city as ci
on ci.city_id = a.city_id
LEFT JOIN country as co 
on co.country_id = ci.country_id;


SELECT c.customer_id, c.first_name, c.last_name, c.email, sum(p.amount)
from customer as c
join payment as p
on c.customer_id = p.customer_id


--joins

SELECT *
from customer
join payment
on customer.customer_id = payment.customer_id

--left join
SELECT *
from customer
left join payment
on customer.customer_id = payment.customer_id

--list all fims and their language

SELECT film.title as film, language.name as language
from film
join language
on film.language_id = language.language_id


--list all the customer and their address, city, country
SELECT c.first_name, c.last_name, a.address, ci.city, co.country
from customer as c 
left join address as a
ON c.address_id = a.address_id
left join city as ci
on ci.city_id = a.address_id
LEFT JOIN country as co
on co.country_id = ci.country_id

-- What's the sum of the amount paid by each customer 
SELECT c.customer_id, c.first_name, c.last_name, c.email, ROUND(SUM(p.amount), 2) AS total_amount
FROM customer AS c 
JOIN payment AS p 
ON c.customer_id = p.customer_id
GROUP BY c.customer_id


-- Retrieve a list of all films from the film table and their categories from the category table

SELECT f.title as film , c.last_update as category
from film as f
join category as c
on f.last_update = c.last_update


-- List all categories and the number of films in each category, even for categories with no films.
SELECT c.last_update as category, f.title
from category as c
left join film as f
on c.last_update = f.last_update


-- List the top 5 most rented films and the number of times each was rented. (HINT: find a way to JOIN the film table to the rental table - use the ERD for visual guidance)
SELECT f.title as title, i.film_id as inventory, r.inventory_id as rented_movie
from film as f
join inventory as i
on f.film_id = i.film_id
join rental as r
on i.inventory_id = r.inventory_id
order by title DESC
limit 5