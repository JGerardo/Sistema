// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require autocomplete-rails
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
$(document).ready(function(){

});

$(document).on('page:load', function() {  
  //ocultarDatosCliente(); 
  $('#clavelibro').on("change",function() {
    //pasar a cantidad
    $("#cantidadlibro").focus();

  });

  $('#cantidadlibro').on("keypress",function(event) {
    //buscar el libro por isbn y agregarlo
    if ( event.which == 13)
    {
      //agregaOrden($('#clavelibro').val());
      //alert("Hemos presionado un enter");
      agregaLibro($('#clavelibro').val());  
    }
  });

  $("#guardarVenta").on("click", function(){
    //enviar formulario
    event.preventDefault();
    $("#new_sale").submit();
  });

  $('#client_nombre').on('railsAutocomplete.select', function(event, data){
  //poner valores en input requeridos con datos del cliente
    $("#client_id").val(data.item.id);
    $("#sale_client_id").val(data.item.id);
  });

  //prevenir que puedan quedarse datos del cliente
  $('#client_nombre').on("keypress",function(event) {
    if($(this).val() == "")
     {
      $("#client_id").val("");
      $("#sale_client_id").val("");
     }
  });
});


function agregaLibro(isbn){
  var index = $(".idLibroVender").length;

  //alert("Codigo"+index);

  if(isbn == "" || isbn == NaN)
  {
    alert("ingrese el código del libro.");
    $("#cantidadlibro").val(1);
    $('#clavelibro').focus();
    return;
  }

  $.ajax({
    dataType: "json",
    url: "http://localhost:3000/books/find.json?isbn=" + isbn
  })
  .done(function(data) {
      if(data.id == null){
        alert("No se encontró el libro.");
        resetAgregaLibro();
        return;
      }
      //80precio/100*20%      
      var descuento = ((data.precio / 100) * $("#descuentolibro").val());
      var totaldescuento = (descuento * $("#cantidadlibro").val());

      alert("El descuento es de: "+ descuento);

      //armar el nuevo producto a agregar
        alert("Datos del libro:" + data.id + " Codigo: " + data.codigo);
          //var nuevoLibro = "<tr><td><input class=\"idLibroVender\" id=\"sale_saleDetails_attributes_0_product_id\" name=\"sale[saleDetails_attributes]["+index+"][product_id]\" readonly=\"readonly\" type=\"text\" value=\"" + data.id + "\"></td><td><input type=\"text\" id=\"nombreProducto\" readonly=\"readonly\" value=\"" + data.nombre+"\"></td> <td><input id=\"sale_saleDetails_attributes_0_preciounitario\" name=\"sale[saleDetails_attributes]["+index+"][preciounitario]\" readonly=\"readonly\" type=\"text\" value=\"" + data.precio + "\"></td><td><input class=\"cantidadVender\" id=\"sale_saleDetails_attributes_0_cantidad\" name=\"sale[saleDetails_attributes]["+index+"][cantidad]\" readonly=\"readonly\" type=\"text\" value=\"" + $("#cantidadlibro").val() + "\"></td><td><input class=\"importeProducto\" id=\"sale_saleDetails_attributes_0_importe\" name=\"sale[saleDetails_attributes]["+index+"][importe]\" readonly=\"readonly\" type=\"text\" value=\"" + (data.precio * $("#cantidadlibro").val()) + "\"></td></tr>";       
            var nuevoLibro ="<tr><td><input class=\"idLibroVender\" id=\"sale_saleDetails_attributes_0_book_id\" name=\"sale[saleDetails_attributes] ["+index+"][book_id]\" readonly=\"readonly\" type=\"text\" value=\"" + data.id  +"\"></td>      <td><input type=\"text\" id=\"nombreProducto\" value=\"" + data.titulo+ "readonly=\"readonly\"></td>        <td><input class=\"cantidadLibro\" id=\"sale_saleDetails_attributes_0_cantidad\" name=\"sale[saleDetails_attributes]["+index+"][cantidad]\" readonly=\"readonly\" type=\"text\" value=\"" + $("#cantidadlibro").val() + "\" ></td> <td><input class=\"precioLibro\" id=\"sale_saleDetails_attributes_0_preciounitario\" name=\"sale[saleDetails_attributes] ["+index+"][preciounitario]\" readonly=\"readonly\" type=\"text\" value=\"" + data.precio + "\"></td>  <td><input class=\"descuentoProducto\" id=\"sale_saleDetails_descuentoProducto\" name=\"sale[saleDetails]["+index+"][descuentoProducto]\" readonly=\"readonly\" type=\"text\" value=\"" + ((data.precio / 100) * $("#descuentolibro").val()) + "\"></td>  <td><input class=\"importeTotal\" id=\"sale_detailsale_attributes_0_importe\" name=\"sale[saleDetails]["+index+"][importe]\" readonly=\"readonly\" type=\"text\" value=\"" + ((data.precio * $("#cantidadlibro").val()) - (totaldescuento)) + "\"></td> </tr>";
       alert(nuevoLibro);
        $("#detallesVentaTable tbody").append(nuevoLibro);
        resetAgregaLibro();
        calculaTotales();
      }).fail(function(){
        resetAgregaLibro();
    });
  }
  function resetAgregaLibro(){
    $("#cantidadlibro").val(1);
    $('#clavelibro').val("");
    $('#clavelibro').focus();
    $('#descuentolibro').val(0);
  }

  function calculaTotales(){
    var productos = 0;
    var descuento = 0;
    var importeTotal = 0;
    $(".cantidadVender").each(function(index){
      producto += parseInt($(this).val());
    });

    $(".importeProducto").each(function(index){
      importeTotal += parseFloat($(this).val());
    });

    $("#totalArts").html(productos);
    $("#importeTotalVenta").html(formatCurrency(importeTotal));

  }

  //funcion tomada de http://selfcontained.us/2008/04/22/format-currency-in-javascript-simplified/
  function formatCurrency(num) {
    num = isNaN(num) || num === '' || num === null ? 0.00 : num;
    return "$ "+parseFloat(num).toFixed(2);
}

  function validaNumeros() {
 if ((event.keyCode < 48) || (event.keyCode > 57)) 
  event.returnValue = false;
}
