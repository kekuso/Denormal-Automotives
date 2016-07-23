/* Normalized Schema */

/* Whiteboard:
 *
 * 1. Create 3 separate tables
 *    - By make_code
 *    - By model_code
 *    - By Year
 */

DROP TABLE IF EXISTS makes CASCADE;
DROP TABLE IF EXISTS models CASCADE;
DROP TABLE IF EXISTS years CASCADE;
DROP TABLE IF EXISTS joined CASCADE;

CREATE TABLE makes (
  id serial NOT NULL PRIMARY KEY,
  make_code VARCHAR(125) NOT NULL,
  make_title VARCHAR(125) NOT NULL
);

CREATE TABLE models (
  id serial NOT NULL PRIMARY KEY,
  model_code VARCHAR (125) NOT NULL,
  model_title VARCHAR (125) NOT NULL,
  make_id integer REFERENCES makes (id)
);

CREATE TABLE years (
  id serial NOT NULL PRIMARY KEY,
  year integer
);

INSERT INTO makes (make_code, make_title)
SELECT DISTINCT make_code, make_title
FROM car_models;

INSERT INTO years (year)
SELECT DISTINCT year
FROM car_models;

INSERT INTO models (model_code, model_title, make_id)
SELECT DISTINCT model_code, model_title, id
FROM car_models
INNER JOIN makes ON makes.make_title = car_models.make_title;

CREATE TABLE joined (
  id serial PRIMARY KEY,
  model_id integer REFERENCES models (id),
  year_id integer REFERENCES years (id)
);

INSERT INTO joined(model_id, year_id)
  SELECT models.id, years.id
  FROM models
  INNER JOIN years ON 1 = 1; -- Every model has 1 of each year

-- SELECT *
--   FROM make
--   INNER JOIN make_code
--   ON
--   car_models.make_code
--   WHERE car_models.make_code = 'ACURA';