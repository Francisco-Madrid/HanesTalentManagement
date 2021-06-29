<?php

    class db
    {
        public function __construct($username, $password, $host, $dbname)
        {
            $this->isConnected = true;
            try 
            { 
                $this->datab = new PDO("sqlsrv:Server=$host\SQLEXPRESS;Database=$dbname", $username, $password); 
                $this->datab->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
                $this->datab->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
            } 
            catch(PDOException $e) 
            { 
                echo $e;
                $this->isConnected = false;
                throw new Exception($e->getMessage());
            }
        }

        public function desconectar()
        {
            $this->datab = null;
            $this->isConnected = false;
        }

        public function getFila($query, $params=array())
        {
            try
            { 
                $stmt = $this->datab->prepare($query); 
                $stmt->execute($params);
                return $stmt->fetch(); 

            }catch(PDOException $e)
            {
                throw new Exception($e->getMessage());
            }
        }

        public function getFilas($query, $params=array())
        {
            try
            { 
                $stmt = $this->datab->prepare($query); 
                $stmt->execute($params);
                return $stmt->fetchAll();       
            
            }catch(PDOException $e)
            {
                throw new Exception($e->getMessage());
            }       
        }

        public function insertar($query, $params)
        {
            try
            { 
                $stmt = $this->datab->prepare($query); 
                $stmt->execute($params);
                
            }catch(PDOException $e)
            {
                throw new Exception($e->getMessage());
            }           
        }
    }

?>