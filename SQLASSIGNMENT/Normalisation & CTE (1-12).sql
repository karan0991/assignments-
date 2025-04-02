-- Normalisation & CTE (1-12)
-- Q1
-- First Normal Form (1NF):
-- a. Identify a table in Sakila that violates 1NF and normalize it.
-- Violation: Hypothetical address with multi-valued phone (e.g., "123-456, 789-012").
-- Normalization: Split into address (address_id, address, ...) and address_phone (address_id, phone_number).

-- Q2
-- Second Normal Form (2NF):
-- a. Check if a table is in 2NF and normalize if violated.
-- Table: film_actor with added actor_name.
-- Violation: actor_name depends only on actor_id, not full PK (actor_id, film_id).
-- Normalization: Move actor_name to actor table.

-- Q3
-- Third Normal Form (3NF):
-- a. Identify a table violating 3NF and normalize.
-- Violation: Hypothetical customer with store_address.
-- Transitive Dependency: customer_id → store_id → store_address.
-- Normalization: Move store_address to store table.

-- Q4
-- Normalization Process:
-- a. Normalize a table to 2NF.
-- Unnormalized: film_rental (film_id, title, rental_ids, customer_names).
-- 1NF: Split to film_id, title, rental_id, customer_name.
-- 2NF: Split into film (film_id, title), rental (rental_id, film_id, customer_id), customer (customer_id, customer_name).

-- Q5
WITH ActorFilmCount AS (
    SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id, a.first_name, a.last_name
)
SELECT DISTINCT first_name, last_name, film_count
FROM ActorFilmCount
ORDER BY film_count DESC;

-- Q6
WITH FilmLanguage AS (
    SELECT f.title, l.name AS language_name, f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
SELECT title, language_name, rental_rate
FROM FilmLanguage
ORDER BY title;

-- Q7
WITH CustomerRevenue AS (
    SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_revenue
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT first_name, last_name, total_revenue
FROM CustomerRevenue
ORDER BY total_revenue DESC;

-- Q8
WITH FilmRanking AS (
    SELECT title, rental_duration,
           RANK() OVER (ORDER BY rental_duration DESC) AS duration_rank
    FROM film
)
SELECT title, rental_duration, duration_rank
FROM FilmRanking
ORDER BY duration_rank;

-- Q9
WITH FrequentRenters AS (
    SELECT customer_id, COUNT(*) AS rental_count
    FROM rental
    GROUP BY customer_id
    HAVING COUNT(*) > 2
)
SELECT c.customer_id, c.first_name, c.last_name, fr.rental_count
FROM customer c
JOIN FrequentRenters fr ON c.customer_id = fr.customer_id
ORDER BY fr.rental_count DESC;

-- Q10
WITH MonthlyRentals AS (
    SELECT 
        EXTRACT(YEAR FROM rental_date) AS rental_year,
        EXTRACT(MONTH FROM rental_date) AS rental_month,
        COUNT(*) AS rental_count
    FROM rental
    GROUP BY EXTRACT(YEAR FROM rental_date), EXTRACT(MONTH FROM rental_date)
)
SELECT rental_year, rental_month, rental_count
FROM MonthlyRentals
ORDER BY rental_year, rental_month;

-- Q11
WITH ActorPairs AS (
    SELECT 
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id,
        fa1.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
)
SELECT 
    a1.first_name || ' ' || a1.last_name AS actor1_name,
    a2.first_name || ' ' || a2.last_name AS actor2_name,
    f.title AS film_title
FROM ActorPairs ap
JOIN actor a1 ON ap.actor1_id = a1.actor_id
JOIN actor a2 ON ap.actor2_id = a2.actor_id
JOIN film f ON ap.film_id = f.film_id
ORDER BY f.title, actor1_name, actor2_name;

-- Q12
WITH RECURSIVE StaffHierarchy AS (
    SELECT staff_id, first_name, last_name, reports_to, 0 AS level
    FROM staff
    WHERE staff_id = 1
    UNION ALL
    SELECT s.staff_id, s.first_name, s.last_name, s.reports_to, sh.level + 1
    FROM staff s
    JOIN StaffHierarchy sh ON s.reports_to = sh.staff_id
)
SELECT staff_id, first_name, last_name, reports_to, level
FROM StaffHierarchy
ORDER BY level, staff_id;
