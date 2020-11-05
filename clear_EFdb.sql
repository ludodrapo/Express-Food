BEGIN TRANSACTION;

--- ===== Purge des tables
DELETE FROM public.ligneCommande;
DELETE FROM public.facture;
DELETE FROM public.commande;
DELETE FROM public.article;
DELETE FROM public.recette;
DELETE FROM public.adresse;
DELETE FROM public.livreur;
DELETE FROM public.utilisateur;
DELETE FROM public.client;

--- ===== Réinitialisation des séquences
SELECT setval('public.client_clientID_seq', 1, false);
SELECT setval('public.utilisateur_utilisateurID_seq', 1, false);
SELECT setval('public.livreur_livreurID_seq', 1, false);
SELECT setval('public.adresse_numAdresse_seq', 1, false);
SELECT setval('public.commande_numCommande_seq', 1, false);
SELECT setval('public.recette_numRecette_seq', 1, false);
SELECT setval('public.article_numArticle_seq', 1, false);
SELECT setval('public.facture_numFacture_seq', 1, false);

COMMIT;