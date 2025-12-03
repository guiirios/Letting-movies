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

