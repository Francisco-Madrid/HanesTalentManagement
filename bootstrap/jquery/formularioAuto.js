$(document).on('ready', function()
{
  console.log("Rev 2019-05-23 1");
  
  var url = "";
   $('#campo1').val("Estado : En espera....");
    imprime();




  $("#boton1").click(function()
  {
      imprime();
       //obtenerDatos();
       //google.maps.event.addDomListener(window, 'load', initMap);       
  });



 function openpdf(pdfruta,title,izquierda)
 {
     var w = 700, // width of your block
       h = 500, // height of your block
       l = (screen.width - w)/2, // block left position
       t = (screen.height -h)/2; //block top position
       if(izquierda==0)
         izquierda=l;

     //window.open(pdfruta,title,'height=' + h + ',width=' + w + ',top=' + t + ',left=' + izquierda);
     window.open(pdfruta,title,"toolbar=yes,scrollbars=yes,resizable=yes,left="+izquierda+",width="+w+",height="+h);
//      "toolbar=yes,scrollbars=yes,resizable=yes,left=800,width=400,height=400"
  } 


    function imprime()
    {
      // guardarImagen();
        $('#boton1').prop('disabled', true);

         $('#campo1').val("Estado : cargando....");

          var c= $('#campoSol').val(); 


              var proceso="AUTO";
             var base="CREDISOL_OPDF";

                  $.ajax({
                     beforeSend: function(){
                        loadin(1);
                         //$(#status).spin({radius:3, width:2, heigth:2, length:4})
                  },
                  url: url+'php_pdo/print2.php',
                  type: 'POST',
                  data: {x1:c,x2:base,pro:proceso},
                  dataType: false,
                  success: function (resp) {
                    console.log("res:"+resp);
                    var urls=resp.split("<br>");
                    console.log("_"+urls[0].trim()+"_");
                  if(urls[0].trim()=="NADA")
                  {
                      $.notify({
                          title: '<strong>Error !!</strong>',
                          message: 'Solicitud no existe..'
                      },{
                          type: 'danger'
                      });
                      $('#campo1').val("Estado :No Existe Solicitud!");  

                  }else if(urls[0].trim()=="NADA_FOTOS")
                  { 
                    $.notify({
                          title: '<strong>Error !!</strong>',
                          message: 'Falta sincronizar las fotos..'
                      },{
                          type: 'danger'
                      });
                     $.notify({
                          title: '<strong>Error !!</strong>',
                          message: 'Necesita sincronizar las fotos para poder generar..'
                      },{
                          type: 'warning'
                      });

                      $('#campo1').val("Estado :Faltan las fotos!");                      
                  }else
                  {

                    var tempo=urls[0].trim().split("XXX");
                    if(tempo.length>1)
                    {
                     
                      openpdf(url+"php_pdo/Salida Reportes/"+tempo[1].trim(),"FOTOS_APP",800);
                      openpdf(url+"php_pdo/Salida Reportes/"+tempo[0].trim(),"todo",20);
                      console.log("_"+urls[0].trim()+"_\n");  
                    }else{
                      openpdf(url+"php_pdo/Salida Reportes/"+tempo[0].trim(),"todo",0);
                    }

                    
                      $('#campo1').val("Estado : Listo!");
                  }
                    //openpdf(urls[0]);
                   // openpdf(urls[1]);

                  },
                  error: function (jqXHR, estado, error){
                      console.log('err1 '+jqXHR);
                      console.log('x1 '+estado)
                      console.log('x2 '+error)
                      $('#campo1').val("*timeout* Reintentar..");
                      //imprime();
                    	
                  },
                  complete: function (jqXHR, estado){
                    //  console.log('Complete '+JSON.stringify(jqXHR));
                      loadin(0);
                      $('#boton1').prop('disabled', false);
                  },
                  timeout: 60000
              })


    }

    function loadin(estado) {
      console.log("loadin "+estado);
      // body...
      if(estado==0)
      {// document.getElementById('dvLoading').style.visibility="hidden";
        document.getElementById('dvLoading').style.visibility="hidden";
      }else
      {  //document.getElementById('dvLoading').style.visibility="visible";
         document.getElementById('dvLoading').style.visibility="visible";
      }

  }

  
})

	



