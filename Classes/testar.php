<?php

require_once 'Cliente.php';


$cliente = new cliente\Cliente();

// Parte do Select
/*

$selectResult = $cliente->select();
echo "Resultado da consulta:\n";
print_r($selectResult);

*/

$selectResult = $cliente->select();
echo "Resultado da consulta:\n";
print_r($selectResult);


// Create
/*
$dadosCliente = [
    "NMCLIENTE" => "Paulo",
    "SBCLIENTE" => "Klepeo"
];
$createResult = $cliente->create($dadosCliente);
echo "Resultado da inserção:\n";
echo $createResult . "\n";
*/



// Update
/*

$dadosClienteUpdate = [
    "NMCLIENTE" => "Paulo",
    "SBCLIENTE" => "Kleipinho",
    "CPFCLIENTE" => 6,
];
$updateResult = $cliente->update($dadosClienteUpdate);
echo "Resultado da atualização:\n";
echo $updateResult . "\n";

*/


// Delete
/*

$dadosClienteDelete = [
    "CPFCLIENTE" => 6
];
$deleteResult = $cliente->delete($dadosClienteDelete);
echo "Resultado da exclusão:\n";
echo $deleteResult . "\n";

*/

$dadosClienteDelete = [
    "CPFCLIENTE" => 6
];
$deleteResult = $cliente->delete($dadosClienteDelete);
echo "Resultado da exclusão:\n";
echo $deleteResult . "\n";
echo"<br><br><br>";

echo"<br><br><br>";

$selectResult = $cliente->select();
echo "Resultado da consulta:\n";
print_r($selectResult);
