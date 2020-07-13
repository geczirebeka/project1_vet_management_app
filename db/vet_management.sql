DROP TABLE animals;
DROP TABLE vets;
DROP TABLE customers;

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    tel VARCHAR(255)
);

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    dob VARCHAR(255),
    type VARCHAR(255),
    contact_details VARCHAR(255),
    treatment_notes VARCHAR(255),
    vet_id INT REFERENCES vets(id),
    customer_id INT REFERENCES customers(id)
);
