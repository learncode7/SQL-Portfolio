-- Users love Welp because it allows them to leave reviews of businesses in their city and see how other people reviewed the businesses. Joining multiple tables.

---Q1: The tables:
SELECT * 
FROM places;
 
SELECT * 
FROM reviews;

--Q2: If each dollar sign ($) represents $10, how could you find all places that cost $20 or less?
SELECT * FROM places
WHERE price_point = '$'
OR price_point = '$$';

--Q3: Write a query to do an INNER JOIN on the two tables to show all reviews for restaurants that have at least one review.

SELECT * FROM places
JOIN reviews
ON places.id = reviews.place_id
WHERE total_reviews >= 1;

--Q4: Modify your previous query to select only the most important columns
SELECT places.name, places.average_rating, reviews.username, reviews.rating, reviews.review_date, reviews.note FROM places
JOIN reviews
ON places.id = reviews.place_id
WHERE total_reviews >= 1;

--Q5: Write a query to find all the ids of places that currently do not have any reviews in our reviews table.

SELECT places.id, places.name FROM places
LEFT JOIN reviews
ON places.id = reviews.place_id
WHERE reviews.place_id IS NULL;

--Q6: Write a query using the WITH clause to select all the reviews that happened in 2020. JOIN the places to your WITH query to see a log of all reviews from 2020.

SELECT * FROM reviews
WHERE strftime('%Y', review_date) = '2020';

WITH old_reviews AS (
  SELECT * FROM reviews
  WHERE strftime('%Y', review_date) = '2020'
)
SELECT *
FROM old_reviews
INNER JOIN places
ON old_reviews.place_id = places.id;

--Q7: Write a query that finds the reviewer with the most reviews that are BELOW the average rating for places.
SELECT reviews.username, reviews.place_id, COUNT(reviews.rating) FROM reviews
JOIN places
ON places.id = reviews.place_id
WHERE reviews.rating < places.average_rating
GROUP BY reviews.username
ORDER BY COUNT(reviews.rating) DESC
LIMIT 1;
