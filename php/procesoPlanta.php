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

        if($_POST['proceso'] == 'save')
        {
            $id = $_POST['id'];
            $plantaNombre = $_POST['plantaNombre'];
            $paisID = $_POST['paisID'];
            $estado = $_POST['estado'];

            $Query = "SELECT * FROM Planta WHERE PlantaID = '$id'";

            $result = $conexion->getFilas($Query);

            if(count($result) == 0)
            {
                $Query = "EXEC [dbo].[sp_Planta_Insertar] '$plantaNombre', $paisID, $estado";

                try {
                    $conexion->insertar($Query, null);

                    echo 'success';
                } catch (\Throwable $th) {
                    echo $th;
                }
            }
            else
            {
                $Query = "EXEC [dbo].[sp_Planta_Actualizar] $id, '$plantaNombre', $paisID, $estado";
                
                try {
                    $conexion->insertar($Query, null);

                    echo 'modifico';
                } catch (\Throwable $th) {
                    echo $th;
                }
            }
        }

        if($_POST['proceso'] == 'llenar')
        {

            $Query = "EXEC [dbo].[sp_Planta_Mostar]";

            try {
                $result = $conexion->getFilas($Query);

                print json_encode($result, JSON_UNESCAPED_UNICODE);
            } catch (\Throwable $th) {
                $result = array ('error');

                print json_encode($result, JSON_UNESCAPED_UNICODE);
            }
        }

        if($_POST['proceso'] == 'ObtenerPaises')
        {
            $Query = "EXEC [dbo].[sp_Pais_Mostar]";

            try {
                $result = $conexion->getFilas($Query);

                print json_encode($result, JSON_UNESCAPED_UNICODE);
            } catch (\Throwable $th) {
                $result = array ('error');

                print json_encode($result, JSON_UNESCAPED_UNICODE);
            }
        }
    }
?>
