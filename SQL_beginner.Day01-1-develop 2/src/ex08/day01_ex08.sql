SELECT order_date,
       (SELECT CONCAT(name, ' (age:', age, ')')) AS person_information
FROM person_order
        NATURAL JOIN (SELECT id AS person_id, name, age
 					FROM person) AS temp
ORDER BY 1,2

