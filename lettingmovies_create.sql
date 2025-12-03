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

#PLEASE SEE THE ALTER TABLE PAGE, because through it i put some corrections do my data


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
