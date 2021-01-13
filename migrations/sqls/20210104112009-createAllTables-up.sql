
CREATE TABLE IF NOT EXISTS `designations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `classifications` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `families` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NULL,
  `classification_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_families_1_idx` (`classification_id` ASC) VISIBLE,
  CONSTRAINT `fk_families_1`
    FOREIGN KEY (`classification_id`)
    REFERENCES `classifications` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `planets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `species` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `designation_id` INT NOT NULL,
  `classification_id` INT NOT NULL,
  `family_id` INT NULL,
  `homeworld` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_species_1_idx` (`designation_id` ASC) VISIBLE,
  INDEX `fk_species_2_idx` (`classification_id` ASC) VISIBLE,
  INDEX `fk_species_3_idx` (`family_id` ASC) VISIBLE,
  INDEX `fk_species_4_idx` (`homeworld` ASC) VISIBLE,
  CONSTRAINT `fk_species_1`
    FOREIGN KEY (`designation_id`)
    REFERENCES `designations` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_species_2`
    FOREIGN KEY (`classification_id`)
    REFERENCES `classifications` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_species_3`
    FOREIGN KEY (`family_id`)
    REFERENCES `families` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_species_4`
    FOREIGN KEY (`homeworld`)
    REFERENCES `planets` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `stats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `species_id` INT NULL,
  `strength` INT NOT NULL,
  `resistance` INT NOT NULL,
  `agility` INT NOT NULL,
  `charisma` INT NOT NULL,
  `intelligence` INT NOT NULL,
  `force` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_stats_1_idx` (`species_id` ASC) VISIBLE,
  CONSTRAINT `fk_stats_1`
    FOREIGN KEY (`species_id`)
    REFERENCES `species` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
