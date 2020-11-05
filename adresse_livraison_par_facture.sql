SELECT civilite || ' ' || prenom || ' ' || nom AS "Client", numeroVoie || ' ' || voie || ', ' || codePostal || ' ' || localite AS "Adresse  de livraison"
FROM CLIENT
JOIN adresse ON client.clientID = adresse.clientID
WHERE numAdresse IN (
	SELECT adresseLivraison FROM commande
	JOIN facture ON facture.numCommande = commande.numCommande
	WHERE facture.numFacture = 3
)
;