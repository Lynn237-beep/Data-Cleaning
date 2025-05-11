 # Projet : Nettoyage de données clients avec SQL

Ce projet montre comment une étudiante dans a quete pour trouver une alternance pour Septembre 2025, à nettoyer une base de données clients à l’aide de requêtes SQL simples.
Ce projet s’inscrit dans une démarche de gouvernance de la donnée et améliore la qualité, la complétude et la cohérence des informations.

---

## Objectifs

- Détecter et supprimer les doublons
- Identifier les champs invalides ou manquants
- Standardiser les noms et prénoms
- Générer un rapport de complétude

---

## Contenu du dépôt

| Fichier                         | Description |
|-------------------------------|-------------|
| `base_clients.csv`       | Jeu de données clients contenant des erreurs typiques (doublons, incohérences, cases vides) |
| `script_nettoyage_base_clients.sql` | Script SQL de nettoyage et standardisation à exécuter dans MySQL |
| `README.md`                    | Documentation du projet |

---

##  Instructions d'utilisation

1. Importez le fichier `base_clients_brute.csv` dans MySQL.
2. Exécutez les requêtes contenues dans `script_nettoyage_clients.sql` :
   - Suppression de doublons
   - Nettoyage des noms/prénoms
   - Suppression ou mise à jour des champs invalides
3. Vérifiez les résultats grâce aux requêtes de reporting (comptage des champs valides/manquants).

---

## Exemple de requêtes utilisées

```sql
-- Suppression des doublons d’email
DELETE FROM clients_brute
WHERE id NOT IN (
  SELECT MIN(id)
  FROM clients_brute
  GROUP BY email
);