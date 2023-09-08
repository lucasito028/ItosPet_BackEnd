<?php

require_once 'DatabaseConnect.php';

use DbConnect\DatabaseConnect;

try {
    $dbConnect = new DatabaseConnect();
    $conexao = $dbConnect->connect();

    if ($conexao !== null) {
        echo "Conexão bem-sucedida!";
    } else {
        echo "Erro na conexão. Verifique o log de erros para obter mais informações.";
    }
} catch (Exception $e) {
    echo "Erro durante a conexão: " . $e->getMessage();
}