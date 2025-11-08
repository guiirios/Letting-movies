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

select count(*) from movies
