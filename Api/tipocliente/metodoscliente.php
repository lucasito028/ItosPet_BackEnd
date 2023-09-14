<?php

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $action = isset($_POST["action"]) ? $_POST["action"] : "";

    require_once 'Cliente.php';

    $cliente = new cliente\Cliente();

    switch ($action) {
        case "create":
            // Recuperar os dados do cliente do POST e chamar o método create
            $result = $cliente->create($_POST);
            break;

        case "update":
            // Recuperar os dados do cliente do POST e chamar o método update
            $result = $cliente->update($_POST);
            break;

        case "delete":
            // Recuperar os dados do cliente do POST e chamar o método delete
            $result = $cliente->delete($_POST);
            break;

        default:
            $result = "Ação inválida";
            break;
    }

    echo $result;
} else {
    echo "Acesso não autorizado";
}
