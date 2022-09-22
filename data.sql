/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
	(1,'Agumon', TO_DATE('03/02/2020', 'MM/DD/YYYY'), 0, true, 10.23),
	(2,'Gabumon', TO_DATE('11/15/2020', 'MM/DD/YYYY'), 2, true, 8),
	(3,'Pikachu', TO_DATE('01/07/2021', 'MM/DD/YYYY'), 1, false, 15.04),
	(4,'Devimon', TO_DATE('05/12/2017', 'MM/DD/YYYY'), 5, true, 11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
	(5, 'Charmander', DATE '2020-02-08', 0, false, -11.0),
 	(6, 'Plantmon', DATE '2021-11-15', 2, true, -5.7),
	(7, 'Squirtle', DATE '1993-04-02', 3, false, -12.13),
	(8, 'Angemon', DATE '2005-06-12', 1, true, -45),
	(9, 'Boarmon', DATE '2005-06-07', 7, true, 20.4),
	(10, 'Blossom', DATE '1998-10-13', 3, true, 17),
	(11, 'Ditto', DATE '2022-05-14', 4, true, 22),

INSERT INTO owners (full_name, age)
VALUES
	('Sam Smith', '34'),
	('Jennifer Orwell', '19'),
	('Bob', '45'),
	('Melody Pond', '77'),
	('Dean Winchester', '14'),
	('Jodie Whittaker', '38');

INSERT INTO species (name)
VALUES
	('Pokemon'),
	('Digimon');

BEGIN;
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

BEGIN;
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon'); 
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom'); 
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon'); 
