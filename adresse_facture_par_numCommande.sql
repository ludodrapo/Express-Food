SELECT civilite || ' ' || prenom || ' ' || nom AS "Client", raisonSociale, numeroVoie || ' ' || voie || ', ' || codePostal || ' ' || localite AS "Adresse"
FROM CLIENT
JOIN adresse ON client.clientID = adresse.clientID
WHERE numAdresse IN (
	SELECT adresseFacturation FROM facture
	WHERE facture.numCommande = 11
)
;