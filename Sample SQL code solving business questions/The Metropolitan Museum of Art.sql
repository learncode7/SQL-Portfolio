-- In this project, you will be working with a table named met that contains the museum’s collection of American Decorative Arts. 

-- Q1: Start by getting a feel for the met table:
SELECT *
FROM met
LIMIT 10;

-- Q2: How many pieces are in the American Decorative Art collection?
 SELECT COUNT(*) FROM met; 
 
 -- Q3: Count the number of pieces where the category includes ‘celery’.
  SELECT COUNT(*) FROM met
 WHERE category LIKE '%celery%';
 
 -- Q4: Find the title and medium of the oldest piece(s) in the collection.
 SELECT MIN(date) FROM met;
 
 SELECT title, medium
 FROM met
 WHERE date LIKE '%1600%';
 
 -- Q5: Find the top 10 countries with the most pieces in the collection.
 SELECT country, COUNT(*)
 FROM met
 WHERE country IS NOT NULL
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 10;
 
 -- Q6: Find the categories HAVING more than 100 pieces. 
 SELECT category, COUNT(*)
 FROM met
 GROUP BY 1
 HAVING COUNT(*) > 100;
 
 -- Q7:Count the number of pieces where the medium contains ‘gold’ or ‘silver’.
 
 SELECT COUNT(*), 
  CASE 
  WHEN medium LIKE '%gold%' THEN 'Gold'
  WHEN medium LIKE '%silver%' THEN 'Silver'
  ELSE NULL
END AS 'Bling'
FROM met
WHERE Bling IS NOT NULL
 GROUP BY 2
 ORDER BY COUNT(*) DESC;
 
