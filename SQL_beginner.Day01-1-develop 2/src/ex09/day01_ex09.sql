SELECT name
FROM pizzeria
WHERE NOT
	id IN (SELECT pizzeria_id FROM person_visits);

SELECT name
FROM pizzeria
WHERE NOT EXISTS
	(SELECT * FROM person_visits
	 WHERE person_visits.pizzeria_id = pizzeria.id )