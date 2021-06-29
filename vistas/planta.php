<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Planta</title>

    <script src="/HanesTalentManagement/bootstrap/jquery/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../bootstrap/css/customStyles.css">
    <link rel="stylesheet" href="/HanesTalentManagement/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/HanesTalentManagement/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/HanesTalentManagement/bootstrap/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/HanesTalentManagement/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/HanesTalentManagement/bootstrap/css/customStyles.css">

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="/HanesTalentManagement/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<?php include '../php/header.php' ?>
    <div class="container">
        <br>
        <br>
        
        <div class="col table-container">
            <table id="tablaPlanta" class="table table-striped table-bordered"></table>
        </div>

    </div>

    <!--START: Modal para CRUD-->
    <div class="modal fade" id="modalCRUD" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                </div>
                <form id="formPlantas">
                    <div class="modal-body">
                        <input type="hidden" id="id">

                        <div class="form-group">
                            <label>Nombre de planta</label>
                            <input type="text" class="form-control" id="planta" placeholder="Ingrese el nombre de la planta">
                        </div>

                        <div class="form-group">
                            <label>Pais</label>
                            <select class="form-control" id="pais">
                                <option value="0">--Selecione un pais--</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <br>
                            <label>Estado</label>
                            <input type="hidden" id="estadoHidden" value="0">
                            <input type="checkbox" id="estado" value="1">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group">
                            <button type="button" id="btnCancelar" class="btn btn-light" data-dismiss="modal">Cancelar</button>
                            <button type="button" id="btnGuardar" class="btn btn-dark">Boton</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--END: Modal para CRUD-->

    

    <link rel="stylesheet" type="text/css" href="../datatable/datatables.min.css">
    <script type="text/javascript" src="../datatable/datatables.min.js"></script>
    <script src="../Funcionesjs/funcionPlanta.js"></script>
</body>
</html>