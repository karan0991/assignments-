-- Functions (1-8) 
-- Q1
SELECT COUNT(*) AS total_rentals FROM rental;

-- Q2
SELECT AVG(DATEDIFF(return_date, rental_date)) AS avg_rental_duration
FROM rental
WHERE return_date IS NOT NULL;

-- Q3
SELECT UPPER(first_name) AS first_name_upper, UPPER(last_name) AS last_name_upper
FROM customer;

-- Q4
SELECT rental_id, MONTH(rental_date) AS rental_month FROM rental;

-- Q5
SELECT customer_id, COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id;

-- Q6
SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM store s
JOIN staff st ON s.store_id = st.store_id
JOIN payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id;

-- Q7
SELECT c.name AS category_name, COUNT(r.rental_id) AS rental_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name;

-- Q8
SELECT l.name AS language_name, AVG(f.rental_rate) AS avg_rental_rate
FROM language l
JOIN film f ON l.language_id = f.language_id
GROUP BY l.name;
