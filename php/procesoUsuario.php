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

            $Query = "EXEC [dbo].[sp_UsuarioEmpleado_Mostrar] ";

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
            $usuarioEmpleadoID = $_POST['id'];

            $usuarioNombre = $_POST['usuarioNombre'];
            $contrasena = $_POST['contrasena'];
            $TipoUsuario = $_POST['TipoUsuario'];
            $Estado = $_POST['Estado'];

            $FKEmpleadoID = $_POST['FKEmpleadoID'];
        
            $Query = "EXEC [dbo].[sp_UsuarioEmpleado_Buscar] $usuarioEmpleadoID";

            $result = $conexion->getFilas($Query, null);

            if(count($result) == 0)
            {
                $Query = "EXEC [dbo].[sp_UsuarioEmpleado_Insertar] '$usuarioNombre', '$contrasena', $TipoUsuario, $Estado, $FKEmpleadoID";

                try {
                    $result = $conexion->getFilas($Query, null);
    
                    print json_encode($result, JSON_UNESCAPED_UNICODE);
                } catch (\Throwable $th) {
                    echo $th;
                }
            }
            else
            {
                $Query = "EXEC [dbo].[sp_UsuarioEmpleado_Actualizar] $usuarioEmpleadoID, '$usuarioNombre', '$contrasena', $TipoUsuario, $Estado";

                try {
                    $conexion->insertar($Query, null);
                    $array = array('Respuesta' => 'modifico');
                    $result = array ('0' => $array);
                    print json_encode($result, JSON_UNESCAPED_UNICODE);
                } catch (\Throwable $th) {
                    echo $th;
                }
            }
        }

        if($_POST['proceso'] == 'ObtenerTipoUsuarios')
        {
            $Query = "EXEC [dbo].[sp_TipoUsuario_Mostrar]";

            try {
                $result = $conexion->getFilas($Query, null);

                print json_encode($result, JSON_UNESCAPED_UNICODE);
            } catch (\Throwable $th) {
                echo $th;
            }
        }

        if($_POST['proceso']=='ObtenerEmpleados')
        {
            $Query = "EXEC [dbo].[sp_Usuario_Empleado_Mostrar] ";

            try {
                $result = $conexion->getFilas($Query);
                
                print json_encode($result, JSON_UNESCAPED_UNICODE);
            } catch (\Throwable $th) {
                
                $endRes = array ('error');
                print json_encode($endRes, JSON_UNESCAPED_UNICODE);
            }
        }

        if($_POST['proceso']=='ObtenerDatosActualizar')
        {
            $usuarioEmpleadoID = $_POST['id'];

            $Query= "[dbo].[sp_UsuarioEmpleado_Buscar_Actualizar] '$usuarioEmpleadoID'";

            try {
                $result = $conexion->getFilas($Query, null);

                print json_encode($result, JSON_UNESCAPED_UNICODE);
            } catch (\Throwable $th) {
                echo $th;
            }
        }
    }
?>