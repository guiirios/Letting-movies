# TO show all the movies even when there's no director
SELECT movie_name as Movie, synopsis as Synopsis, director_name AS Director, m.release_date as Year 
FROM MOVIES m LEFT JOIN movies_director md ON md.id_movie = m.id_movie
LEFT join DIRECTOR d ON d.id_director = md.id_director; 	

#Filtering director Christopher Nolan
SELECT movie_name as Movie, synopsis as Synopsis, director_name AS Director 
FROM Movies m LEFT JOIN movies_director md ON md.id_movie = m.id_movie
LEFT join Director d ON d.id_director = md.id_director WHERE director_name  LIKE '%nolan';


select count(*) from movies;

SELECT movie_name, director_name FROM movies m JOIN movies_director md 
on md.id_movie = m.id_movie JOIN director d ON d.id_director = md.id_director WHERE director_name LIKE "%NOL%";

#Finding how many movies each director have directed
SELECT director_name as Director, COUNT(m.id_movie) as "Directed Movies" FROM Director as d
LEFT JOIN movies_director AS md ON md.id_director = d.id_director 
LEFT JOIN Movies as m ON m.id_movie = md.id_movie GROUP BY director_name HAVING count(m.id_movie) > 2;

#Searching for a movie with a name spider-man, like netflix searcher
SELECT director_name, movie_name from DIRECTOR RIGHT JOIN movies_director as md ON md.id_director = director.id_director
RIGHT JOIN movies AS m ON m.id_movie = md.id_movie WHERE movie_name LIKE "%spider-man%"
