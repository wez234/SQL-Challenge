#No.1
SELECT * 
FROM sakila.actor;

#No.2
SELECT last_name
FROM actor 
WHERE first_name="John";

#No.3
SELECT * 
FROM actor 
WHERE last_name="Neeson";

#No.4
SELECT * FROM actor WHERE actor_id  % "10"; 

#No.5
SELECT description 
FROM film 
WHERE film_id = "100";

#No.6
SELECT * 
FROM film 
WHERE rating = "R";	

#No.7
SELECT * 
FROM film 
WHERE rating <> "R";	

#No.8
SELECT * 
FROM film
ORDER BY length ASC
LIMIT 10;

#No.9
CREATE VIEW longest_runtime
AS
SELECT MAX(length) FROM film;

SELECT * FROM film 
WHERE length = (SELECT * FROM longest_runtime);

#No.10
SELECT * FROM film 
WHERE special_features = "Deleted Scenes";

#No.11
SELECT last_name FROM actor 
GROUP BY last_name
HAVING COUNT(last_name) =1
ORDER BY last_name DESC;

#NO.12
SELECT last_name FROM actor 
GROUP BY last_name
HAVING COUNT(last_name) >1 ;

#NO.13
CREATE VIEW max_actor
AS
SELECT actor_id FROM film_actor
GROUP BY actor_id
HAVING COUNT(actor_id) !=1
ORDER BY COUNT(actor_id) DESC
LIMIT 1;

SELECT CONCAT(first_name, " ", last_name) AS Full_Name FROM actor
WHERE actor_id =(SELECT * from max_actor);



#NO.14
DESCRIBE inventory;
DESCRIBE film;
DESCRIBE rental;

SELECT r.return_date FROM rental AS r
JOIN inventory AS i
ON r.inventory_id = i.inventory_id
JOIN film AS f
ON i.film_id = f.film_id
WHERE f.title = "Academy Dinosaur"
ORDER BY r.return_date DESC
LIMIT 1;

#NO.15
SELECT AVG(length)
FROM film;

#NO.16
select category_id, avg(length)
from film join film_category on film.film_id=film_category.film_id
group by category_id;

#NO.17
SELECT * FROM film
WHERE description LIKE '%robot%';

#NO.18

SELECT COUNT(title) FROM film
WHERE release_year = "2010";

#NO.19
SELECT f.title FROM film AS f
JOIN film_category AS fc
ON f.film_id =fc.film_id
JOIN category AS c
ON fc.category_id = c.category_id
WHERE c.name = "Horror";

#NO.20
SELECT first_name , last_name 
FROM staff
WHERE staff_id ="2";

#NO.21
SELECT f.title FROM film AS f
JOIN film_actor AS fa
ON f.film_id = fa.film_id
JOIN actor AS a
ON fa.actor_id = a.actor_id
WHERE a.first_name = "Fred" AND a.last_name = "Costner";

#NO.22

SELECT DISTINCT COUNT(country) FROM country;

#23. List the name of every language in reverse-alphabetical order.

SELECT DISTINCT name FROM language
ORDER BY name DESC;

#NO.24

SELECT CONCAT(first_name, " ", last_name) AS FullName FROM actor
WHERE last_name LIKE "%son"
ORDER BY first_name ASC;

#NO.25

SELECT c.name FROM category AS c
JOIN film_category AS fc
ON c.category_id = fc.category_id
GROUP BY fc.category_id
HAVING COUNT(fc.category_id) != 1
ORDER BY COUNT(fc.category_id) DESC
LIMIT 1;
