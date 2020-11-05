SELECT client.civilite || ' ' || client.prenom || ' ' || client.nom AS "Nom du client actif", COUNT(numCommande) AS "Nombre de commandes"
FROM client
JOIN commande ON commande.clientID = client.clientID
WHERE client.isActive = true
GROUP BY client.clientID
HAVING COUNT(numCommande) > 1
ORDER BY client.nom
;