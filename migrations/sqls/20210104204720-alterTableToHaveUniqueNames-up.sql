ALTER TABLE designations
ADD CONSTRAINT unique_designation
UNIQUE (name);

ALTER TABLE classifications
ADD CONSTRAINT unique_classification
UNIQUE (name);

ALTER TABLE families
ADD CONSTRAINT unique_family
UNIQUE (name);

ALTER TABLE planets
ADD CONSTRAINT unique_planet
UNIQUE (name);

ALTER TABLE species
ADD CONSTRAINT unique_species
UNIQUE (name);