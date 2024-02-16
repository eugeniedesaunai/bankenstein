# Failles de sécurité

<blockquote>

## Exemple

Le code laisse passer des injections SQL, car il n'a pas vérifié le contenu de la donnée fournie par l'utilisateur.

- fichier : `src/Models/Car.php`
- ligne : 215

```php
$plate = $_POST['plate']; // donnée brute récupérée, sans filtre ni validation
$model = $_POST['model']; // donnée brute récupérée, sans filtre ni validation
$brand = $_POST['brand']; // donnée brute récupérée, sans filtre ni validation
// Quand on génère la requête SQL, on laisse chaque donnée brute, laissant passer l'injection de code SQL
$sql = 'INSERT INTO car (brand, model, plate) VALUES (\'' . $brand . \', \'' . $model . \', \'' . $plate . \')';
$pdo->exec($sql);
```



-> Il y a une faille sur l'envoie des compte utilisateur en BDD car les mot de passe sont en clair, il faudrait utiliser du SHA256 ou Bcrypt.
-> Utiliser des gestions d'erreur avec des phrase plus générique et moins précise.
-> dans l'idéal le secret (process.env.SESSION_SECRET || "toto") ne devrait pas être static, et il devrait être fort et unique
-> problème de validation des données
</blockquote>
