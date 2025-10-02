/* Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées 
de façon décroissante sur la durée de réalisation */
SELECT r.recipe_name, r.preparation_time, r.instructions, c.category_name
FROM recipe r
INNER JOIN category c ON r.id_category = c.id_category

/* En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.
 */
SELECT r.recipe_name, r.preparation_time, r.instructions, c.category_name, COUNT(ri.id_ingredient) AS nbIngredients
FROM category c
INNER JOIN recipe r ON r.id_category = c.id_category
INNER JOIN recipe_ingredients ri ON r.id_recipe = ri.id_recipe
GROUP BY r.recipe_name, r.preparation_time, r.instructions, c.category_name
ORDER BY r.preparation_time DESC

/* Afficher les recettes qui nécessitent au moins 30 min de préparation
 */
SELECT r.recipe_name, r.preparation_time
FROM recipe r
WHERE preparation_time >= 30

/* Afficher les recettes dont le nom contient le mot « Salade » (peu importe où est situé le mot en 
question) */
SELECT r.recipe_name
FROM recipe r
WHERE recipe_name LIKE '%salade%'

/* Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec 
les instructions de votre choix. Pensez à alimenter votre base de données en conséquence afin de 
pouvoir lister les détails de cette recettes (ingrédients) */
INSERT INTO recipe
VALUES ("11", "pate_carbonara", "20", "Battre les jaunes d'œufs en y ajoutant 1 pincée de sel, 2 pincées de poivre et 40 g de parmigiano reggiano râpé. Remplir une grande casserole d'eau et la faire chauffer avec deux pincées de gros sel. Pendant ce temps, couper la pancetta en lamelles grossières et les faire dorer dans une poêle avec 1 cuillère à soupe d'huile d'olive. Quand l’eau dans la casserole commence à bouillir mettez vos pâtes. Prendre deux cuillères à soupe d'eau de cuisson des pâtes, les verser dans le jaunes d'œufs puis remuer. Réservez la pancetta et laissez la poêle au chaud. Une fois la cuisson des pâtes al dente, les égoutter sommairement et les mettre dans la poêle et remuer. Verser le mélange dans un saladier et incorporez la préparation des jaunes dœufs. Ajouter la pancetta et deux pincées de poivre. Servez.", "2")
