<%-- 
    Document   : altaHotel
    Created on : 22-sep-2015, 16:33:58
    Author     : sergi.soriano.bial
--%>
<%
    session=request.getSession();
    if (session.getAttribute("user") == null)
    {
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dar de alta un hotel - Perry Mason & Co.</title>
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
                            <li><a href="index.jsp">Inicio</a></li>
                            <li><a href="altaVuelo.jsp">Alta vuelo</a></li>
                            <li class="current"><a href="altaHotel.jsp">Alta hotel</a></li>
                            <li><a href="buscarVuelo.jsp">Busca vuelo</a></li>
                            <li><a href="buscarHotel.jsp">Busca hotel</a></li>
                        </ul>
                    </nav>
                </header>
            </div>
            <div id="main-wrapper">
                <div class="container">
                    <div id="content">
                        <form id="formAltaHotel"  method="post" action="altaHotel">
                            <table>
                                <tr>
                                    <th>Nombre del hotel</th>
                                    <td><input id="nameHotel" name="nameHotel" maxlength="50" required autofocus/></td>
                                    <th>Cadena hotelera</th>
                                    <td><input id="cadenaHotel" name="cadenaHotel" maxlength="50" required /></td>
                                </tr>
                                <tr>
                                    <th>Número habitaciones</th>
                                    <td><input type="number" min="0" id="numHabHotel" name="numHabHotel" required /></td>
                                </tr>
                                <tr>
                                    <td colspan="4">Dirección<hr /><td>
                                </tr>
                                <tr>
                                    <th>Calle</th>
                                    <td><input id="calleHotel" name="calleHotel" maxlength="50" required/></td>
                                    <th>Número</th>
                                    <td><input type="number" min="0" id="numHotel" name="numHotel" maxlength="50" required/></td>
                                </tr>
                                <tr>
                                    <th>Código postal</th>
                                    <td><input id="cpHotel" name="cpHotel" maxlength="50" required /></td>
                                    <th>Ciudad</th>
                                    <td><input id="ciudadHotel" name="ciudadHotel" maxlength="50" required /></td>
                                </tr>
                                <tr>
                                    <th>Provincia</th>
                                    <td><input id="provinciaHotel" name="provinciaHotel" maxlength="50" required /></td>
                                    <th>Pais</th>
                                    <td><input id="paisHotel" name="paisHotel" maxlength="50" required /></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><button type="submit" >Añadir hotel</button></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
