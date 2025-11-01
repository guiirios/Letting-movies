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



#adicionando dfeult current timestamp para ele adicionar automaticamente a data
ALTER TABLE Rating ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


SHOW COLUMNS FROM movies_director;

Use lettingMovies;

#INSERT INTO
INSERT INTO genre(genre_name) 
VALUES("Action"),("Comedy"),("Drama"),("Horror"),("Romance"),
("Thriller"),("Science Fiction"),("Documentary"),("Animation");

INSERT INTO Movies(movie_name, release_date, synopsis)VALUES("Things I Hate About You",'1999-03-31', 
"A new student in high school schemes to date a popular girl by setting her up with a boy, while her older sister resists romance and learns to open her heart.
");



INSERT INTO Director(director_name) VALUES ("Steven Spielberg");
INSERT INTO movies_director(id_director, id_movie)VALUES(3, 2);

SELECT * FROM Users;
SELECT * FROM director;
SELECT * FROM rating;
SELECT * FROM movies_director;
SELECT * FROM movies;

SELECT * FROM director WHERE director_name = "Christopher Nolan";


#ele so vai aparecer o que tem correspondencia com a tabela movies_director
SELECT * from movies m
JOIN movies_director md on md.id_movie = m.id_movie 
JOIN director d on d.id_director = md.id_director
;

SELECT * FROM movies m LEFT JOIN movies_director md ON md.id_movie = m.id_movie
LEFT JOIN director d on d.id_director = md.id_director
;

