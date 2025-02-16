CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    DOB DATE,
    job_title VARCHAR(100),
    job_industry_category VARCHAR(50),
    wealth_segment VARCHAR(50),
    deceased_indicator CHAR(1) NOT NULL CHECK (deceased_indicator IN ('Y', 'N')),
    owns_car CHAR(3) NOT NULL CHECK (owns_car IN ('Yes', 'No')),
    address VARCHAR(255),
    postcode INT,
    state VARCHAR(50),
    country VARCHAR(50),
    property_valuation INT
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    brand VARCHAR(50),
    product_line VARCHAR(50),
    product_class VARCHAR(50),
    product_size VARCHAR(50),
    list_price DECIMAL(10,2) NOT NULL,
    standard_cost DECIMAL(10,2) NOT NULL
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    transaction_date DATE NOT NULL,
    online_order BOOLEAN,
    order_status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);


INSERT INTO customers (customer_id, first_name, last_name, gender, DOB, job_title, job_industry_category, wealth_segment, deceased_indicator, owns_car, address, postcode, state, country, property_valuation)
VALUES 
(1, 'Laraine', 'Medendorp', 'F', '1953-10-12', 'Executive Secretary', 'Health', 'Mass Customer', 'N', 'Yes', '060 Morning Avenue', 2016, 'New South Wales', 'Australia', 10),
(2, 'Eli', 'Bockman', 'Male', '1980-12-16', 'Administrative Officer', 'Financial Services', 'Mass Customer', 'N', 'Yes', '6 Meadow Vale Court', 2153, 'New South Wales', 'Australia', 10),
(2950, 'Kristos', 'Anthony', 'Male', '1955-01-11', 'Administrative Officer', 'Financial Services', 'Mass Customer', 'N', 'Yes', '6 Meadow Vale Court', 3032, 'New South Wales', 'Australia', 10);


INSERT INTO transactions (transaction_id, product_id, customer_id, transaction_date, online_order, order_status, brand, product_line, product_class, product_size, list_price, standard_cost)
VALUES 
(1, 2, 2950, '2017-02-25', FALSE, 'Approved', 'Solex', 'Standard', 'medium', 'medium', 71.49, 53.62),
(2, 3, 3120, '2017-05-21', TRUE, 'Approved', 'Trek Bicycles', 'Standard', 'medium', 'large', 2091.47, 388.92),
(3, 37, 402, '2017-10-16', FALSE, 'Approved', 'OHM Cycles', 'Standard', 'low', 'medium', 1793.43, 248.82);

INSERT INTO transactions (transaction_id, product_id, customer_id, transaction_date, online_order, order_status)
VALUES 
(1, 2, 2950, '2017-02-25', FALSE, 'Approved');
