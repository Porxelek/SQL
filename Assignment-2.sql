---- Assigment 2

CREATE VIEW sallary_table
AS

SELECT  DISTINCT sale.customer.customer_id,
		sale.customer.first_name,
		sale.customer.last_name
FROM sale.customer
INNER JOIN sale.orders ON sale.orders.customer_id = sale.customer.customer_id
INNER JOIN sale.order_item ON sale.order_item.order_id =sale.orders.order_id
INNER JOIN product.product ON product.product.product_id = sale.order_item.product_id
WHERE product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD'

SELECT * 
FROM sallary_table

-------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW polk_table
AS

SELECT sale.customer.customer_id,
		sale.customer.first_name,
		sale.customer.last_name,
		product.product.product_name
		FROM sale.customer
INNER JOIN sale.orders ON sale.orders.customer_id = sale.customer.customer_id
INNER JOIN sale.order_item ON sale.order_item.order_id =sale.orders.order_id
INNER JOIN product.product ON product.product.product_id = sale.order_item.product_id
WHERE product_name = 'Polk Audio - 50 W Woofer - Black'


SELECT * 
FROM polk_table

-------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW SB2000_table
AS

SELECT sale.customer.customer_id,
		sale.customer.first_name,
		sale.customer.last_name,
		product.product.product_name
		FROM sale.customer
INNER JOIN sale.orders ON sale.orders.customer_id = sale.customer.customer_id
INNER JOIN sale.order_item ON sale.order_item.order_id =sale.orders.order_id
INNER JOIN product.product ON product.product.product_id = sale.order_item.product_id
WHERE product_name = 'SB-2000 12 500W Subwoofer (Piano Gloss Black)'

SELECT * 
FROM SB2000_table

---------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW virtually_table
AS

SELECT sale.customer.customer_id,
		sale.customer.first_name,
		sale.customer.last_name,
		product.product.product_name
		FROM sale.customer
INNER JOIN sale.orders ON sale.orders.customer_id = sale.customer.customer_id
INNER JOIN sale.order_item ON sale.order_item.order_id =sale.orders.order_id
INNER JOIN product.product ON product.product.product_id = sale.order_item.product_id
WHERE product_name = 'Virtually Invisible 891 In-Wall Speakers (Pair)'

SELECT * 
FROM virtually_table

-------------------------------------------------------------------------------------------------------------------------------------


CREATE VIEW finnaly_table
AS

SELECT
    A.customer_id,
    A.first_name,
    A.last_name,
	REPLACE (ISNULL(B.product_name, 'No'), 'Polk Audio - 50 W Woofer - Black', 'Yes') AS First_product,
	REPLACE (ISNULL(C.product_name, 'No'), 'SB-2000 12 500W Subwoofer (Piano Gloss Black)', 'Yes') AS Second_product,
	REPLACE (ISNULL(D.product_name, 'No'), 'Virtually Invisible 891 In-Wall Speakers (Pair)', 'Yes') AS Third_product
FROM sallary_table A
LEFT JOIN polk_table B ON A.customer_id = B.customer_id
LEFT JOIN SB2000_table C ON C.customer_id = A.customer_id
LEFT JOIN virtually_table D ON D.customer_id = A.customer_id;

SELECT *
FROM finnaly_table