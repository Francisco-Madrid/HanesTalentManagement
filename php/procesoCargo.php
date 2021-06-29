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
            $Query = "EXEC [dbo].[sp_Cargo_Categoria_Mostar]";

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
            $CategoriaCargoID = $_POST['CategoriaCargoID'];

            $cargoNombre = $_POST['cargoNombre'];
            $cargoDescripcion = $_POST['cargoDescripcion'];

            $CategoriaID = $_POST['CategoriaID'];
            $CargoID = $_POST['CargoID'];

            $Query = "EXEC [dbo].[sp_CategoriaCargo_Verificar] '$CategoriaCargoID'";

            $result = $conexion->getFilas($Query);

            if(count($result) == 0)
            {
                $Query = "EXEC [dbo].[sp_Cargo_Categoria_Insertar] '$cargoNombre', '$cargoDescripcion', '$CategoriaID'";

                try {
                    $conexion->insertar($Query, null);

                    echo 'guardo';
                } catch (\Throwable $th) {
                    echo $th;
                }
            }
            else
            {
                $Query ="EXEC [dbo].[sp_Cargo_Categoria_Actualizar] $CargoID, '$cargoNombre', '$cargoDescripcion', $CategoriaCargoID, $CategoriaID";
                try {
                    $conexion->insertar($Query, null);

                    echo 'modifico';
                } catch (\Throwable $th) {
                    echo $th;
                }
            }
        }

        if($_POST['proceso'] == 'ObtenerCategorias')
        {
            $Query ="EXEC [dbo].[sp_Categoria_Mostrar]";

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