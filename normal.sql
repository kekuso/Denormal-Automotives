-- 7.
SELECT make_title
  FROM makes;

-- 8.
SELECT model_title
  FROM models
  INNER JOIN makes
  ON makes.id = models.make_id
  WHERE makes.make_code = 'VOLKS';

-- 9.
SELECT makes.make_code, models.model_code, models.model_title, years.year
  FROM joined
  INNER JOIN models
  ON models.id = joined.model_id
  INNER JOIN makes
  ON makes.id = models.make_id
  INNER JOIN years
  ON years.id = joined.year_id
  WHERE makes.make_code = 'LAM';

-- 10.
SELECT makes.make_code, makes.make_title, models.model_code, models.model_title, years.year
  FROM joined
  INNER JOIN models
  ON models.id = joined.model_id
  INNER JOIN makes
  ON makes.id = models.make_id
  INNER JOIN years
  ON years.id = joined.year_id
  WHERE years.year BETWEEN 2010 AND 2015;
