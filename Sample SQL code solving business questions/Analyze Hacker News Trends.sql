-- In this project, you will be working with a table named hacker_news that contains stories from Hacker News since its launch in 2007.

-- Q1: Let’s find the most popular Hacker News stories:
SELECT title, score FROM hacker_news
ORDER BY score DESC
LIMIT 5;

-- Q2: First, find the total score of all the stories.
SELECT SUM(score) FROM hacker_news;

-- Q3: Find the individual users who have gotten combined scores of more than 200, and their combined scores.
SELECT user, SUM(score) FROM hacker_news
GROUP BY user
HAVING SUM(score) > 200
ORDER BY 2 DESC;

-- Q4: Add their scores together and divide it by the total sum. 
SELECT (517 + 309 + 304 + 282) / 6366.0;

-- Q5: How many times has each offending user posted this link?
SELECT user, COUNT(url) FROM hacker_news
WHERE url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
GROUP BY user;


-- Q6/Q7: First, we want to categorize each story based on their source. Add a column for the number of stories from each URL using COUNT().
SELECT CASE
  WHEN url LIKE '%github.com%' THEN 'Github'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
  ELSE 'Other'
END AS 'Source',
COUNT(url)
FROM hacker_news
GROUP BY 1;

-- Q8: Look at timestamp column 
SELECT timestamp
FROM hacker_news
LIMIT 10;

-- Q9: Let’s test this function out:
SELECT timestamp,
  strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;

-- Q10:Let’s write a query that returns three columns: The hours of the timestamp; The average score for each hour; The count of stories for each hour
    
SELECT strftime('%H', timestamp) AS 'Hour',
ROUND(AVG(score), 0) AS 'Score',
COUNT(*) AS 'Story' FROM hacker_news 
WHERE timestamp IS NOT NULL
GROUP BY 1;
