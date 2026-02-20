CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    signup_date DATE,
    acquisition_channel VARCHAR(50)
);

CREATE TABLE website_events (
    event_id INT PRIMARY KEY,
    customer_id INT,
    event_type VARCHAR(50),
    event_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_value DECIMAL(10,2),
    discount_applied DECIMAL(5,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
