$(document).ready(function(){

    tablaPlantas = $("#tablaPlanta").DataTable({
        "dom": '<"toolbar">frtip',
        "order": [[1, "asc"]],
        "ajax":{
            "url": "../php/procesoPlanta.php",
            "method": 'POST',
            "data": {proceso: 'llenar'},
            "dataSrc":""
        },
        columns:[
            {"data":"PlantaID", "title": "Id" },
            {"data":"PlantaNombre", "title": "Planta" },
            {"data":"PaisNombre", "title": "Pais" },
            {"data":"Estado", "title": "Estao" },
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
        $("#formPlantas").trigger("reset");
        $(".modal-header").css("background-color", "#1cc88a");
        $(".modal-header").css("color", "white");
        $(".modal-title").text("Nueva planta");            
        $("#modalCRUD").modal("show");     

        ObtenerPais();

        $('#id').val(0);
        fila = null;

        $("#btnGuardar").text("Guardar");
    });  

    $("#btnCancelar").click(function(){
        $("#formPlantas").trigger("reset");
        $("#modalCRUD").modal("hide");
    })

    $("#btnGuardar").click(function(){
        var id = $('#id').val();
        var plantaNombre = $('#planta').val();
        var paisID = $('#pais').val();
        var estado = $('#estado').is(':checked');

        $.post("../php/procesoPlanta.php",{
            proceso: 'save',
            id: id,
            plantaNombre: String(plantaNombre),
            paisID: paisID,
            estado: estado
        },
        function(data)
        {
            if(data == 'success')
            {
                console.log("Save success");
                tablaPlantas.ajax.reload();
            }
            else if(data == 'modifico')
            {
                console.log("Se actualizo el registro con exito");
                tablaPlantas.ajax.reload();
            }
            else
            {
                console.log('Error al guardar');

            }
            
            $("#modalCRUD").modal("hide");
        });
    });

    $(document).on("click", ".btnEditar", function(){
        $("#btnGuardar").text("Modificar");
        
        fila = $(this).closest("tr");

        filaInfo = tablaPlantas.row(fila).data();

        ObtenerPais();

        $(".modal-header").css("background-color", "#4e73df");
        $(".modal-header").css("color", "white");
        $(".modal-title").text("Editar planta");            
        $("#modalCRUD").modal("show");  
    });

    $('#modalCRUD').on('shown.bs.modal', function(){
        if(fila != null)
        {
            filaInfo = tablaPlantas.row(fila).data();
            
            id = filaInfo['PlantaID'];
            planta_Nombre = filaInfo['PlantaNombre'];
            pais_ID = filaInfo['PaisID'];
            estado = parseInt(filaInfo['Estado']);

            $("#id").val(id);
            $('#planta').val(planta_Nombre);
            $('#pais').val(pais_ID);
            $('#estado').prop("checked", estado);
            
        }
    });

    function ObtenerPais()
    {
        $.post("../php/procesoPlanta.php",{
            proceso: 'ObtenerPaises'
        },
        function(data){
            var resArray = JSON.parse(data);

            if(resArray[0] == 'error')
            {
                console.log("Error al llenar el select de pais");
            }
            else
            {
                $('#pais option:not(:first)').remove();

                for(key in resArray)
                {

                    $('#pais').append($('<option>',{
                        value: resArray[key].PaisID,
                        text: resArray[key].PaisNombre
                    }));
                }
            }
        });
    }
})

