SELECT order_date,
       (SELECT
       CONCAT(name, ' (age:', age, ')')
       FROM person WHERE id = person_order.person_id) AS person_information
FROM person_order
         JOIN person ON person.id = person_order.person_id
ORDER BY order_date, person_information

