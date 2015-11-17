<%-- 
    Document   : buscarHotel
    Created on : 23-sep-2015, 15:23:27
    Author     : sergi.soriano.bial
--%>
<%@page import="ADServlets.login"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% Class.forName("org.sqlite.JDBC"); %>
<%! Connection connection = null; %>

<%
    if (session.getAttribute("user") == null) response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Buscar un vuelo - Perry Mason & Co.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <LINK REL=StyleSheet HREF="CSS/styles.css" TYPE="text/css" >
        <script src="JS/jquery.min.js"></script>
        <script src="JS/jquery.dropotron.min.js"></script>
        <script src="JS/skel.min.js"></script>
        <script src="JS/util.js"></script>
        <script src="JS/main.js"></script>
        <script src="JS/functions.js"></script>
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
                            <li>
                                <a href="">Vuelo</a>
                                <ul>
                                    <li><a href="index.jsp">Insertar vuelo</a></li>
                                    <li><a href="altaVuelo.jsp">Consultar vuelo</a></li>
                                    <li class="current"><a href="altaHotel.jsp">Consultar plazas</a></li>
                                    <li><a href="buscarVuelo.jsp">Reservar plazas</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="">Hotel</a>
                                <ul>
                                    <li><a href="index.jsp">Insertar hotel</a></li>
                                    <li><a href="altaVuelo.jsp">Consultar hotel</a></li>
                                    <li class="current"><a href="altaHotel.jsp">Consultar habitaciones</a></li>
                                    <li><a href="buscarVuelo.jsp">Reservar habitaciones</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </header>
            </div>
            <div id="main-wrapper">
                <div class="container">
                    <div id="content">
                        <form id="formBuscaHotel"  method="post" action="BuscarHotel">
                            <table>
                                <tr>
                                    <th>Buscar</th>
                                    <td>
                                        <input type="text" id="textSearch" name="textSearch" autofocus />
                                    </td>
                                    <th>Cadena</th>
                                    <td>
                                        <select id="busqCadenaHotel" name="busqCadenaHotel">
                                            <option value=""></option>
                                            <% 
                                                try {
                                                    connection = DriverManager.getConnection("jdbc:sqlite:F:\\UNI\\AD\\exemple.db");
                                                    String selectStatement = "SELECT DISTINCT cadena FROM hoteles";
                                                    PreparedStatement prepStmt = connection.prepareStatement(selectStatement);
                                                    ResultSet rs = prepStmt.executeQuery();
                                                    while(rs.next()) {
                                                        out.println("<option value=\"" + rs.getString(1) + "\">" + rs.getString(1) + "</option>");
                                                    }
                                                } catch (SQLException ex) {
                                                    Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
                                                }
                                                finally
                                                {
                                                    try
                                                    {
                                                      if(connection != null)
                                                        connection.close();
                                                    }
                                                    catch(SQLException e)
                                                    {
                                                      // connection close failed.
                                                      System.err.println(e.getMessage());
                                                    }
                                                }
                                            %>
                                        </select>
                                    </td>
                                    <th>Ciudad</th>
                                    <td>
                                        <select id="busqCiudadHotel" name="busqCiudadHotel">
                                            <option value=""></option>
                                            <% 
                                                try {
                                                    connection = DriverManager.getConnection("jdbc:sqlite:F:\\UNI\\AD\\exemple.db");
                                                    String selectStatement = "SELECT DISTINCT ciudad FROM hoteles";
                                                    PreparedStatement prepStmt = connection.prepareStatement(selectStatement);
                                                    ResultSet rs = prepStmt.executeQuery();
                                                    while(rs.next()) {
                                                        out.println("<option value=\"" + rs.getString(1) + "\">" + rs.getString(1) + "</option>");
                                                    }
                                                } catch (SQLException ex) {

                                                    Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
                                                }
                                                finally
                                                {
                                                    try
                                                    {
                                                      if(connection != null)
                                                        connection.close();
                                                    }
                                                    catch(SQLException e)
                                                    {
                                                      // connection close failed.
                                                      System.err.println(e.getMessage());
                                                    }
                                                }
                                            %>
                                        </select>
                                    </td>
                                    <td>
                                        <button onclick="sendSearchHotel();return false;">Buscar</button>
                                    </td>

                                </tr>
                            </table>
                        </form>
                        <div id="formResult" name="formResult"></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

    <body>
        
    </body>
</html>
