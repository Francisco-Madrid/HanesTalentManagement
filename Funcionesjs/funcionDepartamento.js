$(document).ready(function(){
    tablaDepartamento = $("#tablaDepartamento").DataTable({
        "dom": '<"toolbar">frtip',
        "order": [[1, "asc"]],
        "ajax":{
            "url": "../php/procesoDepartamento.php",
            "method": 'POST',
            "data": {proceso: 'llenar'},
            "dataSrc":""
        },
        columns:[
            {"data":"DepartamentoID", "title": "Id" },
            {"data":"DepartamentoNombre", "title": "Departamento" },
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
        $("#formDepartamentos").trigger("reset");
        $(".modal-header").css("background-color", "#1cc88a");
        $(".modal-header").css("color", "white");
        $(".modal-title").text("Nuevo departamento");            
        $("#modalCRUD").modal("show");     

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
        var departamento = $('#departamento').val();

        $.post("../php/procesoDepartamento.php",{
            proceso: 'save',
            id: id,
            departamento: departamento
        },
            function(data){
                if(data == 'guardo')
                {
                    console.log("save success");
                    tablaDepartamento.ajax.reload();
                }
                else if(data == 'modifico')
                {
                    console.log("Se modifico con exito el registro");
                    tablaDepartamento.ajax.reload();
                }
                else
                {
                    console.log("Error al guardar");
                }

                $("#modalCRUD").modal("hide");
            });
    });

    $(document).on("click", ".btnEditar", function(){
        $("#btnGuardar").text("Modificar");
        
        fila = $(this).closest("tr");

        filaInfo = tablaDepartamento.row(fila).data();

        $(".modal-header").css("background-color", "#4e73df");
        $(".modal-header").css("color", "white");
        $(".modal-title").text("Editar planta");            
        $("#modalCRUD").modal("show");  
    });

    $('#modalCRUD').on('shown.bs.modal', function(){
        if(fila != null)
        {
            filaInfo = tablaDepartamento.row(fila).data();
            
            id = filaInfo['DepartamentoID'];
            departamento_nombre = filaInfo['DepartamentoNombre'];

            $("#id").val(id);
            $('#departamento').val(departamento_nombre);

            console.log(id);
        }
    });
})