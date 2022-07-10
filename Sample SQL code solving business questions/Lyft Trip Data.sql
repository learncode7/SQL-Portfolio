-- Joining tables

--Q1:Let’s examine the three tables.
SELECT * FROM trips;

SELECT * FROM riders;

SELECT * FROM cars;

--Q2: Suppose we want to create a Trip Log with the trips and its users.
SELECT * 
FROM trips
LEFT JOIN riders
 ON trips.rider_id = riders.id;

--Q3:Suppose we want to create a link between the trips and the cars used during those trips.

 SELECT * 
 FROM trips
 JOIN cars
 ON trips.car_id = cars.id;
 
 --Q4:stack the riders table on top of the new table named riders2.

 SELECT * FROM riders
 UNION
 SELECT * FROM riders2;

-- Q5: What is the average cost for a trip?

 SELECT AVG(cost) FROM trips;

--Q6: Find all the riders who have used Lyft less than 500 times!
 SELECT * FROM riders
 WHERE total_trips < 500;

--Q7: Calculate the number of cars that are active.

 SELECT COUNT(*) FROM cars
 WHERE status = 'active';

--Q8:Write a query that finds the two cars that have the highest trips_completed.
 SELECT * FROM cars
 ORDER BY trips_completed DESC
 LIMIT 2;
