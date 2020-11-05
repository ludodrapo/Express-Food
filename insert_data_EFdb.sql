BEGIN TRANSACTION;

--- ================================================================================
--- client
--- ================================================================================
	INSERT INTO public.client (clientID, civilite, nom, prenom, email, mobile, motDePasse, isActive) VALUES (1, 'M.', 'Skywalker', 'Luke', 'luke.skywalker@gmail.com', '+33652026380', MD5('imNotUrSon'), true);
	INSERT INTO public.client (clientID, civilite, nom, prenom, email, mobile, motDePasse, isActive) VALUES (2, 'M.', 'Skywalker', 'Anakin', 'anasky666@hotmail.com', '+33606060606', MD5('imUrFather'), false);
	INSERT INTO public.client (clientID, civilite, nom, prenom, email, mobile, motDePasse, isActive) VALUES (3, 'Melle', 'Amidala', 'Padme', 'a.padme@naboo.gouv.org', '+33600100101', MD5('iWhishIwasDead'), true);
	INSERT INTO public.client (clientID, civilite, nom, prenom, email, mobile, motDePasse, isActive) VALUES (4, 'M.', 'Kenobi', 'Obi-Wan', 'obiken42@yahoo.fr', '+33601020304', MD5('soonIllBeDead'), true);
	INSERT INTO public.client (clientID, civilite, nom, prenom, email, mobile, motDePasse, isActive) VALUES (5, 'M.', 'Fett', 'Bobba', 'bob777@yahoo.fr', '+33699999999', MD5('Jango'), true);
	INSERT INTO public.client (clientID, civilite, nom, prenom, email, mobile, motDePasse, isActive) VALUES (6, 'Mme', 'Organa', 'Leia', 'leia.organa@resistance.int', '+33612345678', MD5('iKissedLuke'), true);
	INSERT INTO public.client (clientID, civilite, nom, prenom, email, mobile, motDePasse, isActive) VALUES (7, 'M.', 'Solo', 'Han', 'hansolo@millenium.com', '+33609456723', MD5('iLuvLeia'), true);
	INSERT INTO public.client (clientID, civilite, nom, prenom, email, mobile, motDePasse, isActive) VALUES (8, 'M.', 'The Hut', 'Jabba', 'jabba.thehut@pizzapai.net', '+33669696969', MD5('iWasAmanOnce'), false);

	SELECT setval('public.client_clientID_seq', 8, true);

--- ================================================================================
--- utilisateur
--- ================================================================================
	INSERT INTO public.utilisateur (utilisateurID, nom, prenom, fonction, login, motDePasse, isActive) VALUES (1, 'Jedi', 'Yoda', 'administrateur', 'y.jedi', MD5('mayThe4rthBewithU'), true);
	INSERT INTO public.utilisateur (utilisateurID, nom, prenom, fonction, login, motDePasse, isActive) VALUES (2, 'Palpatine', 'Senateur', 'cuisinier', 'S.Palpatine', MD5('joinMe2theDarkSide'), true);
	INSERT INTO public.utilisateur (utilisateurID, nom, prenom, fonction, login, motDePasse, isActive) VALUES (3, 'Jinn', 'Qi-Gon', 'comptable', 'q.jinn', MD5('donuttry_doit'), true);

	SELECT setval('public.utilisateur_utilisateurID_seq', 3, true);

--- ================================================================================
--- livreur
--- ================================================================================
	INSERT INTO public.livreur (livreurID, nom, prenom, disponibilite, login, motDePasse, isActive, typeContrat, siret) VALUES (1, 'PO', 'C3', true, 'c3.pO', MD5('iSpeak6millionLanguages'), true, 'salarie', NULL);
	INSERT INTO public.livreur (livreurID, nom, prenom, disponibilite, login, motDePasse, isActive, typeContrat, siret) VALUES (2, 'D2', 'R2', true, 'r2.d2', MD5('bidibidibip'), false, 'intérimaire', NULL);
	INSERT INTO public.livreur (livreurID, nom, prenom, disponibilite, login, motDePasse, isActive, typeContrat, siret) VALUES (3, 'Bacca', 'Chew', false, 'c.bacca', MD5('HooonH'), true, 'auto-entrepreneur', '12345678900099');

	SELECT setval('livreur_livreurID_seq', 3, true);

--- ================================================================================
--- adresse
--- ================================================================================
	INSERT INTO public.adresse (numAdresse, clientID, facturation, raisonSociale, numeroVoie, voie, complementAdresse, codePostal, localite) VALUES (1, 1, false, NULL, NULL, 'chemin de la Force', NULL, '99100', 'Alderaan');
	INSERT INTO public.adresse (numAdresse, clientID, facturation, raisonSociale, numeroVoie, voie, complementAdresse, codePostal, localite) VALUES (2, 2, true, 'Empire SA', '6', 'place de l''Etoile', NULL,  '75008', 'Paris');
	INSERT INTO public.adresse (numAdresse, clientID, facturation, raisonSociale, numeroVoie, voie, complementAdresse, codePostal, localite) VALUES (3, 2, false, NULL, '178', 'rue du Côté Obscur', NULL, '36000', 'Châteauroux');
	INSERT INTO public.adresse (numAdresse, clientID, facturation, raisonSociale, numeroVoie, voie, complementAdresse, codePostal, localite) VALUES (4, 3, true, 'Governement of Naboo', '222', 'avenue des Cyprès', NULL,  '75016', 'Paris');
	INSERT INTO public.adresse (numAdresse, clientID, facturation, raisonSociale, numeroVoie, voie, complementAdresse, codePostal, localite) VALUES (5, 4, false, NULL, NULL, 'chemin de terre', '3ème grotte à droite', '77000', 'Melun');
 	INSERT INTO public.adresse (numAdresse, clientID, facturation, raisonSociale, numeroVoie, voie, complementAdresse, codePostal, localite) VALUES (6, 5, false, NULL, '25bis', 'quai de la désolation', NULL, '29200', 'Brest');
 	INSERT INTO public.adresse (numAdresse, clientID, facturation, raisonSociale, numeroVoie, voie, complementAdresse, codePostal, localite) VALUES (7, 6, true, 'Conseil de la Resistance', '49', 'rue du bunker', NULL, '94000', 'Créteil');
 	INSERT INTO public.adresse (numAdresse, clientID, facturation, raisonSociale, numeroVoie, voie, complementAdresse, codePostal, localite) VALUES (8, 7, false, null, '4', 'boulevard des résistants', NULL, '77000', 'Melun');
 	INSERT INTO public.adresse (numAdresse, clientID, facturation, raisonSociale, numeroVoie, voie, complementAdresse, codePostal, localite) VALUES (9, 8, false, null, '124', 'avenue de la bataille de Yavin', NULL, '99000', 'Mos Eisley');

	SELECT setval('public.adresse_numAdresse_seq', 9, true);

--- ================================================================================
--- recette
--- ================================================================================
	INSERT INTO public.recette (numRecette, categorie, saisonnalite, denomination, vegan, tempsRealisation, ingredients, detailRecette) VALUES (1, 'plat', 'hiver', 'Boeuf Bourguignon', false, '3 h 30 mn',
'Bœuf pour bourguignon : 1,5 kg, Lardons : 200 g, Beurre : 60 g, Petits oignons:  10, Carottes : 2, Ail : 2 gousses, Farine : (4 cuillières à soupe) 60 g, Vin rouge Bourgogne (évidemment) : 50 cl, Bouillon de viande : 2 cubes de bouillon de bœuf pour 50 cl, 
1/2 de litre d''eau, Champignons : 250 g, 1 bouquet garni, sel, poivre.', '1 : Tailler le bœuf en cubes de 3 à 4 cm de côte. Peler les oignons sans les écorcher. Peler et couper les carottes en rondelles pas trop fines (2mm au minimum). Peler l''ail et enlever le germe.
2 : Dans une grande cocotte, faire fondre le beurre. Ajouter les oignons entiers et les lardons. Faire revenir en remuant constamment. Lorsqu''ils sont dorés, les retirer avec un écumoire, et réserver. 
3 : Dans la même cocotte, faire revenir les morceaux de viande à feu vif. Ajouter les carottes, et faire revenir encore 5 mn. 4 : Lorsque la viande est bien dorée, saupoudrer de farine (60g) et laisser roussir en remuant toujours
5 :Verser le bouillon (que vous aurez préparé en faisant fondre les 2 cubes de bouillon de viande dans 50 cl d''eau bouillante). Bien gratter les sucs. Remettre les lardons et les oignons dans la cocotte. Verser le vin rouge. 
Saler, poivrer et ajouter le bouquet garni et les gousses d''ail écrasées. Porter à ébullition. Couvrir et laisser mijoter doucement pendant 3 heures (petits bouillons). 6 : Au bout de ce temps, ajouter les champignons émincés, 
et mettre à cuire encore une demi-heure. Retirer le bouquet garni et verser dans un plat Servir avec des pâtes (tagliatelles par exemple), ou des pommes de terre vapeur (la sauce doit être liée, mais non épaisse. Sinon, rajouter un peu d''eau).');
	
	INSERT INTO public.recette (numRecette, categorie, saisonnalite, denomination, vegan, tempsRealisation, ingredients, detailRecette) VALUES (2, 'plat', 'toutes saisons', 'Curry de boulettes de boeuf et riz pilaf', false, '1 h', '300 g de bœuf haché,
1 oignon, 1 c. à soupe de coriandre, 1/2 œuf battu, 1 petite tranche de pain de mie, Lait, Sel & poivre, 1 c. à soupe d’huile, 1 c. à café de pâte de curry, 1 c. à soupe de curry en poudre, 1 pincée de curcuma, 40 cl de lait de coco, 
Riz pilaf, 1 c. à soupe d’amande', '1. Préchauffer le four à 210 °C. Les boulettes : 2. Mélanger la viande hachée avec la moitié d’un oignon émincé finement, la coriandre préalablement hachée, l''œuf battu et la mie de pain trempée dans le lait. 
Assaisonner de sel et poivre. 3. Lorsque les ingrédients sont répartis de manière uniforme, former des petites boulettes de viande de taille égale. 4. Disposer les boulettes dans un plat allant au four, 
ajouter une noix de beurre et enfourner pour 15 minutes de cuisson environ. Le curry : 5. Entre-temps, détailler des lamelles d''oignon puis les faire revenir dans une poêle avec une cuillère à soupe d''huile. 
6. Lorsque l''oignon est translucide, ajouter la pâte de curry, le curry et le curcuma. Faire cuire quelques minutes puis assaisonner de sel et verser le lait de coco. 
7. Laisser mijoter 5 minutes puis ajouter les boulettes de viande et les enrober de sauce.');
	
	INSERT INTO public.recette (numRecette, categorie, saisonnalite, denomination, vegan, tempsRealisation, ingredients, detailRecette) VALUES (3, 'dessert', 'toutes saisons', 'Cake au citron vegan', true, '30 mn', 'Yaourt de soja nature : 200 g, Farine : 200 g, 
Sucre en poudre : 160 g, Sucre glace : 150 g, Citron : 1, Huile de tournesol : 6 cl, Levure chimique : 1/2 sachet, Jus de citron : 3 cl', 'Préchauffez le four à 160°C. Placez une feuille de papier sulfurisé dans un moule à cake.
Pressez et zestez le citron. Dans un saladier, fouettez les yaourts, le jus pressé et les zestes de citron, l''huile et le sucre en poudre. Ajoutez la farine et la levure chimique. Mélangez énergiquement.
Versez la préparation dans un moule à cake. Enfournez environ 50 minutes en surveillant la cuisson. Laissez tiédir avant de démouler. Préchauffez le four à 100°C. Dans un récipient, mélangez le jus de citron et le sucre glace. 
Versez la préparation sur le cake et lissez à l''aide d''un couteau ou d''une spatule. Enfournez durant 5 minutes pour que le glaçage sèche.');
	
	INSERT INTO public.recette (numRecette, categorie, saisonnalite, denomination, vegan, tempsRealisation, ingredients, detailRecette) VALUES (4, 'dessert', 'hiver', 'Salade de fruits d''hiver', true, '30 mn', 'Ananas : 1/2, 
Grenade : 1, Clémentines : 5, Oranges : 3, Bananes : 2, Kiwi : 1, Sirop d''érable, Vanille : 1 gousse', 'Découpez l''ananas et la grenade en morceaux. Epluchez et détaillez les quartiers des clémentines et des oranges. 
Epluchez les bananes  et le kiwi et coupez-les en tranches. Mélangez le tout dans un saladier. Arrosez la salade de sirop d''érable. Ouvrez la gousse de vanille et grattez l''intérieur à l''aide d''un couteau afin d''obtenir de la poudre de vanille. 
Saupoudrez la salade. Laissez reposer 1 heure au frigo avant de servir.');

	SELECT setval('public.recette_numRecette_seq', 4, true);

--- ================================================================================
--- article
--- ================================================================================
	INSERT INTO public.article (numArticle, numRecette, prixHT, tauxTVA100, utilisateurID) VALUES (1, 1, 17.90, 10, 1);
	INSERT INTO public.article (numArticle, numRecette, prixHT, tauxTVA100, utilisateurID) VALUES (2, 2, 17.90, 10, 1);
	INSERT INTO public.article (numArticle, numRecette, prixHT, tauxTVA100, utilisateurID) VALUES (3, 3, 6.90, 10, 2);
	INSERT INTO public.article (numArticle, numRecette, prixHT, tauxTVA100, utilisateurID) VALUES (4, 4, 6.90, 10, 2);

	SELECT setval('public.article_numArticle_seq', 4, true);

--- ================================================================================
--- commande
--- ================================================================================
	INSERT INTO public.commande (numCommande, clientID, dateCommande, dateLivraison, adresseLivraison, livreurID) VALUES (1, 1, '2020-11-02 18:05:00', '2019-11-02 18:19:00', 1, 1);
	INSERT INTO public.commande (numCommande, clientID, dateCommande, dateLivraison, adresseLivraison, livreurID) VALUES (2, 2, '2020-11-02 18:31:00', '2020-11-02 18:45:00', 3, 2);
	INSERT INTO public.commande (numCommande, clientID, dateCommande, dateLivraison, adresseLivraison, livreurID) VALUES (3, 3, '2020-11-02 18:47:00', '2020-11-02 19:01:00', 4, 3);
	INSERT INTO public.commande (numCommande, clientID, dateCommande, dateLivraison, adresseLivraison, livreurID) VALUES (4, 4, '2020-11-03 11:16:00', '2020-11-03 12:08:00', 5, 3);
	INSERT INTO public.commande (numCommande, clientID, dateCommande, dateLivraison, adresseLivraison, livreurID) VALUES (5, 5, '2020-11-03 12:02:00', '2020-11-03 12:17:00', 6, 2);
	INSERT INTO public.commande (numCommande, clientID, dateCommande, dateLivraison, adresseLivraison, livreurID) VALUES (6, 6, '2020-11-03 18:37:00', '2020-11-03 18:45:00', 7, 1);
	INSERT INTO public.commande (numCommande, clientID, dateCommande, dateLivraison, adresseLivraison, livreurID) VALUES (7, 1, '2020-11-04 12:04:00', '2020-11-04 12:14:00', 1, 1);
	INSERT INTO public.commande (numCommande, clientID, dateCommande, dateLivraison, adresseLivraison, livreurID) VALUES (8, 3, '2020-11-04 19:08:00', '2020-11-04 19:37:00', 4, 2);
	INSERT INTO public.commande (numCommande, clientID, dateCommande, dateLivraison, adresseLivraison, livreurID) VALUES (9, 6, '2020-11-04 19:39:00', '2020-11-04 19:52:00', 7, 2);
	INSERT INTO public.commande (numCommande, clientID, dateCommande, dateLivraison, adresseLivraison, livreurID) VALUES (10, 7, '2020-11-06 11:50:00', '2020-11-06 12:03:00', 8, 3);
	INSERT INTO public.commande (numCommande, clientID, dateCommande, dateLivraison, adresseLivraison, livreurID) VALUES (11, 2, '2020-11-06 14:12:00', '2020-11-06 14:35:00', 2, 3);
	INSERT INTO public.commande (numCommande, clientID, dateCommande, dateLivraison, adresseLivraison, livreurID) VALUES (12, 8, '2020-11-06 17:56:00', '2020-11-06 18:12:00', 9, 1);

	SELECT setval('public.commande_numCommande_seq', 12, true);

--- ================================================================================
--- ligneCommande
--- ================================================================================
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (1, 1, 2);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (1, 4, 2);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (2, 1, 4);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (2, 4, 3);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (3, 1, 5);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (3, 4, 4);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (3, 3, 1);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (4, 1, 1);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (4, 4, 1);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (5, 2, 8);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (5, 3, 5);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (5, 4, 3);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (6, 2, 1);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (7, 1, 4);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (7, 2, 5);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (7, 3, 6);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (7, 4, 3);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (8, 2, 2);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (8, 3, 2);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (9, 2, 1);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (9, 3, 1);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (10, 2, 4);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (10, 3, 4);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (11, 1, 1);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (12, 2, 2);
	INSERT INTO public.ligneCommande (numCommande, numArticle, quantite) VALUES (12, 4, 1);


--- ================================================================================
--- facture
--- ================================================================================

	INSERT INTO public.facture (numFacture, numCommande, adresseFacturation) VALUES (1, 3, 4);
	INSERT INTO public.facture (numFacture, numCommande, adresseFacturation) VALUES (2, 9, 7);
	INSERT INTO public.facture (numFacture, numCommande, adresseFacturation) VALUES (3, 11, 2);

	SELECT setval('public.facture_numFacture_seq', 3, true);


COMMIT;
