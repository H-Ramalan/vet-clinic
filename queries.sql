/*Queries that provide answers to the questions from all projects.*/


-- Find all animals whose name ends in "mon"
SELECT * FROM animals WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- List the name of all animals that are neutered and have less than 3 escape attempts
SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu"
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- Find all animals that are neutered
SELECT * FROM animals WHERE neutered = 'true';

-- Find all animals not named Gabumon
SELECT * FROM animals WHERE name <> 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with weights equal to 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Begin a transaction
BEGIN;

-- Update the animals table to set the species column to 'unspecified'
UPDATE animals
SET species = 'unspecified';

-- Verify the change
SELECT * FROM animals;

-- Roll back the transaction
ROLLBACK;

-- Verify that the species column is back to its original state
SELECT * FROM animals;

--Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

-- Commit the transaction
COMMIT;

-- Begin a transaction
BEGIN;

-- Delete all records from the animals table
DELETE FROM animals;

-- Verify that the records have been deleted
SELECT * FROM animals;

-- Roll back the transaction
ROLLBACK;

-- Verify that the records are back after rolling back
SELECT * FROM animals;

-- Begin a transaction
BEGIN;

-- Delete all animals born after Jan 1st, 2022
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- Create a savepoint
SAVEPOINT deletion_savepoint;

-- Update all animals' weight to be their weight multiplied by -1
UPDATE animals SET weight_kg = weight_kg * -1;

-- Rollback to the savepoint
ROLLBACK TO deletion_savepoint;

-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

-- Commit transaction
COMMIT;

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*)  FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) AS average_weight FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered


-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- What animals belong to Melody Pond?
SELECT animals.name AS animal_name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- Animals that are of type pokemon
SELECT animals.name AS animal_name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

--List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name AS owner_name, animals.name AS animal_name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
ORDER BY owners.id;

--List all owners and their animals, remember to include those that don't own any animal.
SELECT species.name AS species_name, COUNT(animals.id) AS animal_count
FROM species
LEFT JOIN animals ON species.id = animals.species_id
GROUP BY species.id, species.name;

--List all Digimon owned by Jennifer Orwell.
SELECT animals.name AS digimon_name
FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name AS animal_name
FROM animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

--Who owns the most animals?
SELECT owners.full_name AS owner_name, COUNT(animals.id) AS animal_count
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.id, owners.full_name
ORDER BY animal_count DESC
LIMIT 1;

-- Queries

SELECT animals.name FROM visits JOIN vets ON visits.vets_id = vets.id  JOIN animals ON visits.animals_id = animals.id WHERE vets.name = 'Vet William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;

SELECT COUNT(date_of_visit) FROM visits JOIN vets ON vets_id = vets.id WHERE vets.name = 'Vet Stephanie Mendez'; 

SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = vets_id LEFT JOIN species ON species.id = species_id;

SELECT animals.name,visits.date_of_visit FROM visits  JOIN vets ON visits.vets_id = vets.id  JOIN animals ON visits.animals_id = animals.id WHERE vets.name = 'Vet Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name FROM visits JOIN animals ON animals_id = animals.id GROUP BY animals.name ORDER BY COUNT(animals.id) DESC LIMIT 1;

SELECT animals.name,visits.date_of_visit FROM visits JOIN animals ON animals_id = animals.id JOIN vets ON vets_id = vets.id WHERE vets.name = 'Vet Maisy Smith' ORDER BY date_of_visit LIMIT 1;

SELECT animals.name,vets.name,date_of_visit FROM visits JOIN animals ON animals_id = animals.id JOIN vets ON vets_id = vets.id ORDER BY date_of_visit DESC LIMIT 1;

SELECT COUNT(*) FROM visits JOIN animals ON animals_id = animals.id JOIN vets ON vets_id = vets.id JOIN specializations ON vets.id = specializations.vets_id WHERE animals.species_id != specializations.species_id;

SELECT species.name FROM visits JOIN animals ON animals_id = animals.id JOIN species ON animals.species_id = species.id JOIN vets ON vets_id = vets.id WHERE vets.name = 'Vet Maisy Smith' GROUP BY species.name ORDER BY COUNT(species.id) DESC LIMIT 1;



    EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
    EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
    EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
