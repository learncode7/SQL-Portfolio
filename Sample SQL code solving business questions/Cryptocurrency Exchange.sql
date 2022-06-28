-- Help them analyze their January ledger data using SQL aggregate functions! You are given the transactions table, which contains both money-in and money-out transactions.

-- Q1: Checking out the whole transactions table:
SELECT * FROM transactions;

-- Q2: What is the total money_in in the table?
SELECT SUM(money_in) FROM transactions;

-- Q3:What is the total money_out in the table?
SELECT SUM(money_out) FROM transactions;

-- Q4: How many money_in transactions are in this table? How many money_in transactions are in this table where ‘BIT’ is the currency?
SELECT COUNT(money_in) FROM transactions
WHERE money_in IS NOT NULL;

SELECT COUNT(money_in) FROM transactions
WHERE currency = 'BIT';

-- Q5: What was the largest transaction in this whole table?
SELECT MAX(money_in), MAX(money_out) FROM transactions;

-- Q6: What is the average money_in in the table for the currency Ethereum (‘ETH’)?
SELECT AVG(money_in) FROM transactions
WHERE currency = 'ETH'; 

-- Q7: Let’s build a ledger for the different dates.
SELECT date, ROUND(AVG(money_in), 2) AS 'Money in', ROUND(AVG(money_out),2) AS 'Money out'
FROM transactions
GROUP BY date;
