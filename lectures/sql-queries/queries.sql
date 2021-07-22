-- SELECT columns FROM table

SELECT name, country FROM cities
SELECT * FROM cities -- Same as: SELECT id, name, country, population FROM cities


SELECT * FROM inhabitants WHERE age = 23
SELECT * FROM inhabitants WHERE age >= 18

SELECT * FROM doctors WHERE first_name = 'Sae'
SELECT * FROM doctors WHERE first_name = 'Sae' AND age >= 18
SELECT * FROM doctors WHERE first_name = 'Sae' OR first_name = 'Pierre'

SELECT * FROM doctors WHERE first_name LIKE '%S%' -- ILIKE for case insensitive


SELECT first_name, age FROM patients ORDER BY age DESC -- ASC for ascending order (default)


SELECT COUNT(*) FROM doctors
SELECT COUNT(first_name) FROM doctors -- will not count rows where first_name is NULL
-- SELECT * FROM doctors WHERE first_name IS NULL

SELECT COUNT(*) FROM doctors WHERE specialty = 'Neurosurgeon'

SELECT specialty, COUNT(*) FROM doctors GROUP BY specialty

SELECT specialty, COUNT(*) AS c FROM doctors GROUP BY specialty ORDER BY c DESC



SELECT *
FROM inhabitants i
JOIN cities c ON i.city_id = c.id
WHERE c.name = 'Auckland'

