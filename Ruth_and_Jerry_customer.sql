/* Customer Side */

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_contact VARCHAR(100),
    customer_address VARCHAR(255)
);
INSERT INTO customers (customer_id, customer_name, customer_email, customer_contact, customer_address) VALUES (01, 'dtugates@example.com', 'Pasay City', '01', 'Customer');
SELECT * FROM customers;

CREATE TABLE Product (
	Product_Id INT PRIMARY KEY,
    Product_Name VARCHAR(45),
	Product_Description TEXT,
	Product_Price DECIMAL(10,2),
    Product_Stock_Quality INT,
    Product_Category VARCHAR(255),
    category_Id INT,
	FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
INSERT INTO Product (Product_Id, Product_Name, Product_Description, Product_Price, Product_Stock_Quality, Product_Category, category_Id) VALUES ('', '', '', '', '', '', '');
SELECT * FROM Product;

CREATE TABLE cart (
	Cart_Id INT  PRIMARY KEY,
    customer_Id Int,
    FOREIGN KEY (customer_Id) REFERENCES customers(customer_Id)
);

CREATE TABLE Product_Cart (
	Product_Cart_Id INT PRIMARY KEY,
    customer_Id INT,
    Product_Id INT,
    Product_Cart_Quantity INT,
    FOREIGN KEY (customer_Id) REFERENCES customers(customer_Id),
    FOREIGN KEY (Cart_Id) REFERENCES Cart(Cart_Id),
    FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id)
);
INSERT INTO Product_Cart (Product_Cart_Id, customer_Id, Product_Id, Product_Cart_Quantity, customer_Id, Cart_Id) VALUES ('', '', '', '', '', '');
SELECT * FROM Product_Cart;

CREATE TABLE order_details (
	Order_Details_Id INT PRIMARY KEY,
    Order_Details_Quantity INT,
    Order_Details_Price FLOAT,
    Order_Id INT,
    Product_Id INT,
    customer_Id INT,
    FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id),
    FOREIGN KEY (Order_Id) REFERENCES order_table(Order_Id),
    FOREIGN KEY (customer_Id) REFERENCES customers(customer_Id)
);
INSERT INTO order_details (Order_Details_Id, Order_Details_Quantity, Order_Details_Price, Order_Id, Product_Id, customer_Id) VALUES ('', '', '', '', '', '');
SELECT * FROM order_details;

CREATE TABLE customer_orders (
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (cart_Id) REFERENCES cart(cart_Id)
    );
INSERT INTO customer_orders (customer_id, product_id, cart_Id) VALUES ('', '', '');
SELECT * FROM customer_orders;

CREATE TABLE Customer_order_history (
	customer_id INT,
    order_time_and_date DATETIME,
    customer_order_status VARCHAR(255)
);
INSERT INTO Customer_Order_history (customer_id, order_time_and_date, customer_order_status) VALUES ('', '', '');
SELECT * FROM Customer_order_history;