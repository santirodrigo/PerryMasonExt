<%-- 
    Document   : logout.jsp
    Created on : 29-sep-2015, 15:39:54
    Author     : Santi
--%>

<%@page import="ADServlets.login"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sesión cerrada</title>
    </head>
    <body class="homepage">
        <div id="page-wrapper">
            <!-- Header -->
            <div id="header-wrapper">
                <header id="header" class="container">
                    <!-- Logo -->
                    <div id="logo">
                        <h1><a href="index.jsp">Perry Mason</a></h1>
                        
                    </div>
                    <!-- Nav -->
                    <!--<nav id="nav">
                        <ul>
                            <li class="current"><a href="index.jsp">Inicio</a></li>
                            <li><a href="altaVuelo.jsp">Alta vuelo</a></li>
                            <li><a href="altaHotel.jsp">Alta hotel</a></li>
                            <li><a href="buscarVuelo.jsp">Busca vuelo</a></li>
                            <li><a href="buscarHotel.jsp">Busca hotel</a></li>
                        </ul>
                    </nav>-->
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

    <body>
        <h1>Perry Mason & Co</h1>
        <h2>Sesión cerrada</h2>
        <%  if (session.getAttribute("user") == null) response.sendRedirect("login.jsp");
            else session.setAttribute("user", null);%>
        <h1>Se ha cerrado tu sesión correctamente</h1>
        <a href="login.jsp">Volver a iniciar sesión</a>
    </body>
</html>
