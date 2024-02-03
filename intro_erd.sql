drop table if exists customers;
drop table if exists orders;

-- Create the 'customers' table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);


-- Create the 'orders' table
CREATE TABLE orders (
   	id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    order_total NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    FOREIGN KEY (customer_id)
        REFERENCES customers(id)
        ON DELETE CASCADE
);

INSERT INTO customers (customer_name, customer_email)
VALUES
    ('John Doe', 'john.doe@example.com'),
    ('Jane Smith', 'jane.smith@example.com');


-- Orders for John Doe (customer_id = 1)
INSERT INTO orders (customer_id, order_date, order_total)
VALUES
    (1, '2024-01-10', 100.00),
    (1, '2024-01-15', 75.50),
    (1, '2024-02-01', 200.00);

-- Orders for Jane Smith (customer_id = 2)
INSERT INTO orders (customer_id, order_date, order_total)
VALUES
    (2, '2024-01-12', 150.00),
    (2, '2024-01-20', 99.99),
    (2, '2024-02-05', 250.00);

DELETE FROM customers WHERE id = 2;

