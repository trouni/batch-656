-- CREATE
INSERT INTO doctors (name, age, specialty)
VALUES ('Stephen Strange', 42, 'Neurosurgeon')

-- READ
SELECT * FROM doctors WHERE id = 2

-- UPDATE
UPDATE doctors SET specialty = 'Pediatrician', name = 'John Smith' WHERE id = 3

-- DELETE
DELETE FROM doctors WHERE id = 5