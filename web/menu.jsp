<%-- 
    Document   : menu
    Created on : 29-sep-2015, 16:59:58
    Author     : Santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("user") == null) response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Perry Mason & Co. - Agencia de Viajes</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <LINK REL=StyleSheet HREF="CSS/styles.css" TYPE="text/css" >
        <script src="JS/jquery.min.js"></script>
        <script src="JS/jquery.dropotron.min.js"></script>
        <script src="JS/skel.min.js"></script>
        <script src="JS/util.js"></script>
        <script src="JS/main.js"></script>


    </head>
    <body class="homepage">
        <div id="page-wrapper">
            <!-- Header -->
            <div id="header-wrapper">
                <header id="header" class="container">
                    <!-- Logo -->
                    <div id="logo">
                        <h1><a href="index.jsp">Perry Mason</a></h1>
                        <span>Hola <%=session.getAttribute("user") %>, (<a href="logout.jsp">Cerrar sesión</a>) </span>
                    </div>
                    <!-- Nav -->
                    <nav id="nav">
                        <ul>
                            <li class="current"><a href="index.jsp">Inicio</a></li>
                            <li>
                                <a href="">Vuelo</a>
                                <ul>
                                    <li><a href="altaVuelo.jsp">Insertar vuelo</a></li>
                                    <li><a href="buscarVuelo.jsp">Consultar vuelo</a></li>
                                    <li><a href="LibresVuelos.jsp">Consultar plazas</a></li>
                                    <li><a href="ReservarVuelo.jsp">Reservar plazas</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="">Hotel</a>
                                <ul>
                                    <li><a href="altaHotel.jsp">Insertar hotel</a></li>
                                    <li><a href="buscarHotel.jsp">Consultar hotel</a></li>
                                    <li ><a href="LibresHotel.jsp">Consultar habitaciones</a></li>
                                    <li><a href="ReservarHotel.jsp">Reservar habitaciones</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </header>
            </div>
            <div id="main-wrapper">
                <div class="container">
                    <div id="content">
                        
                    </div>
                </div>        
            </div>
        </div>
    </body>
</html>

