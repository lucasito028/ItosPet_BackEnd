<?php

abstract class DatabaseConnect{
    
    // Se o senhor quiser alterar depois para cada configuração

    protected $host = "Toshis";

    protected $user = "root";

    //Mudar se Pedir
    protected $pass = "";

    protected $port = 3007;

    protected $db = "itospet";

    protected $conn = null;

    public function connect(): ?PDO {

        try {

            $dns = 
            "mysql:host={$this->host};
            port={$this->port};
            dbname={$this->db}";

            $options = [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
            ];

            $this->conn = new PDO(
                $dns,
                $this->user,
                $this->pass,
                $options
            );

            return $this->conn;
            
        } catch(PDOException $err) {
         
            error_log("Connection error: " . $err->getMessage());
            return null;
        }

    }
    
    
}


