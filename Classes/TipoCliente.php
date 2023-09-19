<?php

namespace tpcliente;

require_once 'db/DatabaseConnect.php';

use PDO, PDOException, DbConnect\DbConnect;


class TipoCliente extends DbConnect{
   
    protected object $conn;


    public function select(){

        try{
            $this->conn = $this->connect();

            if($this->conn){

                $stmt = $this->conn->prepare("select IDTIPOPESSOA as `ID`, 
                NOMETIPOPESSOA as `Nome` from tipopessoa limit 4");

                if($stmt->execute()){

                    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

                    return $result;

                }
            }else{

                return [];

            }

        }
        catch(PDOException $err){
            error_log("Deu Pall {$err->getMessage()}");
            return null;
        }

    }

    public function create($dtipocliente){

        try{
            $this->conn = $this->connect();

            if($this->conn){
                $stmt = $this->conn->prepare("insert into tipopessoa(NOMETIPOPESSOA) values (?)");

                $result = $stmt->execute(
                    [
                    $dtipocliente["NOMETIPO"]
                ]);

                if($result){
                    return "sucess";
                }else{
                    return "fail";
                }

            }else{
                return "paunahoradeconectar";
            }
        }
        catch(PDOException $err){
            
            error_log("Pau:{$err->getMessage()}");
            return null;
        }
    }

    public function update($dtipocliente){
        try{

            $this->conn = $this->connect();
            
            if($this->conn){

                $stmt = $this->conn->prepare("update tipopessoa set NOMETIPOPESSOA = ? 
                where IDTIPOPESSOA = ?");

                $result = $stmt->execute([
                    $dtipocliente["NOMETIPO"],
                    $dtipocliente["IDTIPO"]
                ]);
                if($result){

                    return "sucess";

                }else{

                    return "fail";

                }

            }else{

                return "paunahoradeconectar";

            }
        }catch(PDOException $err){

            error_log("Pau:{$err->getMessage()}");
            return null;

        }
    }

}