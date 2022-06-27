-- In this project, you will be working with a table named hacker_news that contains stories from Hacker News since its launch in 2007.

-- Q1: 
SELECT title, score FROM hacker_news
ORDER BY score DESC
LIMIT 5;

SELECT SUM(score) FROM hacker_news;

SELECT user, SUM(score) FROM hacker_news
GROUP BY user
HAVING SUM(score) > 200
ORDER BY 2 DESC;

SELECT (517 + 309 + 304 + 282) / 6366.0;

SELECT user, COUNT(url) FROM hacker_news
WHERE url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
GROUP BY user;

SELECT CASE
  WHEN url LIKE '%github.com%' THEN 'Github'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
  ELSE 'Other'
END AS 'Source',
COUNT(url)
FROM hacker_news
GROUP BY 1;


SELECT timestamp,
  strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;

SELECT strftime('%H', timestamp) AS 'Hour',
ROUND(AVG(score), 0) AS 'Score',
COUNT(*) AS 'Story' FROM hacker_news 
WHERE timestamp IS NOT NULL
GROUP BY 1;
