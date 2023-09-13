<?php

namespace DbConnect;

use PDO, PDOException;

abstract class DatabaseConnect{
    
        protected $host = "127.0.0.1";
        protected $user = "root";
        protected $pass = "";
        protected $dbname = "itospet";
        protected $port = 3307;

        protected object $connect;

        public function connect(): ?PDO{

            try{
                
                $dns = "mysql:host={$this->host};
                port={$this->port}
                ;dbname={$this->dbname}";

                $this->connect = new PDO($dns, $this->user, $this->pass);

                return $this->connect;
                
            }catch(PDOException $err){

                error_log("Morri ". $err->getMessage());
                return null;

            }

        }

    
    
}

