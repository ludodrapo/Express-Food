SELECT denomination AS "Nom de la recette" FROM recette
WHERE numRecette IN (
	SELECT article.numRecette from article
	WHERE numArticle IN (
		SELECT numArticle FROM ligneCommande
		WHERE ligneCommande.numCommande IN (
			SELECT numCommande FROM commande
			WHERE commande.clientID in (
				SELECT clientID FROM client
				WHERE client.nom = 'Skywalker'
				AND client.prenom = 'Anakin'
			)
		)
	)
)
;