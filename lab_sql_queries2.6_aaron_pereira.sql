-- Lab | SQL Queries - Lesson 2.6
-- Solutions by Aaron Pereira


USE sakila;
SET sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

/*
1. In the table actor, which are the actors whose last names are not repeated? 
For example if you would sort the data in the table actor by last_name, you would 
see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three 
actors have the same last name. So we do not want to include this last name in 
our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", 
hence we would want this in our output list.
*/
SELECT last_name, COUNT(*) FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;

-- 2. Which last names appear more than once? 
-- We would use the same logic as in the previous question but this time we want to 
-- include the last names of the actors where the last name was present more than once
SELECT last_name, COUNT(*) FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT COUNT(*) FROM rental;
SELECT staff_id, COUNT(rental_id) AS rentals_processed FROM rental
GROUP BY staff_id; 

-- 4. Using the film table, find out how many films were released each year. 
SELECT release_year, COUNT(title) FROM film
GROUP BY release_year;

-- 5. Using the film table, find out for each rating how many films were there.
SELECT * FROM film;
SELECT rating, COUNT(film_id) FROM film
GROUP BY rating;

-- 6. What is the mean length of the film for each rating type. 
-- Round off the average lengths to two decimal places
SELECT * FROM film;
SELECT rating, AVG(length) FROM film
GROUP BY rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
-- Answer: PG-13
SELECT * FROM film;
SELECT rating, AVG(length) FROM film
GROUP BY rating
HAVING AVG(length) > 120;

-- 8. SORT films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length.
SELECT length, title FROM film
WHERE length OR title IS NOT NULL AND length OR title <> 0
ORDER BY length;
