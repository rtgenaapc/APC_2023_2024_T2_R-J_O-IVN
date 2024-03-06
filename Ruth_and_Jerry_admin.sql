CREATE DATABASE Ruth_and_Jerry ;
USE Ruth_and_Jerry;
/* Admin Side */

CREATE TABLE Users (
	User_Id INT PRIMARY KEY,
    User_Name VARCHAR(50),
    User_Address VARCHAR(255),
    User_No VARCHAR(50),
    User_type TINYINT(1) /*if admin or customer (CUSTOMER and ADMIN has separate table) */
);
INSERT INTO Users (User_Id, User_Name, User_Address, User_No, User_type) VALUES (01, 'dtugates@example.com', 'Pasay City', '01', 'Customer');
SELECT * FROM Users;

CREATE TABLE Admin (
	Admin_Id INT PRIMARY KEY,
    Admin_email VARCHAR(255),
    Admin_Name VARCHAR(255),
    Admin_No VARCHAR(255)
);
INSERT INTO Admin (Admin_Id, Admin_email, Admin_Name, Admin_No) VALUES (01, 'dtugates@example.com', 'Pasay City', '01', 'Customer');
SELECT * FROM Admin;

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
INSERT INTO Product (Product_Id, Product_Name, Product_Description, Product_Price, Product_Stock_Quality, Product_Category) VALUES (001, 'Carrot', 'Kulay Orange', 30, 'Fresh from the farm', 'Vegetable');
SELECT * FROM Product;

/*CUSTOMER SIDE */
CREATE TABLE Product_Cart (
	Product_Cart_Id INT PRIMARY KEY,
    User_Id INT,
    Customer_Id INT,
    Cart_Id  INT,
    Product_Id INT,
    Product_Cart_Quantity INT,
    FOREIGN KEY (User_Id) REFERENCES Users(User_Id),
    FOREIGN KEY (Cart_Id) REFERENCES Cart(Cart_Id),
    FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id),
    FOREIGN KEY (customer_Id) REFERENCES customers(customer_Id)
);
INSERT INTO Product_Cart (Product_Cart_Id, User_Id, Product_Id, Product_Cart_Quantity) VALUES (011, 01, 001, 10);
SELECT * FROM Product_Cart;

 /* both ADMIN and CUSTOMER */
CREATE TABLE order_details (
	Order_Details_Id INT PRIMARY KEY,
    Order_Details_Quantity INT,
    Order_Details_Price FLOAT,
    Order_Id INT,
    Customer_Id INT,
    Product_Id INT,
    FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id),
    FOREIGN KEY (Order_Id) REFERENCES order_table(Order_Id),
    FOREIGN KEY (Customer_Id) REFERENCES Customers(Customer_Id)
);
INSERT INTO order_details (Order_Details_Id, Order_Details_Quantity, Order_Details_Price, Order_ID, Product_Id) VALUES (02, 12, 40, 022, 03, 10);
SELECT * FROM order_details;

CREATE TABLE order_table (
	Order_Id INT PRIMARY KEY,
    Order_Date DATETIME,
    Oder_total_Amount FLOAT,
    Order_Status VARCHAR(255),
    User_Id INT,
    Order_Receipt VARCHAR(255),
    Sale_Id INT,
    FOREIGN KEY (Order_Id) REFERENCES order_details(Order_Id),
    FOREIGN KEY (User_Id) REFERENCES Users(User_Id),
    FOREIGN KEY (Sale_Id) REFERENCES Sales(Sale_Id)
);
INSERT INTO order_table (Order_Id, Order_Date, Order_total_amount, Order_Status, User_Id, Sale_Id) VALUES (03, '2024-02-15 20:00:00', 100, 'Delivered', 01, 'Printed', 07);
SELECT * FROM order_table;

/* ADMIN */
CREATE TABLE Sales (
	Sale_Id INT PRIMARY KEY,
    Product_Id INT,
    User_Id INT,
	Sale_date DATE,
    Quantiy INT,
    Unit_Price DECIMAL(10,2),
    Total_Amount DECIMAL(10,2),
    FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id),
    FOREIGN KEY (User_Id) REFERENCES Users(User_Id)
);
INSERT INTO Sales (Sale_Id, Product_Id, User_Id, Sale_date, Quantity, Unit_Price, Total_Amount) VALUES (07, 10, 01, '2024-01-21', 09,  08, 400);
SELECT * FROM Sales;

/* ADMIN */
CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity INT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO inventory (product_id, quantity, category) VALUES (1, 10), (2, 100), (3, 50);
SELECT * FROM inventory;

CREATE TABLE cart (
	cart_Id INT PRIMARY KEY,
    FOREIGN KEY (customer_Id) REFERENCES customers(customer_Id)
);
INSERT INTO cart (Cart_Id, customer_id) VALUES (09, 01);
SELECT * FROM cart;

/* both ADMIN and CUSTOMER */
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100)
);
INSERT INTO categories (category_name) VALUES ('Vegetables', 'fruits', 'Plasticware', 'Poultry',  'Plasticware');
SELECT * FROM categories;

/* ADMIN */
CREATE TABLE sales_items (
    sale_item_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    total_price DECIMAL(10, 2),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO sales_items (category_name) VALUES ('Vegetables', 'fruits', 'Plasticware', 'Poultry',  'Plasticware');
INSERT INTO sales_items (sale_item_id, sale_id, product_id, quantity, unit_price, total_price ) VALUES ('', '', '', '', '', '');
SELECT * FROM sales_items;