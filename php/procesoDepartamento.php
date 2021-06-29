<?php

    include '../conexion/constante.php';
    include '../conexion/conexion.php';
 
    $C = new Constant();
 
    //para sql server
    $user  = $C->user;
    $pass  = $C->pass;
    $host  = $C->host;
    $dba   = $C->dba;

    if(isset($_POST['proceso'])){

        $conexion = new db($user,$pass,$host,$dba,array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

        if($_POST['proceso'] == 'llenar')
        {
            $Query = "EXEC [dbo].[sp_Departamento_Mostrar]";

            try {
                $result = $conexion->getFilas($Query);

                print json_encode($result, JSON_UNESCAPED_UNICODE);
            } catch (\Throwable $th) {
                $result = array ('error');

                print json_encode($result, JSON_UNESCAPED_UNICODE);
            }
        }

        if($_POST['proceso'] == 'save')
        {
            $id = $_POST['id'];
            $departamentoNombre = $_POST['departamento'];

            $Query = "SELECT * FROM Departamento WHERE DepartamentoID = '$id'";

            $result = $conexion->getFilas($Query);

            if(count($result) == 0)
            {
                try {
                    $Query = "EXEC [dbo].[sp_Departamento_Insertar] '$departamentoNombre'";

                    $conexion->insertar($Query, null);

                    echo 'guardo';
                } catch (\Throwable $th) {
                    
                    echo $th;
                }
            }
            else
            {
                $Query = "EXEC [dbo].[sp_Departamento_Actualizar] $id,'$departamentoNombre'" ;
                

                try {
                    $conexion->insertar($Query, null);

                    echo 'modifico';
                } catch (\Throwable $th) {
                    echo $th;
                }
            }
        }
    }
?>