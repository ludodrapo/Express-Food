
CREATE SEQUENCE public.livreur_livreurid_seq;

CREATE TABLE public.livreur (
                livreurID INTEGER NOT NULL DEFAULT nextval('public.livreur_livreurid_seq'),
                nom VARCHAR(50) NOT NULL,
                prenom VARCHAR(50) NOT NULL,
                typeContrat VARCHAR(32) NOT NULL,
                siret VARCHAR(14),
                disponibilite BOOLEAN NOT NULL,
                login VARCHAR(32) NOT NULL,
                motDePasse VARCHAR(32) NOT NULL,
                isActive BOOLEAN DEFAULT true NOT NULL,
                CONSTRAINT livreur_pk PRIMARY KEY (livreurID)
);


ALTER SEQUENCE public.livreur_livreurid_seq OWNED BY public.livreur.livreurID;

CREATE SEQUENCE public.client_clientid_seq;

CREATE TABLE public.client (
                clientID INTEGER NOT NULL DEFAULT nextval('public.client_clientid_seq'),
                civilite VARCHAR(5),
                nom VARCHAR(50) NOT NULL,
                prenom VARCHAR(50) NOT NULL,
                email VARCHAR(100) NOT NULL,
                mobile VARCHAR(12) NOT NULL,
                motDePasse VARCHAR(32) NOT NULL,
                isActive BOOLEAN DEFAULT true NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (clientID)
);
COMMENT ON COLUMN public.client.mobile IS 'format +33123456789';


ALTER SEQUENCE public.client_clientid_seq OWNED BY public.client.clientID;

CREATE SEQUENCE public.adresse_numadresse_seq;

CREATE TABLE public.adresse (
                numAdresse INTEGER NOT NULL DEFAULT nextval('public.adresse_numadresse_seq'),
                clientID INTEGER NOT NULL,
                facturation BOOLEAN NOT NULL,
                raisonSociale VARCHAR(100),
                numeroVoie VARCHAR(10),
                voie VARCHAR(100),
                complementAdresse VARCHAR(100),
                codePostal VARCHAR(5) NOT NULL,
                localite VARCHAR(200) NOT NULL,
                CONSTRAINT adresse_pk PRIMARY KEY (numAdresse)
);


ALTER SEQUENCE public.adresse_numadresse_seq OWNED BY public.adresse.numAdresse;

CREATE INDEX localitefacturation_idx
 ON public.adresse
 ( codePostal ASC, localite ASC );

CLUSTER localitefacturation_idx ON adresse;

CREATE SEQUENCE public.recette_numrecette_seq;

CREATE TABLE public.recette (
                numRecette INTEGER NOT NULL DEFAULT nextval('public.recette_numrecette_seq'),
                categorie VARCHAR(10) NOT NULL,
                saisonnalite VARCHAR(32) NOT NULL,
                denomination VARCHAR(100) NOT NULL,
                vegan BOOLEAN NOT NULL,
                tempsRealisation VARCHAR(100) NOT NULL,
                ingredients TEXT NOT NULL,
                detailRecette TEXT NOT NULL,
                CONSTRAINT recette_pk PRIMARY KEY (numRecette)
);
COMMENT ON COLUMN public.recette.categorie IS 'Plat ou dessert';
COMMENT ON COLUMN public.recette.ingredients IS 'Saisir ici l''ensemble des ingrédients et leur proportions en pourcentage pour affichage fiche plat.';


ALTER SEQUENCE public.recette_numrecette_seq OWNED BY public.recette.numRecette;

CREATE SEQUENCE public.commande_numcommande_seq;

CREATE TABLE public.commande (
                numCommande INTEGER NOT NULL DEFAULT nextval('public.commande_numcommande_seq'),
                clientID INTEGER NOT NULL,
                dateCommande TIMESTAMP NOT NULL,
                dateLivraison TIMESTAMP NOT NULL,
                adresseLivraison INTEGER NOT NULL,
                livreurID INTEGER NOT NULL,
                CONSTRAINT commande_pk PRIMARY KEY (numCommande)
);


ALTER SEQUENCE public.commande_numcommande_seq OWNED BY public.commande.numCommande;

CREATE SEQUENCE public.facture_numfacture_seq;

CREATE TABLE public.facture (
                numFacture INTEGER NOT NULL DEFAULT nextval('public.facture_numfacture_seq'),
                numCommande INTEGER NOT NULL,
                adresseFacturation INTEGER NOT NULL,
                CONSTRAINT facture_pk PRIMARY KEY (numFacture)
);


ALTER SEQUENCE public.facture_numfacture_seq OWNED BY public.facture.numFacture;

CREATE SEQUENCE public.utilisateur_utilisateurid_seq;

CREATE TABLE public.utilisateur (
                utilisateurID INTEGER NOT NULL DEFAULT nextval('public.utilisateur_utilisateurid_seq'),
                nom VARCHAR(50) NOT NULL,
                prenom VARCHAR(50) NOT NULL,
                fonction VARCHAR(32) NOT NULL,
                login VARCHAR(32) NOT NULL,
                motDePasse VARCHAR(32) NOT NULL,
                isActive BOOLEAN DEFAULT true NOT NULL,
                CONSTRAINT utilisateur_pk PRIMARY KEY (utilisateurID)
);
COMMENT ON COLUMN public.utilisateur.fonction IS 'Admin, cuisinier, comptabilité, ...';


ALTER SEQUENCE public.utilisateur_utilisateurid_seq OWNED BY public.utilisateur.utilisateurID;

CREATE SEQUENCE public.article_numarticle_seq;

CREATE TABLE public.article (
                numArticle INTEGER NOT NULL DEFAULT nextval('public.article_numarticle_seq'),
                utilisateurID INTEGER NOT NULL,
                numRecette INTEGER NOT NULL,
                prixHt NUMERIC(7,2) NOT NULL,
                tauxTva100 NUMERIC(4,2) NOT NULL,
                CONSTRAINT article_pk PRIMARY KEY (numArticle)
);


ALTER SEQUENCE public.article_numarticle_seq OWNED BY public.article.numArticle;

CREATE TABLE public.ligneCommande (
                numCommande INTEGER NOT NULL,
                numArticle INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT lignecommande_pk PRIMARY KEY (numCommande, numArticle)
);


ALTER TABLE public.commande ADD CONSTRAINT livreur_commande_fk
FOREIGN KEY (livreurID)
REFERENCES public.livreur (livreurID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (clientID)
REFERENCES public.client (clientID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.adresse ADD CONSTRAINT client_adresse_fk
FOREIGN KEY (clientID)
REFERENCES public.client (clientID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.facture ADD CONSTRAINT adresse_facture_fk
FOREIGN KEY (adresseFacturation)
REFERENCES public.adresse (numAdresse)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT adresse_commande_fk
FOREIGN KEY (adresseLivraison)
REFERENCES public.adresse (numAdresse)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.article ADD CONSTRAINT article_recette_fk
FOREIGN KEY (numRecette)
REFERENCES public.recette (numRecette)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ligneCommande ADD CONSTRAINT commande_lignecommande_fk
FOREIGN KEY (numCommande)
REFERENCES public.commande (numCommande)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.facture ADD CONSTRAINT commande_facture_fk
FOREIGN KEY (numCommande)
REFERENCES public.commande (numCommande)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.article ADD CONSTRAINT utilisateur_article_fk
FOREIGN KEY (utilisateurID)
REFERENCES public.utilisateur (utilisateurID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ligneCommande ADD CONSTRAINT article_lignecommande_fk
FOREIGN KEY (numArticle)
REFERENCES public.article (numArticle)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
