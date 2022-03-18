USE SampleRetail	


WITH 
Tbl1 AS
	(
	SELECT	product_id, discount, SUM(quantity) Sum_Quantity,
			LEAD (SUM(quantity)) OVER(PARTITION BY product_id ORDER BY  discount) AS Lead_
	FROM	sale.order_item
	GROUP BY product_id, discount
	),
Tbl2	AS
	(
	SELECT product_id, Sum_Quantity, Lead_,
		CASE 
			WHEN Lead_ > Sum_Quantity THEN 1
			WHEN Lead_ < Sum_Quantity THEN -1
			WHEN Lead_ = Sum_Quantity THEN 0
			END AS status_effect
	FROM Tbl1
	)
SELECT product_id,
		CASE 
			WHEN SUM(status_effect) > 0 THEN 'Positive'
			WHEN SUM(status_effect) < 0 THEN 'Negative'
			ELSE 'Neutral'
			END AS Discount_Effect
FROM Tbl2
GROUP BY  product_id;