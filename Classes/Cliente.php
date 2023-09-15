<?php

namespace cliente;

require_once 'DatabaseConnect.php';

use DbConnect\DatabaseConnect, PDO, PDOException;


class Cliente extends DatabaseConnect{
    
    protected object $conn;
    
    
    public function select(){

        try{

            $this->conn = $this->connect();
    
            if ($this->conn) {
                $stmt = $this->conn->prepare(
                    "select CPF, 
                    concat(NOME, ' ', SOBRENOME) as `Nome Completo` from PESSOA 
                    where FKIDTIPOPESSOA like 1 
                    order by CPF asc 
                    limit 25;"
                );
    
                if ($stmt->execute()) {
                    // Recupera todos os registros como um array associativo
                    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
                    
                    return $result;
                } else {
                    return [];
                }
            } else {
                return "No Ler";
            }
        } catch (PDOException $err) {
            return "Cagou: " . $err->getMessage();
        }
    }
    
    
    public function create($dadosclientesarray){

        try{
            
        $this -> conn = $this -> connect();

            if($this -> conn){
                
                $stmt = $this -> conn -> prepare(
                "insert into 
                PESSOA (FKIDTIPOPESSOA, NOME, SOBRENOME) 
                values (1, ?, ?)"
                );

                $result = $stmt->execute(
                [  
                $dadosclientesarray["NMCLIENTE"], 
                $dadosclientesarray["SBCLIENTE"] 
                ]);

                if($result){

                    return true;

                }else{

                    return false;

                }


            }else{
                return "paunahoradeconectar";
            }


        }

        catch(PDOException $err){

            return "Cagou". $err->getMessage();

        }

    }


    public function update($dadosclientesarray){

        try{
            
        $this -> conn = $this -> connect();

            if($this -> conn){
                
                $stmt = $this -> conn -> prepare(
                "update pessoa set NOME = ?,
                SOBRENOME = ? where CPF = ?"
                );

                $result = $stmt->execute(
                [ 
                $dadosclientesarray["NMCLIENTE"], 
                $dadosclientesarray["SBCLIENTE"],
                $dadosclientesarray["CPFCLIENTE"] 
                ]);

                if($result){
                    
                    return true;

                }else{

                    return false;

                }


            }else{
                return "paunahoradeconectar";
            }


        }

        catch(PDOException $err){

            return "Cagou". $err->getMessage();

        }

    }


    public function delete($dadosclientesarray){

        try{
            
        $this -> conn = $this -> connect();

            if($this -> conn){
                
                $stmt = $this -> conn -> prepare(
                "delete from pessoa 
                where CPF = ?"
                );

                $result = $stmt->execute(
                [ 
                $dadosclientesarray["CPFCLIENTE"]
                ]);

                if($result){
                    
                    return true;

                }else{

                    return false;

                }


            }else{
                return "paunahoradeconectar";
            }


        }

        catch(PDOException $err){

            return "Cagou". $err->getMessage();

        }

    }
    
}