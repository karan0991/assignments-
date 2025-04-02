-- General Questions (1-10)
-- Q1

CREATE TABLE employees (
    emp_id INTEGER NOT NULL PRIMARY KEY,
    emp_name TEXT NOT NULL,
    age INTEGER CHECK (age >= 18),
    email TEXT UNIQUE,
    salary DECIMAL DEFAULT 30000
);
-- Q2


--  Constraints enforce rules to ensure data accuracy and consistency:
-- Prevent invalid data (e.g., NULLs in required fields, duplicates in unique columns), maintaining database reliability.
-- - Examples:
--   - `NOT NULL`: Ensures a value (e.g., `emp_name TEXT NOT NULL`).
--   - `PRIMARY KEY`: Unique identifier (e.g., `emp_id INTEGER PRIMARY KEY`).
--   - `UNIQUE`: No duplicates (e.g., `email TEXT UNIQUE`).
--   - `CHECK`: Condition enforcement (e.g., `CHECK (age >= 18)`).
--   - `FOREIGN KEY`: Referential integrity (e.g., linking tables).

-- Q3
-- NOT NULL: Ensures mandatory data (e.g., `emp_name` must exist).
-- - Primary Key and NULL:No, a PK cannot contain NULLs because it must uniquely identify rows, and NULL is undefined, breaking uniqueness.

-- Q4 
-- Add Constraint (e.g., UNIQUE on `email`):

--   ALTER TABLE employees ADD CONSTRAINT unique_email UNIQUE (email);

--   - Steps: Use `ALTER TABLE`, specify `ADD CONSTRAINT`, name it, define type.
-- - Remove Constraint:
--   
--   ALTER TABLE employees DROP CONSTRAINT unique_email;
--   
--   - Steps: Use `ALTER TABLE`, specify `DROP CONSTRAINT`, name it.

-- Q5
-- Consequence: Operation fails, error raised.
--  Example:`INSERT INTO employees (emp_id, emp_name, age) VALUES (1, NULL, 25);`
--   - Error: `ERROR: null value in column "emp_name" violates not-null constraint`.

-- Q6
-- orginal
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);
-- modifed
ALTER TABLE products
ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id),
ALTER COLUMN price SET DEFAULT 50.00;

-- Q7
SELECT s.student_name, c.class_name
FROM Students s
INNER JOIN Classes c ON s.class_id = c.class_id;

-- Q8
SELECT o.order_id, c.customer_name, p.product_name
FROM Products p
LEFT JOIN Orders o ON p.order_id = o.order_id
LEFT JOIN Customers c ON o.customer_id = c.customer_id;

-- Q9 
SELECT p.product_name, SUM(od.quantity * od.unit_price) AS total_sales
FROM products p
INNER JOIN Order_Details od ON p.product_id = od.product_id;

-- Q10
SELECT * from Customers c
INNER JOIN Order_Details od on c.customer_id = od.customer_id
INNER JOIN Orders o ON od.order_id = o.order_id












