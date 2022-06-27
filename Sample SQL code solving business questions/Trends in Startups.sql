-- We have a table called startups. It is a portfolio of some of the biggest names in the industry. Write queries with aggregate functions to retrieve some interesting insights about these companies.

-- Q1: take a look at the startups table
SELECT * FROM startups;

-- Q2: Calculate the total number of companies in the table.
SELECT COUNT(*) FROM startups;

-- Q3: Total value of all companies in this table.
SELECT SUM(valuation) FROM startups;

-- Q4: Highest amount raised by a startup
SELECT MAX(raised) FROM startups;

-- Q5: Edit the query so that it returns the maximum amount of money raised, during ‘Seed’ stage.
SELECT MAX(raised) FROM startups
WHERE stage = 'Seed';

-- Q6: what year was the oldest company on the list founded?
SELECT MIN(founded) FROM startups;

-- Q7: Return the average valuation
SELECT AVG(valuation)
FROM startups;

--Q8: Return the average valuation, in each category.
SELECT category, AVG(valuation)
FROM startups
GROUP BY category;

-- Q9: Return the average valuation, in each category. Round the averages to two decimal places.

SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY category;

-- Q10: Return the average valuation, in each category. Round the averages to two decimal places. Lastly, order the list from highest averages to lowest.
SELECT category, ROUND(AVG(valuation), 2) FROM startups
GROUP BY category
ORDER BY 2 DESC;

-- Q11: First, return the name of each category with the total number of companies that belong to it.
SELECT category, COUNT(*) FROM startups
GROUP BY 1;

-- Q12: Next, filter the result to only include categories that have more than three companies in them.
SELECT category, COUNT(*) FROM startups
GROUP BY 1
HAVING COUNT(*) > 3;

-- Q13: What is the average size of a startup in each location?
SELECT location, AVG(employees)
FROM startups
GROUP BY location;

-- Q14: What is the average size of a startup in each location, with average sizes above 500?
SELECT location, AVG(employees)
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;


