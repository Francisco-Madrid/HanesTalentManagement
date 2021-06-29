$(document).on('ready', function()
{
  console.log("Rev 2019-03-21 0");
  
  var url = "credisol_business/financiero/";
      $('#campo1').val("Estado : En espera....");
    //console.log('...')
    //imprime();
    console.log("formaulario credisol opdf");
    try{

      google.maps.event.addDomListener(window, 'load', initMap);
    }catch(err)
    {
      console.log("recargando mapa..");
      try{
        google.maps.event.addDomListener(window, 'load', initMap);
      }catch(er)
      {
      console.log("no se cargo mapa..");
      }
    }


var marker;
/*
function initMap() {
  var map = new google.maps.Map(document.getElementById('googleMap'), {
    zoom: 17,
    center: {lat: latitud, lng: longitud}
  });

  marker = new google.maps.Marker({
    map: map,
    draggable: true,
    animation: google.maps.Animation.DROP,
    position: {lat: latitud, lng: longitud}
  });
  marker.addListener('click', toggleBounce);
}*/

var geocoder;// = new google.maps.Geocoder;
  var infowindow;// = new google.maps.InfoWindow;

function initMap() {

  var map;

try
{
   geocoder = new google.maps.Geocoder;
    infowindow = new google.maps.InfoWindow;

     map = new google.maps.Map(document.getElementById('googleMap'), {
      zoom: 8,
      center: {lat: latitud, lng: longitud}
    });




/*
    document.getElementById('boton2').addEventListener('click', function() {
       
      
       //imprime();
         //obtenerDatos();
         var c= $('#campoSol').val(); 
         console.log("buscando:"+c);
          $.ajax({
                 beforeSend: function(){
                  //$(#status).spin({radius:3, width:2, heigth:2, length:4})
                 },
                 url: url+'php_pdo/form.php',
                 type: 'POST',
                 data: {x:c},
                 dataType: 'json',
                 success: function (data) {
                  
                  var da=data.split("__");

                  console.log("(("+da[0]+","+da[1]+"))");
                  geocodeLatLng(geocoder, map, infowindow,da[0],da[1]);

                  //$("#nomb").val(da[2]);
                   document.getElementById("nomb").innerHTML  = "CLIENTE: "+da[2]+" &nbsp&nbsp&nbsp SOLICITUD: "+$('#campoSol').val();
                  document.getElementById("eti").innerHTML  = "DIRECCION: "+da[3];

                 },
                 error: function (jqXHR, estado, error){
                  console.log(jqXHR);
                  console.log(error);

                 
                 },
                 complete: function (jqXHR, estado){
                  console.log(estado);
                 
                 
                 }
              })


       
    });

*/
}catch(err){
  
}
  

}

function Ubicar() {
  // body...

       geocoder = new google.maps.Geocoder;
    infowindow = new google.maps.InfoWindow;

     map = new google.maps.Map(document.getElementById('googleMap'), {
      zoom: 8,
      center: {lat: latitud, lng: longitud}
    });

       //imprime();
         //obtenerDatos();
         var c= $('#campoSol').val(); 
         console.log("buscando:"+c);
          $.ajax({
                 beforeSend: function(){
                  //$(#status).spin({radius:3, width:2, heigth:2, length:4})
                 },
                 url: url+'php_pdo/form.php',
                 type: 'POST',
                 data: {x:c},
                 dataType: 'json',
                 success: function (data) {
                  
                  var da=data.split("__");

                  console.log("(("+da[0]+","+da[1]+"))");
                  geocodeLatLng(geocoder, map, infowindow,da[0],da[1]);

                  //$("#nomb").val(da[2]);
                   document.getElementById("nomb").innerHTML  = "CLIENTE: "+da[2]+" &nbsp&nbsp&nbsp SOLICITUD: "+$('#campoSol').val();
                  document.getElementById("eti").innerHTML  = "DIRECCION: "+da[3];

                 },
                 error: function (jqXHR, estado, error){
                  console.log(jqXHR);
                  console.log(error);

                 
                 },
                 complete: function (jqXHR, estado){
                  console.log(estado);
                 
                 
                 }
              })


}


function geocodeLatLng(geocoder, map, infowindow,lat,long) {
  console.log("generando:"+lat+","+long);
  //var input = document.getElementById('latlng').value;
  //var latlngStr = input.split(',', 2);
  var latlng = {lat: parseFloat(lat), lng: parseFloat(long)};
  var myCenter = new google.maps.LatLng(parseFloat(lat),parseFloat(long));
  geocoder.geocode({'location': myCenter/*latlng*/}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      if (results[1]) {
       /* map.setZoom(17); 
        var image = url+'jquery/punto.png';
      
       var marker = new google.maps.Marker({
         position: latlng,
        //  center: latlng,
          map: map,
          visible: false,
           //icon: 'http://google-maps-icons.googlecode.com/files/administration.png'
          icon: image
        });
    */
        var mapCanvas = document.getElementById("googleMap");
        var mapOptions = {center: myCenter, zoom: 17};
        var map = new google.maps.Map(mapCanvas, mapOptions);

        marker = new google.maps.Marker({position:myCenter});
        marker.setMap(map);

        var string="<div id='contenido'><img src='"+url+"jquery/casa.png'></img>  </div>";

       // infowindow.setContent(string/*results[1].formatted_address*/);
       // infowindow.open(map, marker);
        
        document.getElementById("eti2").innerHTML  = "GEOREFERENCIA: "+results[1].formatted_address+" / "+results[0].formatted_address;
     
  


      } else {
        console.log('google No results found');
              document.getElementById("eti2").innerHTML  = "No se encuentra la direccion";
      }
    } else {
      console.log('google Geocoder failed due to: ' + status);
      document.getElementById("eti2").innerHTML  = "No hay resultados de google";
    }
  });
}
function toggleBounce() {
  if (marker.getAnimation() !== null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
  }
}

var  latitud=14.4041703;
var  longitud=-86.7056069;

      $(".modal-wide").on("show.bs.modal", function() {
      var height = $(window).height() - 200;
      $(this).find(".modal").css("max-height", height);
    });

   $('#formX').submit(function( event ) {
        event.preventDefault();

       var tabla=$('#table1').bootstrapTable('getSelections');
        var x = JSON.stringify(tabla);
        if(x=="[]")
        {
          $.notify({
          title: '<strong>Atencion !!</strong>',
          message: ' Seleccione una solicitud.'
          },{
          type: 'warning'
          });
          return;
        }

         $.each(tabla,function(index,item) {
          //console.log ("<option value='"+item.c1+"' data-tokens='"+x.c2+"'>"+x.c3+"</option>");
            $('#campoSol').val(item.c1);  
          });
        

         $('#modal').modal('hide');
          
          Ubicar();
        
    });

  $("#bt1").click(function()
  {
      $('#modal').modal('hide');   
  });

  $("#boton1").click(function()
  {
      imprime();
       //obtenerDatos();
       //google.maps.event.addDomListener(window, 'load', initMap);       
  });

    $("#boton4").click(function()
    {
       cargar();

        $('#modal').modal('show'); 
       

    });

    function cargar(){

    $.ajax({
      beforeSend: function(){
        //$(#status).spin({radius:3, width:2, heigth:2, length:4})
      },
      url: url+'php_pdo/solicitudes.php',
      type: 'POST',
      data: {x:'4'},
      dataType: false,
      success: function (resp) {
        llenarTabla(resp);
       // console.log(resp);
      },
      error: function (jqXHR, estado, error){
      },
      complete: function (jqXHR, estado){
      },
      timeout: 10000
    })
  }

  function llenarTabla(json) {
    var $table = $('#table1');
    var x = JSON.stringify(json);
    $table.bootstrapTable('load', json);
  }

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
         $('#campo1').val("Estado : cargando....");

              var c= $('#campoSol').val(); 

             var base="CREDISOL_OPDF";

                  $.ajax({
                     beforeSend: function(){
                        loadin(1);
                         //$(#status).spin({radius:3, width:2, heigth:2, length:4})
                  },
                  url: url+'php_pdo/print2.php',
                  type: 'POST',
                  data: {x1:c,x2:base},
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

	



