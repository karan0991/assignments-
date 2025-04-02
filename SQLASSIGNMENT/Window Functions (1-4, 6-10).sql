-- Window Functions (1-4, 6-10)
-- Q1
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(p.amount) DESC) AS spending_rank
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Q2
SELECT 
    f.title,
    p.payment_date,
    p.amount,
    SUM(p.amount) OVER (
        PARTITION BY f.film_id 
        ORDER BY p.payment_date
    ) AS cumulative_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
ORDER BY f.title, p.payment_date;

-- Q3
SELECT 
    f.title,
    f.rental_duration,
    AVG(DATEDIFF(r.return_date, r.rental_date)) AS avg_rental_duration,
    AVG(DATEDIFF(r.return_date, r.rental_date)) OVER (
        PARTITION BY f.rental_duration
    ) AS avg_duration_by_length
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.return_date IS NOT NULL;


-- Q4
WITH RankedFilms AS (
    SELECT 
        c.name AS category_name,
        f.title,
        COUNT(r.rental_id) AS rental_count,
        ROW_NUMBER() OVER (
            PARTITION BY c.category_id 
            ORDER BY COUNT(r.rental_id) DESC
        ) AS rank_in_category
    FROM category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.category_id, c.name, f.film_id, f.title
)
SELECT category_name, title, rental_count, rank_in_category
FROM RankedFilms
WHERE rank_in_category <= 3
ORDER BY category_name, rank_in_category;

-- Q6
SELECT 
    DATE_TRUNC('month', payment_date) AS month,
    SUM(amount) AS monthly_revenue,
    SUM(SUM(amount)) OVER (
        ORDER BY DATE_TRUNC('month', payment_date)
    ) AS cumulative_revenue
FROM payment
GROUP BY DATE_TRUNC('month', payment_date)
ORDER BY month;

-- Q7
WITH CustomerSpending AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_spent,
        NTILE(5) OVER (ORDER BY SUM(p.amount) DESC) AS spending_quintile
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT customer_id, first_name, last_name, total_spent
FROM CustomerSpending
WHERE spending_quintile = 1
ORDER BY total_spent DESC;

-- Q8
SELECT 
    c.name AS category_name,
    COUNT(r.rental_id) AS rental_count,
    SUM(COUNT(r.rental_id)) OVER (
        ORDER BY COUNT(r.rental_id) DESC
    ) AS running_total
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.category_id, c.name
ORDER BY rental_count DESC;

-- Q9
WITH FilmRentals AS (
    SELECT 
        f.film_id,
        f.title,
        fc.category_id,
        COUNT(r.rental_id) AS rental_count,
        AVG(COUNT(r.rental_id)) OVER (PARTITION BY fc.category_id) AS avg_category_rental
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, f.title, fc.category_id
)
SELECT title, rental_count, avg_category_rental
FROM FilmRentals
WHERE rental_count < avg_category_rental
ORDER BY title;

-- Q10
WITH MonthlyRevenue AS (
    SELECT 
        DATE_TRUNC('month', payment_date) AS month,
        SUM(amount) AS monthly_revenue,
        RANK() OVER (ORDER BY SUM(amount) DESC) AS revenue_rank
    FROM payment
    GROUP BY DATE_TRUNC('month', payment_date)
)
SELECT month, monthly_revenue, revenue_rank
FROM MonthlyRevenue
WHERE revenue_rank <= 5
ORDER BY revenue_rank;
