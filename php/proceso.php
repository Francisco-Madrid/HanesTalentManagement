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
            $nombre = $_POST['nombre'];
            $correo = $_POST['correo'];
            $cargo = $_POST['cargo'];
            $departamento = $_POST['departamento'];
            $jefe = $_POST['jefe'];
            $estado = $_POST['estado'];

            $SQLCompara="SELECT * FROM Empleado WHERE EmpleadoId = '$id'";

            $resul1 = $conexion->getFilas($SQLCompara);
            $objeto11 = json_encode($resul1);
            $objeto22 = json_decode($objeto11);
        
            if(count($objeto22)==0)
            {
                if($jefe == 0)
                {
                    $jefe ='NULL';
                }
                $Query = "EXEC [dbo].[sp_Empleado_Insertar] '$nombre', '$correo', $cargo, $departamento, $estado, $jefe";
                
                try {
                    $conexion->insertar($Query, null);
                    echo 'guardar';
                } catch (\Throwable $th) {
                    echo $th;
                }
            }
            else
            {
                $Query = "EXEC [dbo].[sp_Empleados_Actualizar] $id, '$nombre', '$correo', $cargo, $departamento, $estado, $jefe";

                try {
                    $conexion->insertar($Query, null);
                    echo 'modifico';
                } catch (\Throwable $th) {
                    echo $th;
                }
            }
        }
        if($_POST['proceso']=='inactive')
        {
            $id = $_POST['id'];
            $SQLQuery = "UPDATE [dbo].[Empleado] SET [Estado] = 0 WHERE Empleado.EmpleadoID =   $id";
            try {
                $conexion->insertar($SQLQuery, null);
                echo 'desactivo';
            } catch (\Throwable $th) {
                echo 'error';
            }
        }

        if($_POST['proceso']=='fill')
        {
            $Query = "EXEC [dbo].[sp_Empleados_Mostrar]";

            try {
                $result = $conexion->getFilas($Query);
                
                print json_encode($result, JSON_UNESCAPED_UNICODE);
            } catch (\Throwable $th) {
                
                $endRes = array ('error');
                print json_encode($endRes, JSON_UNESCAPED_UNICODE);
            }
        }

        if($_POST['proceso']=='ObtenerPlantas')
        {
            $Query = "SELECT PlantaID, PlantaNombre FROM Planta";

            try {
                $result = $conexion->getFilas($Query);
                
                print json_encode($result, JSON_UNESCAPED_UNICODE);
            } catch (\Throwable $th) {

                $endRes = array ('error');
                print json_encode($endRes, JSON_UNESCAPED_UNICODE);
            }
        }

        if($_POST['proceso']=='ObtenerDepartamentos')
        {
            $filtro = $_POST['filtro'];

            $Query = "EXEC [dbo].[sp_DepartamentoPlanta_Buscar] $filtro";

            try {
                $result = $conexion->getFilas($Query);
                
                print json_encode($result, JSON_UNESCAPED_UNICODE);
            } catch (\Throwable $th) {
                
                $endRes = array ('error');
                print json_encode($endRes, JSON_UNESCAPED_UNICODE);
            }
        }

        if($_POST['proceso']=='ObtenerCargos')
        {
            $Query = "SELECT CategoriaCargo.CategoriaCargoID, Cargo.CargoNombre 
            FROM CategoriaCargo INNER JOIN Cargo ON CategoriaCargo.FKCargoID = Cargo.CargoID";

            try {
                $result = $conexion->getFilas($Query);
                
                print json_encode($result, JSON_UNESCAPED_UNICODE);
            } catch (\Throwable $th) {
                
                $endRes = array ('error');
                print json_encode($endRes, JSON_UNESCAPED_UNICODE);
            }
        }

        if($_POST['proceso']=='ObtenerJefes')
        {
            $id = $_POST['PlantaID'];

            $Query = "EXEC [dbo].[sp_Empleado_Planta_Mostrar] $id";

            try {
                $result = $conexion->getFilas($Query);
                
                print json_encode($result, JSON_UNESCAPED_UNICODE);
            } catch (\Throwable $th) {
                
                $endRes = array ('error');
                print json_encode($endRes, JSON_UNESCAPED_UNICODE);
            }
        }
    }
?>