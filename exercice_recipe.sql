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
/* Ajout des ingredients et quantité */
INSERT INTO recipe_ingredients (quantity, id_ingredient, id_recipe)
VALUES
(15, 20, 11),
(6, 6, 11),
(3, 5, 11),
(6, 8, 11),
(500, 39, 11),
(50, 31, 11),
(300, 40, 11);

/* Modifier le nom de la recette ayant comme identifiant id_recette = 3 (nom de la recette à votre 
convenance) */
UPDATE recipe r
SET r.recipe_name = 'mayo_oeuf'
WHERE r.id_recipe = 3

/*  Supprimer la recette n°2 de la base de données */

/* Requête 1*/
DELETE FROM recipe_ingredients ri
WHERE ri.id_recipe = 2
/* Requête 2 */
DELETE FROM recipe r
WHERE r.id_recipe = 2

/* Afficher le prix total de la recette n°5 */
SELECT ri.id_recipe, ROUND(SUM(i.price * ri.quantity), 2) AS recipe_price
FROM ingredient i
INNER JOIN recipe_ingredients ri ON i.id_ingredient = ri.id_ingredient
WHERE ri.id_recipe = 5
GROUP BY ri.id_recipe

/* Afficher le détail de la recette n°5 (liste des ingrédients, quantités et prix) */
SELECT ri.id_recipe, i.ingredient_name, ri.quantity, i.price
FROM ingredient i
INNER JOIN recipe_ingredients ri ON i.id_ingredient = ri.id_ingredient
WHERE ri.id_recipe = 5

/*  Ajouter un ingrédient en base de données : Curcumin, unité : cuillère à café, prix : 2.5 €*/
INSERT INTO ingredient
VALUES ("52", "curcumin", "cuillere_cafe", "2.5")

/* Modifier le prix de l’ingrédient n°12 (prix à votre convenance) */
UPDATE ingredient i
SET i.price = 15
WHERE i.id_ingredient = 12

/* Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts */
SELECT COUNT(id_recipe), c.category_name
FROM category c
INNER JOIN recipe r ON r.id_category = c.id_category
GROUP BY c.id_category, c.category_name

/*  Afficher les recettes qui contiennent l’ingrédient « Poulet » */
SELECT r.recipe_name, i.ingredient_name
FROM ingredient i
INNER JOIN recipe_ingredients ri ON ri.id_ingredient = i.id_ingredient
INNER JOIN recipe r ON r.id_recipe = ri.id_recipe
WHERE i.ingredient_name LIKE "%poulet%"
/* Petit schéma à l'écrit pour m'aider à trouver la logique*/

/*  Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes */
UPDATE recipe r
SET r.preparation_time = r.preparation_time - 5
/* J'ai hésité à mettre une condition WHERE mais voulant modifier TOUS les temps de préparation, je me suis dit qu'il y avait pas besoin */

/* Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure */
