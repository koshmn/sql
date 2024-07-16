WITH ids AS (
    SELECT * FROM menu
    WHERE NOT EXISTS
        (SELECT menu_id FROM person_order WHERE menu_id = menu.id)
)
SELECT
    ids.pizza_name,
    ids.price,
    pizzeria.name AS pizzeria_name
FROM ids
   INNER JOIN pizzeria ON ids.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price;