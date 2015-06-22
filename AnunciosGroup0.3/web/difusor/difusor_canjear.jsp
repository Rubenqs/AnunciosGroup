<%-- 
    Document   : difusor_canjear
    Created on : 25-may-2015, 20:13:11
    Author     : macbookair
--%>

<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/jquery-min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <link rel="stylesheet" href="../css/bootstrap-nav-wizard.css">
        <title>Canjear</title>
    </head>
         <%
            HttpSession session_actual2 = request.getSession(true);
            Anuncio anuncio = (Anuncio) session_actual2.getAttribute("anuncio");
            
         %>
    <body>
        <%@include file="../base_ag/_menu_difusor.jsp" %>
        <%
            DifusorAnunciosDAO difusoranunciosdao = new DifusorAnunciosDAO();
            int puntos = difusoranunciosdao.contartotalpuntos(difusor);
        %>
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation"><a href="difusor_inicio.jsp">Inicio</a></li>
            <li role="presentation"><a href="difusor_perfil.jsp">Perfil</a></li>
            <li role="presentation" class="active"><a href="#">Canjear</a></li>
        </ul>
        
        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">Canjear</a></li>
                
            </ul>
        
            <div id="agregar_anuncio" class="contenido">
                    <div class="workflow" >
                        <ul class="nav nav-wizard">

                            <li class='active'>Paso 1</li>

                            <li>Paso 2</li>

                            <li>Paso 3</li>

                        </ul>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-7">
                            <a href="#">
                                <img class="img-responsive" src="../img/anuncios/<%= anuncio.getImagen_anuncio()%>" width="500px" alt="">
                            </a>
                        </div>
                        <div class="col-md-5">
                            <h3> <%= anuncio.getNombre_anuncio()%></h3>
                            <h4><%= anuncio.getNombre_u_anunciante()%></h4>
                            <p><%= anuncio.getDescripcion_anuncio()%></p>
                            <hr>
                        </div>
                        
                        <div class="col-md-5">
                            <h3>Maximo descuento: <%= anuncio.getPorcentaje_descuento() %> %</h3>
                            <input type="hidden" id ="max_descuento" value="<%= anuncio.getPorcentaje_descuento() %>">
                            <h4>Tu puntos disponibles: <%= puntos %> </h4>
                            <input type="hidden" id="max_puntos" value="<%= puntos %>">
                            <h4>Puntos a utilizar:</h4> <input type="number" id="descuento" min="0" max="<%= puntos %>" onkeypress="return solonumeros(event);" value="0"> <input  onclick="Maxpuntos();" type="button" value="Calcular descuento">
                            <hr>
                            <h4>Valor real: $<%= anuncio.getValor_real() %></h4>
                            <input type="hidden" id="valor_real"  value="<%= anuncio.getValor_real() %>">
                            
                            <h4>Descuento obtenido:<span id="valor_descuento" disabled="true" > </span></h4>
                            <h4>Valor final:<span id="valor_final" disabled="true" > </span></h4>
                        </div>
                    </div>
                    <hr>
                    <a href="difusor_canjear2.jsp" id="boton" class="btn btn-primary" >Siguiente</a>
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %> 
        
        
        
        
        
        
        
        <script>
               function solonumeros(e)
            {   
                Maxpuntos();
                var keynum = window.event ? window.event.keyCode : e.which;
                if ((keynum === 8) || (keynum === 46))
                return true;
                return /\d/.test(String.fromCharCode(keynum));
                
            }

            function ObtenerDescuento(){
                var valor_real = $('#valor_real').val();
                var descuento=  $('#descuento').val() * 40;
                var total = ((descuento * 100) / valor_real);
                var maximo_descuento = $('#max_descuento').val();
                var valor_final = valor_real -((valor_real * total)/100); 
                if(total <= maximo_descuento ){
                    $('#valor_descuento').text(total+"%");
                    $('#valor_final').text(valor_final);
                }else{
                    alert("La cantidad de puntos seleccionados excede al maximo de descuento permitido.");
                    $('#descuento').val("0");
                    $('#valor_descuento').text("0"+"%");
                };
            }
            
            function Maxpuntos(){
                var puntos=  $('#descuento').val();
                var max_puntos= $('#max_puntos').val();
                
                if(puntos > max_puntos){
                    alert("Los puntos seleccionados no pueden ser mayor a los puntos que se posen.");
                    $('#descuento').val("0");
                }else{
                    ObtenerDescuento();
                }
            }
            
        </script>
     
        

    </body>
</html>
