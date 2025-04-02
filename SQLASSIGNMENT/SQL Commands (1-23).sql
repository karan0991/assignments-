-- SQL Commands (1-23)

-- Q1

-- - PKs:actor.actor_id`, `customer.customer_id`, `film.film_id`, `rental.rental_id`, etc.
-- - FKs:customer.store_id`, `rental.customer_id`, `inventory.film_id`, etc.
-- - Differences: PKs ensure uniqueness; FKs link tables.

-- Q2
SELECT * FROM actor;

-- Q3
SELECT * FROM customer;

-- Q4
SELECT DISTINCT country FROM country;

-- Q5
SELECT * FROM customer WHERE active = 1;

-- Q6
SELECT rental_id FROM rental WHERE customer_id = 1;

-- Q7
SELECT * FROM film WHERE rental_duration > 5;

-- Q8
SELECT COUNT(*) AS film_count FROM film WHERE replacement_cost > 15 AND replacement_cost < 20;

-- Q9
SELECT COUNT(DISTINCT first_name) AS unique_first_names FROM actor;

-- Q10
SELECT * FROM customer LIMIT 10;

-- Q11
SELECT * FROM customer WHERE first_name LIKE 'B%' LIMIT 3;

-- Q12
SELECT title FROM film WHERE rating = 'G' LIMIT 5;

-- Q13
SELECT * FROM customer WHERE first_name LIKE 'A%';

-- Q14
SELECT * FROM customer WHERE first_name LIKE '%A';

-- Q15
SELECT city FROM city WHERE city LIKE 'A%A' LIMIT 4;

-- Q16
SELECT * FROM customer WHERE first_name LIKE '%NI%';

-- Q17
SELECT * FROM customer WHERE first_name LIKE '_R%';

-- Q18
SELECT * FROM customer WHERE first_name LIKE 'A%' AND LENGTH(first_name) >= 5;

-- Q19
SELECT * FROM customer WHERE first_name LIKE 'A%O';

-- Q20
SELECT * FROM film WHERE rating IN ('PG', 'PG-13');

-- Q21
SELECT * FROM film WHERE length BETWEEN 50 AND 100;

-- Q22
SELECT * FROM actor LIMIT 50;

-- Q23
SELECT DISTINCT film_id FROM inventory;

