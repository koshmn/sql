SELECT order_date AS action_date,
	(SELECT name FROM person WHERE id = person_order.person_id ) as person_name
FROM person_order
INTERSECT
SELECT visit_date AS action_date,
	(SELECT name FROM person WHERE id = person_visits.person_id ) as person_name
FROM person_visits
ORDER BY 1 ASC,2 DESC

