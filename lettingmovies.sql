CREATE DATABASE Learning;
USE learning;

CREATE Table type_of_numbers(
	money_variable DECIMAL (10,2)
);

CREATE TABLE type_text(
	text_variable TEXT
);

INSERT INTO type_of_numbers(money_variable) VALUES (100.24);
INSERT INTO type_of_numbers(money_variable) VALUES (10011111.24);
INSERT INTO type_of_numbers(float_number) VALUES (1);
INSERT INTO type_of_numbers(float_number) VALUES (1.22);
INSERT INTO type_text(text_variable) VALUES("Once upon a time in a small village nestled between rolling hills and dense forests, 
there lived a young scholar named Elara. She spent her days exploring the mysteries of the natural world, documenting every plant, bird,
 and mineral she encountered. Her curiosity was insatiable, and the villagers often marveled at her knowledge. One day, while wandering 
 deep into the forest, she stumbled upon an ancient tree, its trunk wide enough to house a small family of owls. Carved into its bark were
 symbols that seemed to pulse with a faint, otherworldly glow. Elara traced her fingers over the carvings, feeling a strange energy course 
 through her. From that day forward, her dreams were filled with visions of distant lands, forgotten civilizations, and secrets long buried 
 beneath the soil. Determined to uncover the truth, she set off on a journey that would take her far beyond the village, through bustling cities, 
 across vast deserts, and into the heart of towering mountains. Along the way, she encountered allies and adversaries alike, each shaping her");

SELECT * FROM type_of_numbers;
SELECT * FROM type_text;

ALTER TABLE type_of_numbers ADD COLUMN id_type_of_number INT PRIMARY KEY NOT NULL AUTO_INCREMENT;
ALTER TABLE type_of_numbers ADD COLUMN date_time_3 DATETIME;
ALTER TABLE type_of_numbers ADD COLUMN float_number FLOAT;
ALTER TABLE type_of_numbers ADD COLUMN binary_number BINARY;
INSERT INTO type_of_numbers (date_time_3) VALUES ('2002-03-01 01:22:01');
INSERT INTO type_of_numbers (binary_number) VALUES (4);

