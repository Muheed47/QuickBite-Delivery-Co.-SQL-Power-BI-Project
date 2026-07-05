CREATE DATABASE IF NOT EXISTS quickbite_db;
USE quickbite_db;

DROP DATABASE quickbite_db;

CREATE TABLE customers ( customer_id INT AUTO_INCREMENT PRIMARY KEY, full_name VARCHAR(100) NOT NULL, email VARCHAR(100), city VARCHAR(50), phone VARCHAR(20), registered_on DATE);

CREATE TABLE restaurants ( restaurant_id INT AUTO_INCREMENT PRIMARY KEY, restaurant_name VARCHAR(100) NOT NULL, city VARCHAR(50), cuisine_type VARCHAR(50), avg_rating DECIMAL(3,1), joined_date DATE, is_active BOOLEAN DEFAULT TRUE);

CREATE TABLE riders ( rider_id INT AUTO_INCREMENT PRIMARY KEY, full_name VARCHAR(100) NOT NULL, city VARCHAR(50), phone VARCHAR(20), vehicle_type VARCHAR(20), joined_date DATE, is_active BOOLEAN DEFAULT TRUE);

CREATE TABLE orders ( order_id INT AUTO_INCREMENT PRIMARY KEY, customer_id INT, restaurant_id INT, rider_id INT, order_date DATE, order_time TIME, estimated_minutes INT, actual_minutes INT, order_status ENUM('Delivered', 'Cancelled', 'Pending') NOT NULL, cancellation_reason VARCHAR(200),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id), 
FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
FOREIGN KEY (rider_id) REFERENCES riders(rider_id)
);

CREATE TABLE order_items ( item_id INT AUTO_INCREMENT PRIMARY KEY, order_id INT, item_name VARCHAR(100), quantity INT, unit_price DECIMAL(10,2),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE payments ( payment_id INT AUTO_INCREMENT PRIMARY KEY, order_id INT, payment_method ENUM('Cash', 'Card', 'Online'), amount DECIMAL(10,2), payment_status ENUM('Paid', 'Refunded', 'Pending'), payment_date DATE,
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers (full_name, email, city, phone, registered_on) VALUES
('Ali Raza',       'ali.raza@email.com',    'Karachi',    '0300-1112233', '2024-01-10'),
('Sara Khan',      'sara.khan@email.com',   'Lahore',     '0301-2223344', '2024-02-15'),
('Usman Tariq',    'usman.t@email.com',     'Karachi',    '0302-3334455', '2024-03-20'),
('Fatima Malik',   'fatima.m@email.com',    'Islamabad',  '0303-4445566', '2024-03-25'),
('Hassan Ahmed',   'hassan.a@email.com',    'Lahore',     '0304-5556677', '2024-04-10'),
('Ayesha Siddiqui','ayesha.s@email.com',    'Karachi',    '0305-6667788', '2024-05-05'),
('Bilal Chaudhry', 'bilal.c@email.com',     'Lahore',     '0306-7778899', '2024-06-15'),
('Nadia Qureshi',  'nadia.q@email.com',     'Karachi',    '0307-8889900', '2024-07-10'),
('Imran Shah',     'imran.s@email.com',     'Islamabad',  '0308-9990011', '2024-08-01'),
('Zara Butt',      'zara.b@email.com',      'Lahore',     '0309-0001122', '2024-09-12');

INSERT INTO restaurants
(restaurant_name, city, cuisine_type, avg_rating, joined_date, is_active)
VALUES
('FastBurger',   'Karachi',    'Fast Food', 3.2, '2024-01-10', TRUE),
('Spice Garden', 'Lahore',     'Pakistani', 3.5, '2024-02-15', TRUE),
('Pizza Palace', 'Karachi',    'Italian',   4.5, '2024-02-20', TRUE),
('Chai Dhaba',   'Islamabad',  'Pakistani', 4.3, '2024-03-01', TRUE),
('Dragon Wok',   'Karachi',    'Chinese',   4.1, '2024-03-10', TRUE),
('The Burger Co','Lahore',     'Fast Food', 4.4, '2024-04-20', TRUE),
('Desi Tadka',   'Lahore',     'Pakistani', 3.8, '2024-05-05', TRUE);

INSERT INTO riders
(full_name, city, phone, vehicle_type, joined_date, is_active)
VALUES
('Ahmed Khan',   'Karachi',    '0311-1111111', 'Bike', '2024-01-20', TRUE),
('Zubair Ali',   'Lahore',     '0311-2222222', 'Bike', '2024-02-15', TRUE),
('Farhan Syed',  'Karachi',    '0311-3333333', 'Bike', '2024-03-10', TRUE),
('Kamran Raza',  'Islamabad',  '0311-4444444', 'Bike', '2024-04-05', TRUE),
('Salman Mirza', 'Lahore',     '0311-5555555', 'Bike', '2024-05-20', TRUE),
('Tariq Mehmood','Karachi',    '0311-6666666', 'Bike', '2024-06-15', TRUE);

INSERT INTO orders
(customer_id, restaurant_id, rider_id, order_date, order_time, estimated_minutes, actual_minutes, order_status, cancellation_reason)
VALUES

(1, 1, NULL, '2024-10-01', '12:30:00', 30, NULL, 'Cancelled', 'Restaurant not ready'),
(3, 1, NULL, '2024-10-05', '13:00:00', 30, NULL, 'Cancelled', 'Restaurant not ready'),
(6, 1, 1,    '2024-10-08', '19:15:00', 30, 45,   'Delivered', NULL),
(8, 1, NULL, '2024-10-12', '14:00:00', 30, NULL, 'Cancelled', 'Food quality complaint'),
(1, 1, 3,    '2024-10-15', '18:30:00', 30, 38,   'Delivered', NULL),
(3, 1, NULL, '2024-10-20', '12:00:00', 30, NULL, 'Cancelled', 'Restaurant not ready'),
(6, 1, NULL, '2024-11-02', '20:00:00', 30, NULL, 'Cancelled', 'Restaurant unavailable'),
(8, 1, 1,    '2024-11-05', '19:00:00', 30, 55,   'Delivered', NULL),
(1, 1, NULL, '2024-11-10', '13:30:00', 30, NULL, 'Cancelled', 'Restaurant not ready'),
(9, 1, NULL, '2024-11-18', '14:00:00', 30, NULL, 'Cancelled', 'Food quality complaint'),

(2, 2, 2,    '2024-10-03', '19:00:00', 40, 55,   'Delivered', NULL),
(5, 2, NULL, '2024-10-07', '20:00:00', 40, NULL, 'Cancelled', 'Long wait time'),
(7, 2, 2,    '2024-10-12', '13:00:00', 40, 50,   'Delivered', NULL),
(10,2, NULL, '2024-10-18', '14:00:00', 40, NULL, 'Cancelled', 'Restaurant not ready'),
(2, 2, 5,    '2024-11-01', '19:30:00', 40, 48,   'Delivered', NULL),
(5, 2, NULL, '2024-11-08', '20:00:00', 40, NULL, 'Cancelled', 'Long wait time'),
(7, 2, 2,    '2024-11-15', '13:30:00', 40, 45,   'Delivered', NULL),
(10,2, NULL, '2024-11-22', '14:00:00', 40, NULL, 'Cancelled', 'Restaurant not ready'),

(1, 3, 3,    '2024-10-04', '19:00:00', 30, 28,   'Delivered', NULL),
(3, 3, 3,    '2024-10-09', '20:00:00', 30, 32,   'Delivered', NULL),
(6, 3, 1,    '2024-10-14', '18:30:00', 30, 65,   'Delivered', NULL),
(8, 3, 3,    '2024-10-19', '19:30:00', 30, 30,   'Delivered', NULL),
(9, 3, NULL, '2024-11-03', '14:00:00', 30, NULL, 'Cancelled', 'Customer cancelled'),
(1, 3, 3,    '2024-11-08', '20:00:00', 30, 27,   'Delivered', NULL),
(6, 3, 3,    '2024-11-14', '19:00:00', 30, 31,   'Delivered', NULL),

(4, 4, 4,    '2024-10-06', '15:00:00', 25, 24,   'Delivered', NULL),
(9, 4, 4,    '2024-10-11', '16:00:00', 25, 22,   'Delivered', NULL),
(4, 4, 4,    '2024-10-16', '10:30:00', 25, 28,   'Delivered', NULL),
(9, 4, 4,    '2024-11-05', '15:30:00', 25, 24,   'Delivered', NULL),
(4, 4, 4,    '2024-11-12', '11:00:00', 25, 26,   'Delivered', NULL),

(3, 5, 6,    '2024-10-07', '19:00:00', 35, 35,   'Delivered', NULL),
(6, 5, 1,    '2024-10-13', '20:00:00', 35, 70,   'Delivered', NULL),
(8, 5, NULL, '2024-10-21', '13:00:00', 35, NULL, 'Cancelled', 'Customer cancelled'),
(1, 5, 6,    '2024-11-04', '19:30:00', 35, 38,   'Delivered', NULL),
(3, 5, 6,    '2024-11-11', '20:00:00', 35, 33,   'Delivered', NULL),

(2, 6, 2, '2024-10-10', '19:00:00', 30, 28, 'Delivered', NULL),
(5, 6, 2, '2024-10-20', '20:00:00', 30, 32, 'Delivered', NULL),
(7, 6, 5, '2024-11-08', '19:30:00', 30, 32, 'Delivered', NULL),

(5, 7, 5, '2024-10-09', '20:00:00', 40, 40, 'Delivered', NULL),
(7, 7, NULL, '2024-10-16', '13:00:00', 40, NULL, 'Cancelled', 'Restaurant not ready'),
(10, 7, 2, '2024-11-07', '20:30:00', 40, 38, 'Delivered', NULL),
(2, 7, 5, '2024-11-19', '19:00:00', 40, NULL, 'Pending', NULL);

INSERT INTO order_items (order_id, item_name, quantity, unit_price) VALUES
(1, 'Zinger Burger', 1, 450.00), (1, 'Fries', 1, 150.00),
(2, 'Zinger Burger', 2, 450.00),
(3, 'Zinger Burger', 2, 450.00), (3, 'Fries', 2, 150.00), (3, 'Cold Drink', 1, 100.00),
(4, 'Zinger Burger', 1, 450.00), (4, 'Fries', 1, 150.00),
(5, 'Zinger Burger', 1, 450.00), (5, 'Cold Drink', 1, 100.00),
(6, 'Zinger Burger', 2, 450.00), (6, 'Fries', 1, 150.00),
(7, 'Zinger Burger', 1, 450.00),
(8, 'Zinger Burger', 2, 450.00), (8, 'Fries', 2, 150.00),
(9, 'Zinger Burger', 1, 450.00), (9, 'Cold Drink', 1, 100.00),
(10, 'Zinger Burger', 2, 450.00), (10, 'Fries', 1, 150.00),

(11, 'Biryani', 1, 600.00), (11, 'Raita', 1, 80.00),
(12, 'Biryani', 2, 600.00), (12, 'Naan', 2, 80.00),
(13, 'Biryani', 1, 600.00), (13, 'Seekh Kabab', 2, 300.00),
(14, 'Biryani', 1, 600.00),
(15, 'Karahi', 1, 900.00), (15, 'Naan', 3, 80.00),
(16, 'Biryani', 2, 600.00),
(17, 'Biryani', 1, 600.00), (17, 'Raita', 1, 80.00),
(18, 'Karahi', 1, 900.00), (18, 'Naan', 2, 80.00),

(19, 'Margherita Pizza', 1, 950.00), (19, 'Garlic Bread', 1, 200.00),
(20, 'BBQ Chicken Pizza',1, 1100.00), (20, 'Soft Drink', 2, 150.00),
(21, 'Margherita Pizza', 2, 950.00),
(22, 'BBQ Chicken Pizza',1, 1100.00), (22, 'Garlic Bread', 1, 200.00),
(23, 'Margherita Pizza', 1, 950.00),
(24, 'BBQ Chicken Pizza',1, 1100.00), (24, 'Soft Drink', 1, 150.00),
(25, 'Margherita Pizza', 1, 950.00), (25, 'Garlic Bread', 1, 200.00),

(26, 'Chai', 2, 100.00), (26, 'Samosa', 4, 80.00),
(27, 'Chai', 2, 100.00), (27, 'Pakora', 2, 120.00),
(28, 'Chai', 3, 100.00), (28, 'Samosa', 3, 80.00),
(29, 'Chai', 2, 100.00), (29, 'Pakora', 3, 120.00),
(30, 'Chai', 2, 100.00), (30, 'Samosa', 2, 80.00),

(31, 'Fried Rice', 1, 550.00), (31, 'Spring Rolls', 2, 300.00),
(32, 'Fried Rice', 2, 550.00), (32, 'Chicken Soup', 1, 280.00),
(33, 'Fried Rice', 1, 550.00),
(34, 'Fried Rice', 1, 550.00), (34, 'Spring Rolls', 2, 300.00),
(35, 'Chow Mein', 1, 600.00), (35, 'Spring Rolls', 1, 300.00),

(36, 'Classic Burger', 2, 580.00), (36, 'Fries', 2, 200.00),
(37, 'Classic Burger', 1, 580.00), (37, 'Milkshake', 1, 320.00),
(38, 'Classic Burger', 2, 580.00), (38, 'Fries', 1, 200.00),

(39, 'Karahi', 1, 850.00), (39, 'Naan', 3, 80.00),
(40, 'Karahi', 1, 850.00),
(41, 'Biryani', 2, 600.00), (41, 'Raita', 1, 80.00),
(42, 'Karahi', 1, 850.00), (42, 'Naan', 2, 80.00);

INSERT INTO payments (order_id, payment_method, amount, payment_status, payment_date) VALUES
(3, 'Cash', 1400.00, 'Paid', '2024-10-08'),
(5, 'Online', 550.00, 'Paid', '2024-10-15'),
(8, 'Card', 1200.00, 'Paid', '2024-11-05'),
(11, 'Online', 680.00, 'Paid', '2024-10-03'),
(13, 'Cash', 1200.00, 'Paid', '2024-10-12'),
(15, 'Card', 1140.00, 'Paid', '2024-11-01'),
(17, 'Online', 680.00, 'Paid', '2024-11-15'),
(19, 'Card', 1150.00, 'Paid', '2024-10-04'),
(20, 'Online', 1400.00, 'Paid', '2024-10-10'),
(21, 'Cash', 1900.00, 'Paid', '2024-10-14'),
(22, 'Card', 1300.00, 'Paid', '2024-10-19'),
(24, 'Online', 1250.00, 'Paid', '2024-11-08'),
(25, 'Card', 1150.00, 'Paid', '2024-11-14'),
(26, 'Cash', 520.00, 'Paid', '2024-10-06'),
(27, 'Cash', 440.00, 'Paid', '2024-10-11'),
(28, 'Cash', 540.00, 'Paid', '2024-10-16'),
(29, 'Cash', 560.00, 'Paid', '2024-11-05'),
(30, 'Cash', 360.00, 'Paid', '2024-11-12'),
(31, 'Online', 1150.00, 'Paid', '2024-10-07'),
(32, 'Cash', 1380.00, 'Paid', '2024-10-13'),
(34, 'Card', 1150.00, 'Paid', '2024-11-04'),
(35, 'Online', 900.00, 'Paid', '2024-11-11'),
(36, 'Card', 1560.00, 'Paid', '2024-10-10'),
(37, 'Online', 900.00, 'Paid', '2024-10-20'),
(38, 'Card', 1360.00, 'Paid', '2024-11-08'),
(39, 'Cash', 1090.00, 'Paid', '2024-10-09'),
(41, 'Online', 1280.00, 'Paid', '2024-11-07'),

(4, 'Online', 600.00, 'Refunded', '2024-10-12'),
(12, 'Online', 1280.00, 'Refunded', '2024-10-07'),
(16, 'Online', 1200.00, 'Refunded', '2024-11-08'),
(23, 'Online', 950.00, 'Refunded', '2024-11-03'),

(42, 'Online', 1010.00, 'Pending', '2024-11-19');

SELECT * FROM orders;

SELECT
    o.order_id,
    c.full_name AS customer_name,
    c.city AS customer_city,
    r.restaurant_name,
    rd.full_name AS rider_name,
    o.order_date,
    o.order_status,
    o.cancellation_reason
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
LEFT JOIN riders rd ON o.rider_id = rd.rider_id
ORDER BY o.order_date;


SELECT
    r.restaurant_name,
    r.city,
    COUNT(o.order_id) AS total_orders,
    SUM(CASE WHEN o.order_status = 'Delivered'
             THEN 1 ELSE 0 END) AS delivered_orders,
    SUM(CASE WHEN o.order_status = 'Cancelled'
             THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(SUM(p.amount), 2) AS total_revenue
FROM restaurants r
LEFT JOIN orders o
    ON r.restaurant_id = o.restaurant_id
LEFT JOIN payments p
    ON o.order_id = p.order_id
    AND p.payment_status = 'Paid'
GROUP BY
    r.restaurant_id,
    r.restaurant_name,
    r.city
ORDER BY total_revenue DESC;


SELECT
    r.restaurant_name,
    COUNT(o.order_id) AS total_orders,
    SUM(CASE WHEN o.order_status = 'Cancelled'
             THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(
        SUM(CASE WHEN o.order_status = 'Cancelled' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(o.order_id), 1
    ) AS cancellation_rate_pct
FROM restaurants r
JOIN orders o
    ON r.restaurant_id = o.restaurant_id
GROUP BY
    r.restaurant_id,
    r.restaurant_name
HAVING cancellation_rate_pct > 30
ORDER BY cancellation_rate_pct DESC;


SELECT
    cancellation_reason,
    COUNT(*) AS total_occurrences,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*)
         FROM orders
         WHERE order_status = 'Cancelled'),
        1
    ) AS pct_of_all_cancellations
FROM orders
WHERE order_status = 'Cancelled'
  AND cancellation_reason IS NOT NULL
GROUP BY cancellation_reason
ORDER BY total_occurrences DESC;


SELECT
    rd.full_name AS rider_name,
    rd.city,
    COUNT(o.order_id) AS total_deliveries,
    ROUND(AVG(o.actual_minutes), 1) AS avg_actual_minutes,
    ROUND(AVG(o.estimated_minutes), 1) AS avg_estimated_minutes,
    ROUND(
        AVG(o.actual_minutes)
        - AVG(o.estimated_minutes), 1
    ) AS avg_delay_minutes,
    SUM(CASE WHEN o.actual_minutes > o.estimated_minutes
             THEN 1 ELSE 0 END) AS late_deliveries
FROM riders rd
JOIN orders o
    ON rd.rider_id = o.rider_id
WHERE o.order_status = 'Delivered'
GROUP BY
    rd.rider_id,
    rd.full_name,
    rd.city
ORDER BY avg_delay_minutes DESC;
WITH monthly_revenue AS (
    SELECT
        YEAR(p.payment_date) AS payment_year,

        MONTH(p.payment_date) AS payment_month,

        MONTHNAME(p.payment_date) AS month_name,

        ROUND(SUM(p.amount), 2) AS total_revenue,

        COUNT(DISTINCT o.order_id) AS total_orders

    FROM payments p

    JOIN orders o
        ON p.order_id = o.order_id

    WHERE p.payment_status = 'Paid'

    GROUP BY
        YEAR(p.payment_date),
        MONTH(p.payment_date),
        MONTHNAME(p.payment_date)
)
SELECT
    payment_year,
    month_name,
    total_revenue,
    total_orders,

    ROUND(total_revenue / total_orders, 2)
        AS avg_revenue_per_order
FROM monthly_revenue
ORDER BY payment_year, payment_month;


WITH customer_stats AS (
    SELECT
        o.customer_id,
        COUNT(o.order_id) AS total_orders,
        SUM(
            CASE
                WHEN o.order_status = 'Cancelled' THEN 1
                ELSE 0
            END
        ) AS total_cancelled,
        SUM(
            CASE
                WHEN o.order_status = 'Delivered' THEN 1
                ELSE 0
            END
        ) AS total_delivered
    FROM orders o
    GROUP BY o.customer_id
),

customer_spend AS (
    SELECT
        o.customer_id,
        ROUND(SUM(p.amount), 2) AS total_spent
    FROM payments p
    JOIN orders o
        ON p.order_id = o.order_id
    WHERE p.payment_status = 'Paid'
    GROUP BY o.customer_id
)

SELECT
    c.full_name,
    c.city,
    cs.total_orders,
    cs.total_delivered,
    cs.total_cancelled,
    ROUND(cs.total_cancelled * 100.0 / cs.total_orders, 1) AS cancel_rate_pct,
    COALESCE(sp.total_spent, 0) AS total_spent_pkr
FROM customers c
JOIN customer_stats cs
    ON c.customer_id = cs.customer_id
LEFT JOIN customer_spend sp
    ON c.customer_id = sp.customer_id
ORDER BY total_spent_pkr DESC;


SELECT
    oi.item_name,
    SUM(oi.quantity) AS total_qty_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS appears_in_orders
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY oi.item_name
ORDER BY total_revenue DESC
LIMIT 10;


SELECT
    COUNT(*) AS total_orders,

    SUM(order_status = 'Delivered') AS delivered_orders,
    SUM(order_status = 'Cancelled') AS cancelled_orders,
    SUM(order_status = 'Pending')   AS pending_orders,

    ROUND(
        SUM(order_status = 'Cancelled') * 100.0 / COUNT(*),
        1
    ) AS cancellation_rate_pct

FROM orders;


SELECT COUNT(*) FROM orders;
SELECT DISTINCT order_status FROM orders;
SELECT * FROM orders WHERE order_status = 'Cancelled';