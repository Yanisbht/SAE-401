<?php
$host = "localhost"; // Adresse du serveur MySQL
$dbname = "sae401"; // Nom de ta base de données
$username = "root"; // Identifiant MySQL (par défaut sous XAMPP)
$password = ""; // Mot de passe (par défaut vide sous XAMPP)

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die(json_encode(["error" => "Connexion à la base de données échouée : " . $e->getMessage()]));
}
?>
