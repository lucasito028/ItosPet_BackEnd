<?php

include("DatabaseConnect.php");

class Cliente extends DatabaseConnect{
    
    protected $connectar;

    protected array $formdt;
    

    public function create($dadosclientesarray){

        try{
            
        $this->connectar = $this-> connect();

            if($this->connectar){
                $stmt = $this->connectar->prepare(
                "insert into CLIENTE
                (FKIDTIPOCLIENTE, NOMECLIENTE, SOBRENOME) 
                values (?, ?, ?)");

                $stmt->execute(
                [ 
                $dadosclientesarray["FK_CLIENTE"], 
                $dadosclientesarray["NMCLIENTE"], 
                $dadosclientesarray["SBCLIENTE"] 
                ]);
            }
        }

        catch(PDOException $err){

        }

    }
    
}