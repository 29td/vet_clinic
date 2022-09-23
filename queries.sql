/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE EXTRACT(year FROM date_of_birth) BETWEEN 2016 AND 2019;
SELECT name FROM animals WHERE neutered AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
update animals set species = 'unspecified';
ROLLBACK;
SELECT * FROM animals;
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * FROM animals;
UPDATE animals SET species = 'Pokemon' WHERE species is NULL;
COMMIT;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals; 
ROLLBACK;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT S1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
ROLLBACK TO S1;

UPDATE animals
SET weight_kg = weight_kg * -1 
WHERE weight_kg < 0;

COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT MAX(escape_attempts), neutered FROM animals GROUP BY neutered;

SELECT Min(weight_kg), Max(weight_kg), COUNT(weight_kg), species FROM animals GROUP BY species;

SELECT AVG(escape_attempts), species, date_of_birth FROM animals GROUP BY species, date_of_birth HAVING date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';


SELECT animals.name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT * FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT animals.name, owners.full_name FROM animals RIGHT JOIN owners ON animals.owners_id = owners.id;

SELECT species.name, COUNT(animals.species_id) FROM animals JOIN species ON species.id = animals.species_id GROUP BY species.name;

SELECT animals.name from animals JOIN owners ON owners.id = animals.owners_id JOIN species on species.id = animals.species_id WHERE animals.species_id = '2' AND animals.owners_id = '2';

SELECT animals.name from animals JOIN owners ON owners.id = animals.owners_id WHERE animals.escape_attempts = '0' AND animals.owners_id = '5';

SELECT full_name, COUNT(owners_id) FROM owners JOIN animals on owners.id = animals.owners_id GROUP BY full_name ORDER BY COUNT (owners_id) desc limit 1;

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id WHERE vets_id = '1' ORDER BY visits.date_of_visit desc limit 1;

SELECT COUNT(DISTINCT animals_id) FROM visits WHERE vets_id = '2';

SELECT vets.name, specialization.vets_id, specialization.species_id FROM vets LEFT JOIN specialization ON specialization.vets_id = vets.id;

SELECT animals.name , visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id WHERE visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30' AND vets_id = '3';

SELECT animals.name, COUNT(animals_id) FROM animals JOIN visits ON animals.id = visits.animals_id GROUP BY animals.name ORDER BY COUNT(animals_id) desc limit 1;

SELECT animals.name, date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id WHERE vets_id = '2'ORDER BY visits.date_of_visit ASC LIMIT '1';

SELECT animals.name, vets.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE visits.date_of_visit = (SELECT MIN(date_of_visit) FROM visits);


SELECT *, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE visits.date_of_visit = (SELECT MIN(date_of_visit) FROM visits);

SELECT COUNT(visits.animals_id) FROM visits JOIN vets ON vets.id = visits.vets_id WHERE vets_id = '2';


SELECT species.name, COUNT(animals.species_id) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id JOIN species ON species.id = animals.species_id WHERE vets.name = 'Vet Maisy Smith' GROUP BY species.name ORDER BY COUNT(animals.species_id) desc limit 1;
