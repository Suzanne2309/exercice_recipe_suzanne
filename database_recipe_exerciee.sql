-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.4.3 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage de la structure de table recipe. category
CREATE TABLE IF NOT EXISTS `category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recipe.category : ~3 rows (environ)
INSERT INTO `category` (`id_category`, `category_name`) VALUES
	(1, 'entree'),
	(2, 'plat'),
	(3, 'dessert');

-- Listage de la structure de table recipe. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(100) NOT NULL DEFAULT '0',
  `unity` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `price` float NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recipe.ingredient : ~51 rows (environ)
INSERT INTO `ingredient` (`id_ingredient`, `ingredient_name`, `unity`, `price`) VALUES
	(1, 'pate_feuilletee', 'paquet', 0.83),
	(2, 'tomate', 'piece', 0.89),
	(3, 'moutarde', 'cuilliere_a_soupe', 0.23),
	(4, 'creme_fraiche', 'cl', 0.92),
	(5, 'sel', 'pincee', 0.24),
	(6, 'poivre', 'pincee', 0.37),
	(7, 'thon', 'boite', 1.99),
	(8, 'oeuf', 'piece', 0.25),
	(9, 'lait', 'ml', 1.13),
	(10, 'poireau', 'piece', 0.29),
	(11, 'carotte', 'piece', 0.15),
	(12, 'courgette', 'piece', 0.34),
	(13, 'oignon', 'piece', 0.22),
	(14, 'bouillon', 'cube', 0.09),
	(15, 'beurre', 'g', 0.72),
	(16, 'navet', 'piece', 0.18),
	(17, 'celeri', 'branche', 0.23),
	(18, 'pomme de terre', 'piece', 0.16),
	(19, 'persil', 'cuillere_a_soupe', 0.08),
	(20, 'huile', 'cl', 0.87),
	(21, 'mayonnaise', 'g', 0.48),
	(22, 'laitue', 'g', 0.46),
	(23, 'olive', 'piece', 0.12),
	(24, 'jus de citron', 'cl', 0.15),
	(25, 'pates_lasagne', 'paquet', 1.83),
	(26, 'farine', 'g', 1.03),
	(27, 'fromage_rape', 'g', 0.96),
	(28, 'puree tomate', 'g', 1.24),
	(29, 'basilic', 'g', 0.97),
	(30, 'eau', 'ml', 0.01),
	(31, 'parmesan', 'g', 1.23),
	(32, 'boeuf_hache', 'g', 4.59),
	(33, 'ail', 'gousses', 0.61),
	(34, 'merguez', 'piece', 2.69),
	(35, 'harissa', 'cuillere_cafe', 0.95),
	(36, 'pois_chiches', 'g', 1.42),
	(37, 'pilon_poulet', 'piece', 3.69),
	(38, 'epices_couscous', 'cuillere_a_soupe', 0.63),
	(39, 'pancetta', 'g', 2.48),
	(40, 'pates', 'g', 0.48),
	(41, 'sucre_blanc', 'g', 0.78),
	(42, 'vanille', 'gousse', 3.56),
	(43, 'chocolat', 'g', 1.48),
	(44, 'levure_chimique', 'g', 1.06),
	(45, 'sucre roux', 'g', 1.21),
	(46, 'biscuits_cuillere', 'piece', 0.31),
	(47, 'cacao_poudre', 'g', 1.27),
	(48, 'mascarpone', 'g', 1.72),
	(49, 'cafe', 'cl', 0.52),
	(50, 'emince_poulet', 'g', 2.81),
	(51, 'pignons_pin', 'g', 1.04);

-- Listage de la structure de table recipe. recipe
CREATE TABLE IF NOT EXISTS `recipe` (
  `id_recipe` int NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(200) NOT NULL,
  `preparation_time` int NOT NULL DEFAULT (0),
  `instructions` text,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id_recipe`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `FK_recipe_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recipe.recipe : ~9 rows (environ)
INSERT INTO `recipe` (`id_recipe`, `recipe_name`, `preparation_time`, `instructions`, `id_category`) VALUES
	(1, 'tarte_thon', 55, 'Etaler la pâte feuilletée sur un moule à quiche, piquer le fond de la pâte, puis recouvrir le fond avec la moutarde. Emietter le thon et le répartir sur le fond de la pâte.  Laver les tomates et les essuyer, puis les couper en rondelles moyennes, et les disposer sur le thon. Battre les oeufs en omelette, ajouter la crème fraîche plus le lait. Ajouter ce mélange sur la pâte, thon, tomate. Mettre au four (pré-chauffé à 200°C/th 6-7), et cuire environ 40 min (jusqu\'à ce que la tarte soit dorée sans être trop brunie!).  ', 1),
	(2, 'soupe_7_legumes', 50, 'Peler, laver et couper les légumes en petits morceaux. Dans une autre marmite, mettre les légumes et les recouvrir d\'eau. Ajouter la moitié du bouillon cube et faire cuire 30 minutes ou 10 minutes à l\'autocuiseur. Recouvrir le poireau d\'eau et y ajouter le reste du bouillon cube. Faire cuire 20 minutes environ. Lorsque les légumes (carottes, navet, tomates... mais pas le poireau !) sont cuits, les mixer et assaisonner à votre goût. Ajouter la crème fraiche et le poireau non mixé.  ', 1),
	(3, 'oeufs_mimosa', 35, 'Faire cuire les oeufs 10 mn dans l\'eau bouillante, puis les mettre dans l\'eau froide pour arrêter la cuisson. Monter une mayonnaise avec 1 jaune d\'oeuf, 1 cuillère à café de moutarde, 1/4 l d\'huile et du jus de citron (facultatif), ou utiliser une mayonnaise prête vendue dans le commerce. Le jus de citron s\'ajoute au dernier moment. Ecaler les oeufs, les couper dans le sens de la longueur, puis séparer les blancs des jaunes. Dans une assiette creuse, émietter les jaunes à la fourchette, mélanger la moitié de ces jaunes émiettés avec la mayonnaise et réserver le reste. Remplir les demi-blancs de cette préparation, puis saupoudrer chaque demi-oeuf du reste de jaunes émiettés (ce qui fait le mimosa !!). Disposer les oeufs sur des feuilles de laitue, mettre sur chaque oeuf un peu de persil et une olive noire. Servir frais. ', 1),
	(4, 'lasagnes_bolognaise', 125, 'Faire revenir gousses hachées d\'ail et les oignons émincés dans un peu d\'huile d\'olive. Ajouter la carotte et la branche de céleri hachée puis la viande et faire revenir le tout. Ajouter la purée de tomates, l\'eau et les herbes. Saler, poivrer, puis laisser mijoter à feu doux 45 minutes. Préparer la béchamel : faire fondre 100 g de beurre. Hors du feu, ajouter la farine d\'un coup. Remettre sur le feu et remuer avec un fouet jusqu\'à l\'obtention d\'un mélange bien lisse. Ajouter le lait peu à peu. Ensuite, parfumer avec la muscade, saler, poivrer. Laisser cuire environ 5 minutes, à feu très doux, en remuant. Réserver. Préchauffer le four à 200°C (thermostat 6-7). Huiler le plat à lasagnes. Poser une fine couche de béchamel puis des feuilles de lasagnes, de la bolognaise, de la béchamel et du parmesan. Répéter l\'opération 3 fois de suite.  Sur la dernière couche de lasagnes, ne mettre que de la béchamel et recouvrir de fromage râpé. Parsemer quelques noisettes de beurre. Enfourner pour environ 25 minutes de cuisson.  ', 2),
	(5, 'couscous', 65, 'Lavez et épluchez les carottes, les navets et les tomates et les couper en cubes. Dans un autocuiseur, versez 3 cuillères à soupe d\'huile d\'olive. Mettez à chauffer et faites-y dorer les pilons de poulet. Quand ils sont dorés, versez l\'équivalent d\'1 litre d\'eau et ajouter les cubes de bouillon de boeuf, le concentré de tomate, les carottes, navets et tomates, les épices à couscous et l\'harissa. Fermez votre autocuiseur et compter 25 mn de cuisson une fois que celui-ci est monté en pression. En attendant, lavez et coupez les courgettes en cubes et égouttez les pois chiches. Une fois les 25 mn écoulées, évacuez la vapeur de votre autocuiseur, ouvrez et rajouter les courgettes et les pois chiches. Remettez au feu : comptez 10 mn de cuisson une fois votre autocuiseur sous pression. Faites cuire vos merguez sur un grill ou à la poêle, mais pas avec les légumes. Servez accompagné d\'une semoule fine.  ', 2),
	(6, 'cookies aison', 25, 'Détailler le chocolat en pépites. Préchauffer le four à 180°C (thermostat 6). Dans un saladier, mettre 75 g de beurre, le sucre, l\'oeuf entier, la vanille et mélanger le tout avec une cuillère en bois.  Ajouter petit à petit la farine mélangée à la levure, le sel et le chocolat. Avec une feuille de papier essuie-tout, beurrer une plaque allant au four et former les cookies sur la plaque. Pour former les cookies, utiliser 2 cuillères à soupe et faire des petits tas espacés les uns des autres; ils grandiront à la cuisson. Enfourner pour 10 minutes de cuisson.  ', 3),
	(7, 'tiramisu', 15, 'Séparer les blancs des jaunes d\'oeufs. Mélanger les jaunes avec le sucre roux et le sucre vanillé. Ajouter le mascarpone au fouet. Monter les blancs en neige et les incorporer délicatement à la spatule au mélange précédent. Réserver. Mouiller les biscuits dans le café rapidement avant d\'en tapisser le fond du plat. Recouvrir d\'une couche de crème au mascarpone puis répéter l\'opération en alternant couche de biscuits et couche de crème en terminant par cette dernière. Saupoudrer de cacao. Mettre au réfrigérateur 4 heures minimum puis déguster frais.  ', 3),
	(8, 'salade_cesar', 20, 'Cuire l\'émincée de poulet dans une poêle. Déchirez les feuilles de romaine dans un saladier, et ajoutez les croûtons préalablement épongés dans du papier absorbant. Préparez la sauce : Faites cuire l\'oeuf 1 min 30 dans l\'eau bouillante, et rafraîchissez-le. Cassez-le dans le bol d\'un mixeur et mixez, avec tous les autres ingrédients; rectifiez l\'assaissonnement et incorporez à la salade. Décorez de copeaux de parmesan, et servez. ', 2),
	(9, 'salade_tagliatelles_courgettes', 17, 'Epluchez les courgettes, et nettoyez-les. Conservez votre couteau économe, et peler les courgettes pour en faire des tagliatelles.  Dans un plat, mettez le jus de citron, l\'huile d\'olive, le basilic préalablement coupé grossièrement aux ciseaux. Ajoutez la gousse d\'ail écrasée, ou finement hachée si vous n\'avez pas de presse-ail. Ajoutez les tagliatelles de courgettes et mélangez. Dans une poêle, faire griller les pignons à peine deux minutes (méfiance, ça va très vite !), sans ajout de matière grasse. Les laisser un peu refroidir, et parsemez-en votre salade de tagliatelles. Mettre au frigo. Servir frais.  ', 1);

-- Listage de la structure de table recipe. recipe_ingredients
CREATE TABLE IF NOT EXISTS `recipe_ingredients` (
  `quantity` float NOT NULL,
  `id_ingredient` int NOT NULL,
  `id_recipe` int NOT NULL,
  KEY `id_recipe` (`id_recipe`),
  KEY `id_ingredient` (`id_ingredient`),
  CONSTRAINT `FK_recipe_ingredients_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_recipe_ingredients_recipe` FOREIGN KEY (`id_recipe`) REFERENCES `recipe` (`id_recipe`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table recipe.recipe_ingredients : ~91 rows (environ)
INSERT INTO `recipe_ingredients` (`quantity`, `id_ingredient`, `id_recipe`) VALUES
	(2, 2, 1),
	(1, 1, 1),
	(3, 3, 1),
	(20, 4, 1),
	(1, 5, 1),
	(2, 6, 1),
	(2, 7, 1),
	(2, 8, 1),
	(150, 9, 1),
	(1, 10, 2),
	(6, 11, 2),
	(2, 2, 2),
	(1, 12, 2),
	(1, 13, 2),
	(1, 14, 2),
	(10, 4, 2),
	(10, 15, 2),
	(1, 16, 2),
	(1, 17, 2),
	(2, 18, 2),
	(1, 3, 3),
	(1, 19, 3),
	(25, 20, 3),
	(5, 8, 3),
	(45, 21, 3),
	(20, 22, 3),
	(8, 23, 3),
	(2, 24, 3),
	(1, 5, 3),
	(2, 6, 3),
	(1, 25, 4),
	(3, 13, 4),
	(125, 15, 4),
	(100, 26, 4),
	(1, 5, 4),
	(2, 6, 4),
	(70, 27, 4),
	(5, 29, 4),
	(800, 28, 4),
	(1, 11, 4),
	(150, 30, 4),
	(125, 31, 4),
	(600, 32, 4),
	(1, 17, 4),
	(2, 33, 4),
	(1000, 9, 4),
	(12, 34, 5),
	(5, 20, 5),
	(1, 35, 5),
	(2, 14, 5),
	(3, 2, 5),
	(5, 11, 5),
	(2, 12, 5),
	(400, 36, 5),
	(8, 37, 5),
	(600, 28, 5),
	(10, 16, 5),
	(85, 15, 6),
	(85, 41, 6),
	(1, 42, 6),
	(100, 43, 6),
	(1, 5, 6),
	(12, 44, 6),
	(1, 8, 6),
	(100, 45, 7),
	(24, 46, 7),
	(30, 47, 7),
	(3, 8, 7),
	(1, 42, 7),
	(250, 48, 7),
	(50, 49, 7),
	(125, 50, 8),
	(20, 20, 8),
	(25, 31, 8),
	(1, 3, 8),
	(1, 35, 8),
	(10, 20, 8),
	(1, 6, 8),
	(1, 5, 8),
	(1, 8, 8),
	(5, 24, 8),
	(1, 33, 8),
	(2, 12, 9),
	(3, 20, 9),
	(1, 5, 9),
	(1, 6, 9),
	(50, 31, 9),
	(10, 24, 9),
	(50, 51, 9),
	(1, 33, 9),
	(10, 29, 9);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
