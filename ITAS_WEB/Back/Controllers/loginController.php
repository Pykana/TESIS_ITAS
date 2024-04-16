<?php
require "Back/SQL/Conexion.php";  
$pdo = connectToDatabase();
if ($pdo === null) {
    // Si $pdo es null, mostrar un popup de advertencia con JavaScript
    echo '<script>alert("No se pudo conectar a la base de datos.");</script>';
}

?>
