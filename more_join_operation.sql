-- https://sqlzoo.net/wiki/More_JOIN_operations --

--

(1) List the films where the yr is 1962 [Show id, title]

--

SELECT id, title
 FROM movie
 WHERE yr=1962
 
--

(2) Give year of 'Citizen Kane'.

--

SELECT yr FROM movie
WHERE title = 'Citizen Kane'

--
    List all of the Star Trek movies, include the id, title and yr 
(3) Order results by year.
    (all of these movies include the words Star Trek in the title). 
--

SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'

--

(4) What id number does the actor 'Glenn Close' have?

--

SELECT id from actor
WHERE name = 'Glenn Close'

--

(5) What is the id of the film 'Casablanca'

--

SELECT id FROM movie
WHERE title = 'Casablanca'

--

(6) Obtain the cast list for 'Casablanca'.

--

SELECT name FROM movie
JOIN casting ON (movieid = movie.id) 
JOIN actor ON (actorid = actor.id)
WHERE movieid = 11768

--

(7) Obtain the cast list for the film 'Alien'

--

SELECT name from movie
JOIN casting ON (movieid = movie.id)
JOIN actor ON (actorid = actor.id)
WHERE title = 'Alien'

--

(8) Harrison Ford movies

--

SELECT title FROM movie 
JOIN casting ON movie.id = movieid
JOIN actor ON actorid = actor.id
WHERE actor.name = 'Harrison Ford'

--

(9) Harrison Ford as a supporting actor

--

SELECT title FROM movie 
JOIN casting ON movie.id = movieid
JOIN actor ON actorid = actor.id
WHERE NOT casting.ord = 1 AND actor.name = 'Harrison Ford'

--

(10) List the films together with the leading star for all 1962 films.

--

SELECT movie.title, actor.name FROM movie
JOIN casting ON (movieid = movie.id)
JOIN actor ON (actorid = actor.id)
WHERE movie.yr = 1962 AND casting.ord = 1


--
     Which were the busiest years for 'John Travolta', 
(11) show the year and the number of movies he made each year 
     for any year in which he made more than 2 movies.
--


--

(12) List the film title and the leading actor for all of the films 'Julie Andrews' played in.

--


--

(13) Obtain a list, in alphabetical order, of actors whove had at least 30 starring roles

--

SELECT name FROM actor
JOIN casting ON actorid = actor.id
WHERE casting.ord =1
GROUP BY name
HAVING COUNT (name) >=30


--

(14) List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

--


--

(15) List all the people who have worked with 'Art Garfunkel'.

--

