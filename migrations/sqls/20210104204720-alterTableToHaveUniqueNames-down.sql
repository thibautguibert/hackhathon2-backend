ALTER TABLE designations
DROP CONSTRAINT unique_designation;

ALTER TABLE classifications
DROP CONSTRAINT unique_classification;

ALTER TABLE families
DROP CONSTRAINT unique_family;

ALTER TABLE planets
DROP CONSTRAINT unique_planet;

ALTER TABLE species
DROP CONSTRAINT unique_species;
