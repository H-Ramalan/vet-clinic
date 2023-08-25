/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, true, 8.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '2017-05-12', 5, true, 11.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, false, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '2021-11-15', 2, true, 5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993-04-02', 3, false, 12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005-06-12', 1, true, 45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', 3, true, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '2022-05-14', 4, true, 22);

-- Insert data into the owners table
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

-- Insert data into the species table
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

-- Update animals with species_id for names ending in "mon"
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

-- Update animals with species_id for names not ending in "mon"
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE name NOT LIKE '%mon';

-- Update animal owner information
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');

-- Insert data for vets
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

-- Insert data for visits
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (9,1,'2020-05-24');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (9,3,'2020-07-22');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (10,4,'2021-02-02');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (17,2,'2020-01-05');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (17,2,'2020-03-08');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (17,2,'2020-05-14');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (16,3,'2021-05-04');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (19,4,'2021-02-24');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (18,2,'2019-12-21');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (18,1,'2020-08-10');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (18,2,'2021-04-07');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (23,3,'2019-09-29');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (20,4,'2020-10-03');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (20,4,'2020-11-04');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES (22,2,'2019-01-24');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(22,2,'2019-05-15');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(22,2,'2020-02-27');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(22,2,'2020-08-03');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(26,3,'2020-05-24');
INSERT INTO visits(animals_id,vets_id,date_of_visit) VALUES(26,1,'2021-01-11');;
