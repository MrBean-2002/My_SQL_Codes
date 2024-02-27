--O
SELECT 
f.film_id,title,length(name) as length,name as category,
ROUND(AVG(length) OVER(PARTITION BY name),2)
FROM film f
LEFT JOIN film_category fc
ON f.film_id=fc.film_id
LEFT JOIN category c
ON c.category_id=fc.category_id
ORDER BY film_id

SELECT 
*,
COUNT(*) OVER (PARTITION BY customer_id,amount)
FROM payment
ORDER BY customer_id

SELECT * FROM
(
SELECT name,country, 
COUNT(*),
RANK() OVER(PARTITION BY country ORDER BY COUNT(*) DESC) AS
rank
FROM
customer_list
LEFT JOIN payment
ON id=customer_id
GROUP BY 1,2
) a
WHERE rank BETWEEN 1 AND 2


SELECT name,country, 
COUNT(*),
FIRST_VALUE(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*)) AS
rank
FROM
customer_list
LEFT JOIN payment
ON id=customer_id
GROUP BY 1,2


SELECT
SUM(amount) as amount,
DATE(payment_date),
LAG(SUM(amount)) OVER (ORDER BY DATE(payment_date)) as previous_day ,
SUM(amount)-LAG(SUM(amount)) OVER (ORDER BY DATE(payment_date))as difference,
ROUND(SUM(amount)-LAG(SUM(amount)) OVER (ORDER BY DATE(payment_date))/
	  LAG(SUM(amount)) OVER (ORDER BY DATE(payment_date))*100,2) as 
percentage_growth
FROM payment
GROUP BY 2


SELECT
first_name,
last_name,
staff_id,
SUM(amount) as total,
ROUND(100*SUM(amount)/FIRST_VALUE(SUM(amount)) OVER(
	PARTITION BY first_name,last_name ORDER BY SUM(amount) DESC),2)as percentage
FROM customer c
LEFT JOIN payment p
ON c.customer_id=p.customer_id
GROUP BY
 GROUPING SETS(
 (first_name,last_name),
 (staff_id))





















