CREATE FUNCTION customer_name(f_name VARCHAR(20),l_name VARCHAR(20))
RETURNS DECIMAL(6,2)
LANGUAGE plpgsql
AS
$$
DECLARE 
total DECIMAL(6,2);
BEGIN
SELECT
SUM(amount)
INTO total
FROM payment p
NATURAL LEFT JOIN customer c
WHERE first_name=f_name AND last_name=l_name;
RETURN total;
END;
$$

 















