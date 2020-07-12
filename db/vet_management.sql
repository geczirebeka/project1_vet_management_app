DROP TABLE animals;
DROP TABLE vets;

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    dob VARCHAR(255),
    type VARCHAR(255),
    contact_details VARCHAR(255),
    treatment_notes VARCHAR(255),
    vet_id INT REFERENCES vets(id)
);
