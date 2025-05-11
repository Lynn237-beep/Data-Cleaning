
-- Nettoyage de la base clients
-- Suppression des doublons 
DELETE FROM clients_brute
WHERE id NOT IN (
  SELECT MIN(id)
  FROM clients_brute
  GROUP BY email
);

-- Vérification des dates de naissance manquantes ou invalides
SELECT * 
FROM clients_brute
WHERE date_naissance IS NULL OR date_naissance NOT LIKE '__/__/____';

-- Standardisation des noms et prénoms (majuscule)
UPDATE clients_brute
SET nom = INITCAP(nom),
    prenom = INITCAP(prenom);

-- Suppression des numéros de téléphone invalides
UPDATE clients_brute
SET telephone = NULL
WHERE telephone = '0000000000';

-- Rapport de complétude des données
SELECT
  COUNT(*) AS total_clients,
  COUNT(date_naissance) AS dates_valides,
  COUNT(*) - COUNT(date_naissance) AS dates_manquantes
FROM clients_brute;
