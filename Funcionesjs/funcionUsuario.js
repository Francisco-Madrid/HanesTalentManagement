$(document).ready(function(){
    tablaUsuario = $("#tablaUsuario").DataTable({
        "dom": '<"toolbar">frtip',
        "order": [[1, "asc"]],
        "ajax":{
            "url": "../php/procesoUsuario.php",
            "method": 'POST',
            "data": {proceso: 'llenar'},
            "dataSrc":""
        },
        columns:[
            {"data":"UsuarioEmpleadoID", "title": "Id" },
            {"data":"EmpleadoNombre", "title": "Nombre del empleado" },
            {"data":"EmpleadoCorreo", "title": "Correo" },
            {"data":"UsuarioNombre", "title": "Nombre de usuario" },
            {"data":"TipoUsuarioNombre", "title": "Tipo de usuario" },
            {"data":"PlantaNombre", "title": "Planta" },
            {"data":"PaisNombre", "title": "Pais" },
            {"data":"Estado", "title": "Estado" },
            {"title": "Acciones"}
        ],
        "columnDefs":[
            {
                "targets": [0],
                "visible": false,
                "searchable": false
            },
            {
            "targets": -1,
            "defaultContent": 
                "<div class='text-center'>"+
                    "<div class='btn-group'>"+
                        "<button class='btn btn-primary btnEditar'>Editar</button>"+
                        "<button class='btn btn-danger btnDesactivar'>Desactivar</button>"+
                    "</div>"+
                "</div>"  
           }],
            
        "language": {
                "lengthMenu": "Mostrar _MENU_ registros",
                "zeroRecords": "No se encontraron resultados",
                "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                "sSearch": "Buscar:",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast":"Último",
                    "sNext":"Siguiente",
                    "sPrevious": "Anterior"
                 },
                 "sProcessing":"Procesando...",
            }
    });


    $("div.toolbar").html('<button id="btnNuevo" type="button" class="btn btn-success " data-toggle="modal">Nuevo registro</button>');

    var fila;
   

    $("#btnNuevo").click(function(){
        $("#formUsuario").trigger("reset");
        $(".modal-header").css("background-color", "#1cc88a");
        $(".modal-header").css("color", "white");
        $(".modal-title").text("Nuevo empleado");            
        $("#modalCRUD").modal("show");     

        ObtenerTipoUsuario();
        ObtenerEmpleado();

        $('#id').val(0);
        fila = null;

        $("#msg").hide();

        $("#btnGuardar").text("Guardar");
    });  

    $("#btnCancelar").click(function(){
        $("#formUsuario").trigger("reset");
        $("#modalCRUD").modal("hide");
    })

    $("#btnGuardar").click(function(){
        var usuarioEmpleadoID = $("#id").val();

        var usuarioNombre = $("#usuarioNombre").val();
        var contrasena = $("#contrasenaConfirmar").val();
        var tipoUsuarioID = $("#tipoUsuario").val();
        var estado = $('#estado').is(':checked');
        var empleadoID = $('#empleadoID').val();


        if(usuarioNombre=='')
        {
            alert("llene el campo de usuario");
            return;
        }


        if(VerificarContrasena())
        {
            $.post("../php/procesoUsuario.php",{
                proceso: 'save',
                id: usuarioEmpleadoID,
                usuarioNombre: usuarioNombre,
                contrasena: contrasena,
                TipoUsuario: tipoUsuarioID,
                Estado: estado,
                FKEmpleadoID: empleadoID
            },
            function(data){
                var resArray = JSON.parse(data);

                console.log(resArray[0].Respuesta)
                switch(resArray[0].Respuesta)
                {
                    case 'Exito':
                        console.log("Insertado con exito")
                        tablaUsuario.ajax.reload();
                        $("#modalCRUD").modal("hide");
                        break;
                    case 'Existente':
                        console.log("Nombre de usuario existente");
                        break;
                    case 'CuentaExistente':
                        console.log("Cuenta existente para este empleado");
                        break;
                    case 'modifico':
                        tablaUsuario.ajax.reload();
                        console.log("Se modifico el registro con exito");
                        $("#modalCRUD").modal("hide");
                        break;
                }
            });
        }
        else
        {

        }
    });

    $(document).on("click", ".btnEditar", function(){
        $("#btnGuardar").text("Modificar");
        
        fila = $(this).closest("tr");

        filaInfo = tablaUsuario.row(fila).data();

        ObtenerTipoUsuario();
        ObtenerEmpleado();

        $("#formUsuario").trigger("reset");
        $(".modal-header").css("background-color", "#4e73df");
        $(".modal-header").css("color", "white");
        $(".modal-title").text("Editar planta");            
        $("#modalCRUD").modal("show");  
    });

    $('#modalCRUD').on('shown.bs.modal', function(){
        if(fila != null)
        {
            filaInfo = tablaUsuario.row(fila).data();

            id = filaInfo['UsuarioEmpleadoID'];
            
            $.post("../php/procesoUsuario.php",{
                proceso: 'ObtenerDatosActualizar',
                id: id
            },
            function(data){
                var resArray = JSON.parse(data);

                if(resArray[0] != null)
                {
                    $("#id").val(id);
                    $("#tipoUsuario").val(parseInt(resArray[0].TipoUsuarioID));
                    $("#usuarioNombre").val(resArray[0].UsuarioNombre);
                    $('#empleadoID').val(parseInt(resArray[0].EmpleadoID));
                    $('#estado').prop("checked", parseInt(resArray[0].Estado));
                }
            });
        }
    });



    $("#contrasena, #contrasenaConfirmar").keyup(function(){
        if($("#contrasenaConfirmar").val().length != 0)
        {
            if($('#contrasena').val() != $("#contrasenaConfirmar").val())
            {
                $("#mensaje").html("La contraseñas no coinciden").css("color","red");
            }
            else
            {
                $("#mensaje").html("La contraseñas coinciden").css("color","green");
            }
            $("#mensaje").css("visibility","visible");
        }
        else
        {
            $("#mensaje").css("visibility","hidden");
        }
    });

    function VerificarContrasena()
    {
        if($("#contrasenaConfirmar").val().length != 0)
        {
            if($('#contrasena').val() != $("#contrasenaConfirmar").val())
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        else
        {
            return false;
        }
    };

    function ObtenerEmpleado()
    {
        $.post("../php/procesoUsuario.php",{
            proceso: 'ObtenerEmpleados'
        },
            function(data){
                
                var resArray = JSON.parse(data);

                if(resArray[0] == 'Error')
                {
                    console.log("Error al llenar el select");
                    console.log(data);
                }
                else
                {
                    $('#empleadoID option:not(:first)').remove();
                    $('#empleadoID').val(0);

                    for(key in resArray)
                    {
                        $('#empleadoID').append($('<option>',{
                            value: resArray[key].EmpleadoID,
                            text: resArray[key].EmpleadoNombre
                        }));
                    }
                }
            });
    };

    function ObtenerTipoUsuario()
    {
        $.post("../php/procesoUsuario.php",{
            proceso: 'ObtenerTipoUsuarios'
        },
            function(data){

                var resArray = JSON.parse(data);

                if(resArray[0] == 'Error')
                {
                    console.log("Error al llenar el select");
                    console.log(data);
                }
                else
                {
                    $('#tipoUsuario option:not(:first)').remove();
                    $('#tipoUsuario').val(0);

                    for(key in resArray)
                    {
                        $('#tipoUsuario').append($('<option>',{
                            value: resArray[key].TipoUsuarioID,
                            text: resArray[key].TipoUsuarioNombre
                        }));
                    }
                }
        });
    };
});