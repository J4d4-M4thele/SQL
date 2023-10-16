-- creating the database
CREATE DATABASE zoo;

--table for kinds of animals
CREATE TABLE animal_names (
    id bigserial,
    animal_name varchar(15)
);

INSERT INTO animal_names (animal_name)
VALUES ('giraffe'),
       ('lion'),
       ('vulture'),
       ('elephants'),
       ('crocodile')

--table for animal specifications
CREATE TABLE animal_specs (
    id bigserial,
    animal_name varchar(15),
    animal_type varchar(15),
    diet varchar(30)
);

INSERT INTO animal_specs (id, animal_name, animal_type, diet)
VALUES ('giraffe', 'mammal', 'herbivorous'),
       ('lion', 'mammal', 'carnivorous'),
       ('vulture', 'bird', 'scavenger'),
       ('elephants', 'mammal', 'herbivorous'),
       ('crocodile', 'reptile', 'carnivorous')
