-- The marketing department of Reputable Product Agency (RPA) is looking to segment the company users by a number of different criteria.

-- 1
-- What are the column names?

 SELECT * FROM users
 LIMIT 20;
-- 2
-- Find the email addresses and birthdays of users whose 
-- birthday is between 1980-01-01 and 1989-12-31.
SELECT email, birthday FROM users
WHERE birthday BETWEEN '1980-01-01' AND '1989-12-31';

-- 3
-- Find the emails and creation date of users 
-- whose created_at date matches this condition. We are interested in the group of users that signed up prior to May 2017. 
SELECT email, created_at 
FROM users
WHERE created_at < '2017-05-01';

-- 4
-- Find the emails of the users who received the ‘bears’ test.
SELECT email, test
FROM users
WHERE test = 'bears';

-- 5
-- Find all the emails of all users who 
-- received a campaign on website BBB.
SELECT email, campaign
FROM users
WHERE campaign LIKE 'BBB%';

-- 6
-- Find all the emails of all users who received ad copy 2 in 
-- their campaign.
SELECT email, campaign
FROM users
WHERE campaign LIKE '%-2';

-- 7
-- Find the emails for all users who received both a campaign and a test. 
-- These users will have non-empty entries in the 
-- campaign and test columns.
SELECT email, campaign, test
FROM users
WHERE campaign IS NOT NULL
AND test IS NOT NULL;

-- 8
-- Challenge
-- One of the members of the marketing team had an idea of calculating
-- how old users were when they signed up.

SELECT (created_at - birthday) as age FROM users
GROUP BY 1
LIMIT 30;


