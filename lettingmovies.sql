/* CREATING A DATABASE BASED ON MOVIES
*/
CREATE DATABASE LettingMovies;
USE LettingMovies;

CREATE TABLE Users(
	id_user INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100),
    email_user VARCHAR(100),
    password_user VARCHAR(255),
	picture_user VARCHAR(255),
    date_of_birth DATE
);

/* adicionando a constraint not null na entidade id_user*/
ALTER TABLE Users MODIFY COLUMN id_user INT NOT NULL;


#criando a tabela diretor e de filmes, como é uma relação N..N vamos criar mais um tabela
CREATE TABLE Director(
	id_director INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    director_name VARCHAR(100)
);

CREATE TABLE Movies(
	id_movie INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    movie_name VARCHAR(120) NOT NULL,
    synopsys VARCHAR(255) NOT NULL, 
    poster_movie VARCHAR(255),
    release_date DATE NOT NULL
    );
    
CREATE TABLE Movies_director (
	id_movie INT,
    id_director INT, 
    FOREIGN KEY (id_movie) REFERENCES Movies(id_movie),
    FOREIGN KEY (id_director) REFERENCES Director(id_director)
);

CREATE TABLE Genre(
	id_genre INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    genre_name varchar(30)

);

CREATE TABLE Genre_Movies (
	id_genre INT,
    id_movie INT,
    FOREIGN KEY (id_genre) REFERENCES Genre(id_genre),
    FOREIGN KEY (id_movie) REFERENCES Movies(id_movie)
);

CREATE TABLE Actors(
	id_actor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_actor VARCHAR(30) NOT NULL,
    nationality VARCHAR(30) NOT NULL, 
    birth_date DATE,
    bio TEXT
);

CREATE TABLE Movie_Actors(
	id_actor INT,
    id_movie INT,
    FOREIGN KEY (id_actor) REFERENCES Actors(id_actor),
    FOREIGN KEY (id_movie) REFERENCES Movies(id_movie)
);

#como vários usuários podem dar nota em varios filmes e varios filmes podem ter varias notas, entao criamos a tabela ranting
CREATE TABLE Rating(
	id_rating INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_user INT,
    id_movie INT,
    rating INT NOT NULL, 
    #creating a calculation for users to rate a movie
    CHECK (rating >=1 AND rating <=5),
    FOREIGN KEY (id_user) REFERENCES Users(id_user),
    FOREIGN KEY (id_movie) REFERENCES Movies(id_movie)

);

#To show all the tables
SHOW TABLES;                                             


/*ver i cinabdi ysadi oara cruar a tabeka*/
SHOW CREATE TABLE Users;	


#ALTER TABLE
ALTER TABLE Movies RENAME COLUMN Synopsis TO synopsis; 
ALTER TABLE Director MODIFY COLUMN  director_name VARCHAR (50) NOT NULL;
ALTER TABLE Movies MODIFY COLUMN release_date DATE NOT NULL;
ALTER TABLE Movies RENAME COLUMN poster_movie to movie_poster;
ALTER TABLE Users ADD COLUMN profile_number int;
ALTER TABLE Users DROP COLUMN profile_number;
ALTER TABLE Movies_director DROP FOREIGN KEY fk_id_movie;
ALTER TABLE Rating MODIFY COLUMN  id_user INT NOT NULL;
ALTER TABLE Rating MODIFY COLUMN  id_movie INT NOT NULL;
ALTER TABLE movies_director MODIFY COLUMN id_movie INT NOT NULL;
ALTER TABLE movies_director MODIFY COLUMN id_director INT NOT NULL;
ALTER TABLE Users ADD CONSTRAINT constraint_user_email UNIQUE (email_user);
#adding a security rule to not repeat the par 
ALTER TABLE movies_director ADD CONSTRAINT unique_movies_director UNIQUE (id_movie, id_director);
#adicionando dfeult current timestamp para ele adicionar automaticamente a data
ALTER TABLE Rating ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;



#INSERT INTO
INSERT INTO genre(genre_name) 
VALUES("Action"),("Comedy"),("Drama"),("Horror"),("Romance"),
("Thriller"),("Science Fiction"),("Documentary"),("Animation");

INSERT INTO Movies(movie_name, release_date, synopsis)VALUES("Batman The Dark Knight",'2008-07-18', 
"menace known as the Joker wreaks havoc and chaos on the people of Gotham City. Batman, Lt. Jim Gordon and District Attorney Harvey Dent must work together to dismantle 
criminal organisations, but the Joker’s reign of terror forces Batman to come back.");

#To facilitate the nex command i used an AI to help me put more movies here:
INSERT INTO Movies(movie_name, synopsis, release_date) VALUES
('Inception', 'A skilled thief who steals secrets through dream-sharing technology is given a chance at redemption if he can successfully perform inception.', '2010-07-16'),
('Dunkirk', 'Allied soldiers are surrounded by the German army and evacuated during a fierce battle in World War II.', '2017-07-21'),
('The Wolf of Wall Street', 'Based on the true story of Jordan Belfort, following his rise and fall in the world of finance.', '2013-12-25'),
('Taxi Driver', 'A mentally unstable veteran becomes a night-time taxi driver in New York City where the perceived decadence fuels his urge for violent action.', '1976-02-08'),
('Spider-Man 2', 'Peter Parker struggles to balance his personal life with his responsibilities as Spider-Man while facing Doctor Octopus.', '2004-06-30'),
('The Amazing Spider-Man', 'After Peter Parker is bitten by a genetically altered spider, he gains new powers and uncovers secrets about his parents.', '2012-07-03'),
('Avatar', 'A paraplegic Marine dispatched to Pandora becomes torn between following orders and protecting the world he feels is his home.', '2009-12-18'),
('Titanic', 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious Titanic.', '1997-12-19'),
('Pulp Fiction', 'The lives of two mob hitmen, a boxer, and others intertwine in a series of unexpected events.', '1994-10-14'),
('Kill Bill: Vol. 1', 'A former assassin wakes from a four-year coma and sets out to take revenge on the team that betrayed her.', '2003-10-10'),
('Jurassic Park', 'A theme park suffers a major power breakdown that allows cloned dinosaurs to run loose.', '1993-06-11'),
('E.T. the Extra-Terrestrial', 'A troubled child summons the courage to help a friendly alien escape Earth and return to his home world.', '1982-06-11');

INSERT INTO Movies_director (id_movie, id_director) VALUES
-- Christopher Nolan
(1, 1),  -- Interstellar
(4, 1),  -- Batman The Dark Knight
(5, 1),  -- Inception
(6, 1),  -- Dunkirk

-- Martin Scorsese
(7, 2),  -- The Wolf of Wall Street
(8, 2),  -- Taxi Driver

-- Sam Raimi
(2, 3),  -- Spider-Man
(9, 3),  -- Spider-Man 2

-- Marc Webb
(10, 4), -- The Amazing Spider-Man
(3, 4),  -- 10 Things I Hate About You

-- James Cameron
(11, 5), -- Avatar
(12, 5), -- Titanic

-- Quentin Tarantino
(13, 6), -- Pulp Fiction
(14, 6), -- Kill Bill: Vol. 1

-- Steven Spielberg
(15, 7), -- Jurassic Park
(16, 7); -- E.T. the Extra-Terrestrial

#here

INSERT INTO Director(director_name) VALUES ("Steven Spielberg");
INSERT INTO movies_director(id_director, id_movie)VALUES(1, 4);



SELECT * FROM Users;
SELECT * FROM director;
SELECT * FROM rating;
SELECT * FROM movies_director;
SELECT * FROM movies;

#To findo code duplications
SELECT id_movie, id_director, COUNT(*) as "repetitions" FROM movies_director GROUP BY id_movie, id_director;

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

