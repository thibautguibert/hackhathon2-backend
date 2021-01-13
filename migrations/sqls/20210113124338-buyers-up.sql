/* Replace with your SQL commands */
CREATE TABLE buyers(
   id      INTEGER  NOT NULL PRIMARY KEY 
  ,city_id INTEGER  NOT NULL
  ,name    VARCHAR(100) NOT NULL
  ,type    VARCHAR(100) NOT NULL,
 INDEX `fk_buyers_1` (`city_id` ASC) VISIBLE,
  CONSTRAINT `fk_buyers_1`
    FOREIGN KEY (`city_id`)
    REFERENCES `cities` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);
INSERT INTO buyers(id,city_id,name,type) VALUES (1,21954,'SOUFFLET','Négociant');
INSERT INTO buyers(id,city_id,name,type) VALUES (2,23053,'CARGILL','Négociant');
INSERT INTO buyers(id,city_id,name,type) VALUES (3,1,'SCAEL','Coopérative');
INSERT INTO buyers(id,city_id,name,type) VALUES (4,7479,'BUNGE','Négociant');
INSERT INTO buyers(id,city_id,name,type) VALUES (5,24356,'HUTTEPAIN','Fabricant d’alimentation animale');
INSERT INTO buyers(id,city_id,name,type) VALUES (6,33289,'SANDERS','Fabricant d’alimentation animale');
INSERT INTO buyers(id,city_id,name,type) VALUES (7,22156,'AGRIAL','Coopérative');
INSERT INTO buyers(id,city_id,name,type) VALUES (8,4695,'OCEALIA','Coopérative');
