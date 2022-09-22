/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INTEGER PRIMARY KEY NOT NULL,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD species VARCHAR(100);

CREATE TABLE owners(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  full_name varchar(255) NOT NULL,
  age int NOT NULL
);

CREATE TABLE species(
  id bigsERIAL PRIMARY KEY NOT NULL,
  name varchar(255) NOT NULL
);

ALTER TABLE animals
MODIFY id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals ADD species_id BIGINt REFERENCES species(id);

ALTER TABLE animals
ADD  CONSTRAINT species_id 
FOREIGN KEY (species_id)
REFERENCES species (parent_key_columns);

ALTER TABLE animals ADD owners_id BIGINT REFERENCES owners(id);

ALTER TABLE animals
ADD CONSTRAINT owner_id
FOREIGN KEY (owner_id)
REFERENCES owners (parent_key_columns);

CREATE TABLE vets (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    age INT,
    date_of_graduation DATE NOT NULL
);

CREATE TABLE specialization (
    vets_id BIGINT REFERENCES vets (id),
    species_id BIGINT REFERENCES species (id)
);

CREATE TABLE visits (
    vets_id BIGINT REFERENCES vets (id),
    animals_id BIGINT REFERENCES animals (id),
    date_of_visit DATE NOT NULL
);
