/* Denormal Cars */

-- 5.
SELECT DISTINCT make_title FROM car_models;

-- 6.
SELECT DISTINCT model_title FROM car_models WHERE make_code = 'VOLKS';

--7.
SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code = 'LAM';

-- 8.
SELECT * FROM car_models WHERE year >= 2010 AND year <= 2015;
