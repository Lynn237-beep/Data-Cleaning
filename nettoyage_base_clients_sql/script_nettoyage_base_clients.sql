
-- Nettoyage de la base clients
-- Suppression des doublons 
DELETE FROM clients
WHERE id NOT IN (
  SELECT MIN(id)
  FROM clients
  GROUP BY email
);

-- Vérification des dates de naissance
SELECT * 
FROM clients
WHERE date_naissance IS NULL OR date_naissance NOT LIKE '__/__/____';

-- Standardisation des noms et prénoms (majuscule)
UPDATE clients
SET nom = INITCAP(nom),
    prenom = INITCAP(prenom);

-- Suppression des numéros de téléphone invalides
UPDATE clients
SET telephone = NULL
WHERE telephone = '0000000000';

-- Rapport de complétude des données
SELECT
  COUNT(*) AS total_clients,
  COUNT(date_naissance) AS dates_valides,
  COUNT(*) - COUNT(date_naissance) AS dates_manquantes
FROM clients;
