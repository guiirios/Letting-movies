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
