/* Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées 
de façon décroissante sur la durée de réalisation */
SELECT recipe_name AS rn, preparation_time AS pt, category_name
FROM recipe
INNER JOIN category ON recipe.id_category = category.id_category
ORDER BY preparation_time DESC

/* En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.
 */
SELECT id_recipe, Count(id_ingredient)
FROM recipe_ingredients
GROUP BY id_recipe

/* Afficher les recettes qui nécessitent au moins 30 min de préparation
 */
SELECT *
FROM recipe
WHERE preparation_time >= 30

/* Afficher les recettes dont le nom contient le mot « Salade » (peu importe où est situé le mot en 
question) */
SELECT *
FROM recipe
WHERE recipe_name LIKE '%salade%'

/* Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec 
les instructions de votre choix. Pensez à alimenter votre base de données en conséquence afin de 
pouvoir lister les détails de cette recettes (ingrédients) */
