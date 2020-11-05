SELECT client. civilite || ' ' || client.prenom || ' ' || client.nom AS "Nom du client", livreur.prenom || livreur.nom AS "Livreur", commande.numCommande
FROM ((commande
JOIN client ON commande.clientID = client.clientID)
JOIN livreur ON commande.livreurID = livreur.livreurID)
WHERE commande.dateLivraison > '2020-11-05'
;