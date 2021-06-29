$(document).ready(function(){
    tablaCargo = $("#tablaCargo").DataTable({
        "dom": '<"toolbar">frtip',
        "order": [[1, "asc"]],
        "ajax":{
            "url": "../php/procesoCargo.php",
            "method": 'POST',
            "data": {proceso: 'llenar'},
            "dataSrc":""
        },
        columns:[
            {"data":"CargoID", "title": "Id" },
            {"data":"CargoNombre", "title": "Cargo" },
            {"data":"CargoDescripcion", "title": "Descripcion" },
            {"data":"CategoriaNombre", "title": "Categoria" },
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
        $("#formCargo").trigger("reset");
        $(".modal-header").css("background-color", "#1cc88a");
        $(".modal-header").css("color", "white");
        $(".modal-title").text("Nuevo departamento");            
        $("#modalCRUD").modal("show");     

        ObtenerCategoria();

        $('#id').val(0);
        fila = null;

        $("#btnGuardar").text("Guardar");
    });  

    $("#btnCancelar").click(function(){
        $("#formPlantas").trigger("reset");
        $("#modalCRUD").modal("hide");
    });

    $("#btnGuardar").click(function(){

        var CategoriaCargoID = $('#id').val();
        var cargoNombre = $('#cargo').val();
        var cargoDescripcion = $("#cargoDescripcion").val();

        var CategoriaID = $("#categoria").val();
        var CargoID = 0;

        if(CategoriaCargoID != 0)
        {
            filaInfo = tablaCargo.row(fila).data();

            CargoID = filaInfo['CargoID'];
        }

        $.post("../php/procesoCargo.php",{
            proceso: 'save',
            CategoriaCargoID: CategoriaCargoID,
            cargoNombre: cargoNombre,
            cargoDescripcion: cargoDescripcion,

            CategoriaID: CategoriaID,
            CargoID: CargoID
        },
        function(data)
        {
            if(data == 'guardo')
            {
                console.log("Save success");
                tablaCargo.ajax.reload();
            }
            else if(data == 'modifico')
            {
                console.log("Se actualizo el registro con exito");
                tablaCargo.ajax.reload();
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

        ObtenerCategoria();

        $(".modal-header").css("background-color", "#4e73df");
        $(".modal-header").css("color", "white");
        $(".modal-title").text("Editar planta");            
        $("#modalCRUD").modal("show");  
    });

    $('#modalCRUD').on('shown.bs.modal', function(){
        if(fila != null)
        {
            filaInfo = tablaCargo.row(fila).data();
            
            idCargo = filaInfo['CargoID'];
            idCategoriaCargo = filaInfo['CategoriaCargoID'];
            idCategorio = filaInfo['CategoriaID'];

            cargoNombre = filaInfo['CargoNombre'];
            cargoDescripcion = filaInfo['CargoDescripcion'];


            $("#id").val(idCategoriaCargo);
            $("#cargo").val(cargoNombre);
            $("#cargoDescripcion").val(cargoDescripcion);
            $("#categoria").val(idCategorio);
        }
    });


    function ObtenerCategoria()
    {
        $.post("../php/procesoCargo.php",{
            proceso: 'ObtenerCategorias'
        },
        function(data){
            var resArray = JSON.parse(data);

            if(resArray[0] == 'error')
            {
                console.log("Error al llenar el select de categoria");
            }
            else
            {
                $('#categoria option:not(:first)').remove();

                for(key in resArray)
                {

                    $('#categoria').append($('<option>',{
                        value: resArray[key].CategoriaID,
                        text: resArray[key].CategoriaNombre
                    }));
                }
            }
        });
    }
});