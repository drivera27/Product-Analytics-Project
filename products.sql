-- join sales and discounts to products
SELECT
	p.product_id,
	p.category,
	p.cost_price,
	p.sale_price,
	p.description,
	s.*,
	FORMAT(s.date, 'MMMM') AS month, -- format month to join discounts table
	FORMAT(s.date, 'yyyy') AS year, -- format year to join discounts table
	d.discount,
	(p.sale_price * s.units_sold) AS revenue,
	(p.cost_price * s.units_sold) AS total_cost,
	(p.sale_price * s.units_sold) * (1 - discount / 100.0) AS discount_revenue
FROM Products p
JOIN Sales s
	ON p.product_id = s.product
JOIN Discounts d
	ON s.discount_band = d.discount_band AND month = d.month