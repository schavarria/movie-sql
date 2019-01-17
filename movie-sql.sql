-- Select all columns and rows from the movies table
SELECT *
FROM movies;

-- Select only the title and id of the first 10 rows
SELECT `id`, `title`
FROM movies
LIMIT 10;

-- Find the movie with the id of 485
SELECT `id`, `title`
FROM movies
WHERE id= 485;

-- Find the id (only that column) of the movie Made in America (1993)
SELECT `id`
FROM movies
WHERE title= 'Made in America (1993)';

-- Find the first 10 sorted alphabetically
SELECT `title`, `id`
FROM movies
WHERE `id` <= 10
ORDER BY title asc;


-- Find all movies from 2002
SELECT `title`
FROM `movies`
WHERE `title` LIKE "%(2002)";

-- Find out what year the Godfather came out
SELECT `title`
FROM `movies`
WHERE `title` LIKE "Godfather%"
LIMIT 1;

-- Without using joins find all the comedies
SELECT `title`
FROM `movies`
WHERE `genres` = 'Comedy';

-- Find all comedies in the year 2000
SELECT `title`
FROM `movies`
WHERE `genres` LIKE '%Comedy%' AND `title` LIKE "%(2000)";

-- Find any movies that are about death and are a comedy
SELECT `title`
FROM `movies`
WHERE `genres` LIKE '%Comedy%' AND `title` LIKE "%Death%";

-- Find any movies from either 2001 or 2002 with a title containing super
SELECT `title`
FROM `movies`
WHERE (`title` LIKE '%(2001)' OR `title` LIKE "%(2002)") AND `title` LIKE "%Super%";


-- Create a new table called actors (We are going to pretend the actor can only play in one movie). The table should include name, character name, foreign key to movies and date of birth at least plus an id field.


-- Pick 3 movies and create insert statements for 10 actors each. You should use the multi value insert statements
INSERT INTO actors (`name`, `character_name`, `movie_id`, `birthday`)
VALUES ('Lily', 'Merie', 1, '07/01/2013'),
('Edward', 'Anthony', 1, '04/27/1987'),
('Angelica', 'Ruby', 1, '09/10/1977'),
('Edgar', 'Amilcar', 2, '02/26/1980'),
('Chicken', 'Chickies', 2, '05/29/2018'),
('Alejandro', 'Vicente', 2, '11/16/2007'),
('Christopher', 'Cristobal', 3, '02/04/2016'),
('Sarah', 'Michelle', 3, '12/26/1999'),
('Elizabeth', 'Francis', 3, '12/16/2004');

-- Create a new column in the movie table to hold the MPAA rating. UPDATE 5 different movies to their correct rating
UPDATE `movies`
SET `MPAA_rating`= 'G'
WHERE id = 1;
UPDATE `movies`
SET `MPAA_rating`= 'PG-13'
WHERE id = 2;
UPDATE `movies`
SET `MPAA_rating`= 'PG'
WHERE id = 3;
UPDATE `movies`
SET `MPAA_rating`= 'PG-13'
WHERE id = 11;
UPDATE `movies`
SET `MPAA_rating`= 'R'
WHERE id = 16;


-- With Joins--

-- Find all the ratings for the movie Godfather, show just the title and the rating
SELECT movies.title, rating
FROM `movies`
LEFT JOIN ratings ON ratings.movie_id = movies.id
WHERE movies.title LIKE "%Godfather, The%";

-- Order the previous objective by newest to oldest
SELECT movies.title, rating, TIMESTAMP
FROM `movies`
LEFT JOIN ratings ON ratings.movie_id = movies.id
WHERE movies.title LIKE "%Godfather, The%"
ORDER BY timestamp asc;

-- Find the comedies from 2005 and get the title and imdbid from the links table
SELECT `title`, `imdb_Id`
FROM `movies`
LEFT JOIN links on links.movie_Id = movies.id
WHERE `genres` LIKE '%Comedy%' AND `title` LIKE "%(2005)";


-- Find all movies that have no ratings
select title, ratings.rating
from movies
left join ratings on movies.id = ratings.movie_id
where rating  isnull;


-- Complete the following aggregation objectives:--

-- Get the average rating for a movie
SELECT AVG (rating)
FROM `ratings`
WHERE movie_id = 1;

-- Get the total ratings for a movie
SELECT SUM(ratings.rating) as rating_sum
FROM `ratings`
WHERE movie_id = 1;

-- Get the total movies for a genre
SELECT SUM(movies.title) as title_sum
FROM `movies`
WHERE `genres` LIKE '%Comedy%';

-- Get the average rating for a user
SELECT AVG(ratings.rating) as rating_sum
FROM `ratings`
WHERE user_id = 1;

-- Find the user with the most ratings


-- Find the user with the highest average rating


-- Find the user with the highest average rating with more than 50 reviews
SELECT ratings.user_id, count(ratings.rating) as count
FROM ratings
GROUP BY ratings.user_id
ORDER BY count DESC
LIMIT 1;

-- Find the movies with an average rating over 4

