SELECT r.recipe_name, i.ingredient_name
FROM ingredient i
INNER JOIN recipe r ON r.recipe_name = i.ingredient_name
WHERE i.ingredient_name LIKE "%poulet%"