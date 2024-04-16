<?php

function connectToDatabase() {
    require "config.php";                           //RUTA DE DATA PARA CONEXION A BASE DE DATOS
    try {
        $pdo = new PDO($dsn, $user, $password);     //CONEXION (PRIMERA PARTE ,USER , PASS)
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);  //REALIZAR CONEXION
        //    if ($pdo) {
        //       echo "$dbname , conexion exitosa !" ;  //MENSAJE POR SI REEALIZA CONEXION EXITOSA
        //     }
    } catch(PDOException $e) {
        // REGISTRO DE ERROR EN ARCHIVO DE TEXTO 
        $logMessage = "[" . date('Y-m-d H:i:s') . "] Error: " . $e->getMessage() . PHP_EOL; 
        file_put_contents("$rutaLog", $logMessage, FILE_APPEND);
        return null; // Devuelve null en caso de error
    }
    return $pdo;  //RETORNO DE DATO 
}
?>
