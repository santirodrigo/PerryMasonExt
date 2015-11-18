<%-- 
    Document   : ReservarVuelo
    Created on : 17-nov-2015, 16:54:13
    Author     : Santi
--%>

<%
    if (session.getAttribute("user") == null) response.sendRedirect("login.jsp");
%>

<html>
    <head>
        <title>Dar de alta un vuelo - Perry Mason & Co.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <LINK REL=StyleSheet HREF="CSS/styles.css" TYPE="text/css" >
        <script src="JS/jquery.min.js"></script>
        <script src="JS/jquery.dropotron.min.js"></script>
        <script src="JS/skel.min.js"></script>
        <script src="JS/util.js"></script>
        <script src="JS/main.js"></script>
    </head>
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
                        <span>Hola <%=session.getAttribute("user") %>, (<a href="logout.jsp">Cerrar sesión</a>) </span>
                    </div>
                    <!-- Nav -->
                    <nav id="nav">
                        <ul>
                            <li><a href="index.jsp">Inicio</a></li>
                            <li class="current">
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
                        <form>
                            <table class="default">
                                <tr>
                                    <th>Número de vuelo</th>
                                    <td><input id="numVuelo" name="numVuelo" type="number" required autofocus/></td>
                                    <th>Compañía</th>
                                    <td><input id="company" name="company" required/></td>
                                </tr>
                                <tr>
                                    <th>Ciudad de origen</th>
                                    <td><input id="from" name="from" required/></td>
                                    <th>Hora de salida</th>
                                    <td><select id="departHour" name="departHour" required>
                                <%  int count = 0;
                                    while (count < 24) {
                                        if (count >= 10) out.println("<option value=\""+count+"\">"+count+"</option>");
                                        else out.println("<option value=\"0"+count+"\">0"+count+"</option>");
                                        count++;
                                    }
                                %>
                                    </select>:
                                    <select id="departMin" name="departMin" required>
                                <%  count = 0;
                                    while (count < 60) {
                                        if (count >= 10) out.println("<option value=\""+count+"\">"+count+"</option>");
                                        else out.println("<option value=\"0"+count+"\">0"+count+"</option>");
                                        count++;
                                    }
                                %>
                                    </select></td>
                                </tr>
                                <tr>
                                    <th>Ciudad de destino</th>
                                    <td><input id="to" name="to" required/></td>
                                    <th>Hora de llegada</th>
                                    <td><select id="arriveHour" name="arriveHour" required/>
                                <%  count = 0;
                                    while (count < 24) {
                                        if (count >= 10) out.println("<option value=\""+count+"\">"+count+"</option>");
                                        else out.println("<option value=\"0"+count+"\">0"+count+"</option>");
                                        count++;
                                    }
                                %>
                                    </select>:
                                    <select id="arriveMin" name="arriveMin" required/>
                                <%  count = 0;
                                    while (count < 60) {
                                        if (count >= 10) out.println("<option value=\""+count+"\">"+count+"</option>");
                                        else out.println("<option value=\"0"+count+"\">0"+count+"</option>");
                                        count++;
                                    }
                                %>
                                    </select></td>
                                </tr>
                                <tr>
                                    <td><input type="submit" value="Dar de alta"></td>
                                    <td><input type="reset"></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
