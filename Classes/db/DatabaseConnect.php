<?php

namespace DbConnect;

require_once ('config.php');

use PDO, PDOException;


class DatabaseConnect{
    
        protected $host = HOST;
        protected $user = USER;
        protected $pass = PASS;
        protected $dbname = DB;
        protected $port = PORT;

        protected object $connect;

        public function connect(): ?PDO{

            try{
                
                $dsn = "mysql:host={$this->host};
                port={$this->port};
                dbname={$this->dbname}";


                $this->connect = new PDO($dsn, $this->user, $this->pass);

                return $this->connect;
                
            }catch(PDOException $err){

                error_log("Morri ". $err->getMessage());
                return null;

            }

        }

    
    
}

$b1 = new DatabaseConnect();

if($b1->connect() != null){
    echo "certo";

}else{
    echo "Pau";
}

