<?php

include("DatabaseConnect.php");

final class Cliente extends DatabaseConnect{
    
    protected $connectar;
    
    
    public function create($dadosclientesarray){

        try{
            
        $this -> connectar = $this -> connect();

            if($this -> connectar){
                
                $stmt = $this -> connectar -> prepare(
                "insert into CLIENTE
                (FKIDTIPOCLIENTE, NOMECLIENTE, SOBRENOME) 
                values (?, ?, ?)"
                );

                $result = $stmt->execute(
                [ 
                $dadosclientesarray["FK_CLIENTE"], 
                $dadosclientesarray["NMCLIENTE"], 
                $dadosclientesarray["SBCLIENTE"] 
                ]);

                if($result){
                    return "success";
                }else{
                    return "fail";
                }


            }else{
                return "paunahoradeconectar";
            }


        }

        catch(PDOException $err){
            return "Cagou{$err}";

        }

    }
    
}