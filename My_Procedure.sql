CREATE PROCEDURE emp_swap(emp1 INT,emp2 INT)
LANGUAGE plpgsql
AS
$$
DECLARE
salary1 DECIMAL(8,2);
salary2 DECIMAL(8,2);
position1 TEXT;
POSITION2 TEXT;
BEGIN

--store values in variables

SELECT salary
INTO salary1
FROM employees
WHERE emp_id=1;

SELECT salary
INTO salary2
FROM employees
WHERE emp_id=2;

SELECT position_title
INTO position1
FROM employees
WHERE emp_id=1;

SELECT position_title
INTO position2
FROM employees
WHERE emp_id=2;

--update salary
UPDATE employees
SET salary = salary2
WHERE emp_id=1;

UPDATE employees
SET salary = salary1
WHERE emp_id=2;

--update titles
UPDATE employees
SET position_title = position2
WHERE emp_id=1;

UPDATE employees
SET position_title = position1
WHERE emp_id=2;

COMMIT;
END;
$$

CALL emp_swap(1,2)

SELECT * FROM employees
ORDER BY 1;

CREATE OR REPLACE PROCEDURE sp_transfer
(tr_amount INT,sender INT, recipient INT)
LANGUAGE plpgsql
AS
$$
BEGIN
--add balance
UPDATE acc_balance
SET amount=amount+tr_amount
WHERE id=recipient;

--subtract balance
UPDATE acc_balance
SET amount=amount-tr_amount
WHERE id=sender;
COMMIT;
END;
$$

CALL sp_tranfer(500,1,2)

SELECT * FROM acc_balance







END;
$$