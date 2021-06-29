$(document).ready(function(){

    tablaPersonas = $("#tablatest").DataTable({
        "dom": '<"toolbar">frtip',
        "scrollX": true,
        "order": [[1, "asc"]],
        "ajax":{
            "url": "../php/proceso.php",
            "method": 'POST',
            "data": {proceso: 'fill'},
            "dataSrc":""
        },
        columns:[
            {"data":"Id", "title": "Id" },
            {"data":"Nombre", "title": "Nombre" },
            {"data":"Correo", "title": "Correo" },
            {"data":"Jefe", "title": "Jefe"},
            {"data":"Cargo", "title": "Cargo" },
            {"data":"Categoria_de_cargo", "title": "Categoria de cargo" },
            {"data":"Departamento", "title": "Departamento" },
            {"data":"Planta", "title": "Planta" },
            {"data":"Pais", "title": "Pais" },
            {"data": "Estado", "title": "Estado",
                render: function (data) {
                    if (data == 0) {
                        return '<i class="bi bi-x-square-fill icon-red"></i>';
                    }
                    if (data == 1) {
                        return '<i class="bi bi-check-square-fill icon-green"></i>';
                    }
                    
                }
            },
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
        $("#formPersonas").trigger("reset");
        $(".modal-header").css("background-color", "#1cc88a");
        $(".modal-header").css("color", "white");
        $(".modal-title").text("Nuevo empleado");            
        $("#modalCRUD").modal("show");     

        ObtenerCargo();
        ObtenerPlanta();

        $("#departamento").prop('disabled', true);
        $("#idjefe").prop('disabled', true);

        $('#id').val(0);
        fila = null;

        $("#btnGuardar").text("Guardar");
    });  

    /*STRART - MODAL - Editar */ 
    $(document).on("click", ".btnEditar", function(){
        
        $("#btnGuardar").text("Modificar");
        
        fila = $(this).closest("tr");

        filaInfo = tablaPersonas.row(fila).data();
        plantaID = filaInfo['FKPlantaID'];

        ObtenerPlanta();
        ObtenerCargo();
        ObtenerDepartamento(plantaID);
        ObtenerJefe(plantaID);
        
        $("#departamento").prop('disabled', false);
        $("#idjefe").prop('disabled', false);
        
        $(".modal-header").css("background-color", "#4e73df");
        $(".modal-header").css("color", "white");
        $(".modal-title").text("Editar empleado");            
        $("#modalCRUD").modal("show");  
    });

    $('#modalCRUD').on('shown.bs.modal', function () {

        if(fila != null)
        {
            filaInfo = tablaPersonas.row(fila).data();

            id = filaInfo['Id'];
            nombre = filaInfo['Nombre'];
            jefe = filaInfo['EmpleadoID_Jefe'];
            correo = filaInfo['Correo'];
            cargoCategoriaID = filaInfo['FKCategoriaCargoID'];
            plantaID = filaInfo['FKPlantaID'];
            departamentoPlantaID = filaInfo['FKDepartamentoPlantaID'];
            estado = parseInt(filaInfo['Estado']);
 
            $("#id").val(id);
            $("#nombre").val(nombre);
            $("#correo").val(correo);
            $('#cargo').val(cargoCategoriaID);
            $('#planta').val(plantaID);
            $('#departamento').val(departamentoPlantaID);

            if(jefe != null)
            {
                $('#idjefe').val(jefe);
            }
            else
            {
                $('#idjefe').val(0);
            }

            $('#estado').prop("checked", estado);
        }
    });
    /*END - MODAL - Editar */ 

    $("#btnCancelar").click(function(){
        $("#formPersonas").trigger("reset");
        $("#modalCRUD").modal("hide");
    })

    /* START: Modal - Inserta nuevos datos a la BD */
    $("#btnGuardar").click(function(){
        
        var id= $('#id').val();
        var nombre= $('#nombre').val();
		var correo= $('#correo').val();
        var cargo= $('#cargo').val();
        var departamento= $('#departamento').val();
        var jefe = $('#idjefe').val();
        var estado = $('#estado').is(':checked');
        
        console.log('id: '+id +' nom:'+ nombre +' email:' + correo +' cargo:' + cargo +' depart:' 
        + departamento +' jefe:' +  jefe +' estado:' + estado);
        $.post("../php/proceso.php",
        {	
            proceso:'save',
            id:id,
            nombre: String(nombre),
            correo: correo,
            cargo: cargo,
            departamento: departamento,
            jefe: jefe,
            estado: estado
        },
        function(data){
            if(data=="guardar")
            {
                tablaPersonas.ajax.reload();
            }else if(data=="modifico") {
                tablaPersonas.ajax.reload();

            } else{
                console.log(data)
                alert("Error al guardar");
            }
            $("#modalCRUD").modal("hide");
        });
    }); 

    /* END: Modal - Inserta nuevos datos a la BD */
    
    $(document).on("click", ".btnDesactivar", function(){    
        fila = $(this).closest("tr");
        filaInfo = tablaPersonas.row(fila).data();

        id = filaInfo['Id'];
        nombre = filaInfo['Nombre'];

        var respuesta = confirm("¿Está seguro de desactivar el registro: "+nombre+"?");
        if(respuesta){
            $.post("../php/proceso.php",
            {	
                proceso:'inactive',
                id:id
            },
            function(data){
                console.log(data);
                if(data=="desactivo")
                {
                    alert("Se desactivo el registro con exito.");
                    tablaPersonas.ajax.reload();;
                }else{
                    alert("Error al desactivar");
                }
            });
        }   
    });

     /*START: Modal - Obtener Plantas */
     function ObtenerPlanta()
     {
         $.post("../php/proceso.php",{
             proceso: 'ObtenerPlantas',
             id: 0,
         }, 
         function(data){
 
             var resArray = JSON.parse(data);
 
             if(resArray[0] == 'error')
             {
                 alert("Error al llenar el select de planta");
             }
             else
             {
                 /* JQUERY - Eliminar todas las opciones del selecte EXCEPTO el primero */
                 $('#planta option:not(:first)').remove();
                 $('#planta').val(0);
 
                 for(key in resArray)
                 {
                     /* Creacion del elemento <option> en html con los id y nombres de la planta*/
                     $('#planta').append($('<option>',{
                         value: resArray[key].PlantaID,
                         text: resArray[key].PlantaNombre
                     }));
                 }
             }
         });
     };
     /*END: Modal - Obtener Plantas */
 
     /*START: Modal - Obtener departamentos */
 
    /* Obtiene el value del select de planta, de esta manera se obtiene la plantaID */
 
     $(document).on("change", "#planta", function(){
         var plantaid = document.getElementById("planta").value;

         if(plantaid != 0)
         {
            $("#departamento").prop('disabled', false);
            $("#idjefe").prop('disabled', false);
            ObtenerDepartamento(plantaid);
            ObtenerJefe(plantaid);
         }
         else
         {
            $("#departamento").prop('disabled', true);
            $("#idjefe").prop('disabled', true);
            $("#departamento").val(0);
            $("#idjefe").val(0);
         }
     });
 
     function ObtenerDepartamento(plantaid)
     {
         $.post("../php/proceso.php",{
             proceso: 'ObtenerDepartamentos',
             filtro: plantaid
         }, 
         function(data){
 
             var resArray = JSON.parse(data);
 
             if(resArray[0] == 'error')
             {
                 alert("Error al llenar el select de departamento");
             }
             else
             {
                 /* JQUERY - Eliminar todas las opciones del selecte EXCEPTO el primero */
                 $('#departamento option:not(:first)').remove();
                 $('#departamento').val(0);
 
                 for(key in resArray)
                 {
                     /* Creacion del elemento <option> en html con los id y nombres del departamento*/
                     $('#departamento').append($('<option>',{
                         value: resArray[key].DepartamentoPlantaID,
                         text: resArray[key].DepartamentoNombre
                     }));
                 }
             }
         });
     };
     /*END: Modal - Obtener departamentos */
 
     /*START: Modal - Obtener cargo */
     function ObtenerCargo()
     {
         $.post("../php/proceso.php",{
             proceso: 'ObtenerCargos'
         }, 
         function(data){
 
             var resArray = JSON.parse(data);
 
             if(resArray[0] == 'error')
             {
                 alert("Error al llenar el select de cargo");
             }
             else
             {
                 /* JQUERY - Eliminar todas las opciones del selecte EXCEPTO el primero */
                 $('#cargo option:not(:first)').remove();
                 $('#cargo').val(0);
 
                 for(key in resArray)
                 {
                     /* Creacion del elemento <option> en html con los id y nombres del cargo*/
                     $('#cargo').append($('<option>',{
                         value: resArray[key].CategoriaCargoID,
                         text: resArray[key].CargoNombre
                     }));
                 }
             }
         });
     };
     /*END: Modal - Obtener cargo */

     /*START: Modal - Obtener Jefe */

     function ObtenerJefe(plantaid)
     {
        $.post("../php/proceso.php",{
            proceso: 'ObtenerJefes',
            PlantaID: plantaid
        }, 
        function(data){

            var resArray = JSON.parse(data);

            if(resArray[0] == 'error')
            {
                alert("Error al llenar el select de jefes");
            }
            else
            {
                $('#idjefe option:not(:first)').remove();
                $('#idjefe').val(0);

                for(key in resArray)
                {
                    $('#idjefe').append($('<option>',{
                        value: resArray[key].EmpleadoID,
                        text: resArray[key].EmpleadoNombre
                    }));
                }
            }
        });
    };
     /*END: Modal - Obtener Jefe */
})
