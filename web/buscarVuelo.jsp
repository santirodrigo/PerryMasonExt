<%-- 
    Document   : buscarVuelo
    Created on : 22-sep-2015, 17:30:36
    Author     : Santi
--%>
<%@page import="ADServlets.login"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.Statement" %>

<%  Class.forName("org.sqlite.JDBC"); %>
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
                                    <td>
                                        <select id="busqNumVuelo" name="busqNumVuelo">
                                            <option value=""></option>
                                            <% 
                                                try {
                                                    connection = DriverManager.getConnection("jdbc:sqlite:F:\\UNI\\AD\\exemple.db");
                                                    String selectStatement = "SELECT DISTINCT num_vuelo FROM vuelos";
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
                                    <th>Compañía</th>
                                    <td>
                                    <select id="busqCompany" name="busqCompany">
                                        <option value=""></option>
                                            <% 
                                                try {
                                                    connection = DriverManager.getConnection("jdbc:sqlite:F:\\UNI\\AD\\exemple.db");
                                                    String selectStatement = "SELECT DISTINCT companyia FROM vuelos";
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
                                </tr>
                                <tr>
                                    <th>Ciudad de origen</th>
                                    <td>
                                    <select id="busqFrom" name="busqFrom">
                                        <option value=""></option>
                                            <% 
                                                try {
                                                    connection = DriverManager.getConnection("jdbc:sqlite:F:\\UNI\\AD\\exemple.db");
                                                    String selectStatement = "SELECT DISTINCT origen FROM vuelos";
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
                                    <th>Hora de salida</th>
                                    <td>
                                        <select id="busqDepartHour" name="busqDepartHour">
                                            <option value=""></option>
                                            <% 
                                                try {
                                                    connection = DriverManager.getConnection("jdbc:sqlite:F:\\UNI\\AD\\exemple.db");
                                                    String selectStatement = "SELECT DISTINCT hora_salida FROM vuelos";
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
                                </tr>
                                <tr>
                                    <th>Ciudad de destino</th>
                                    <td>
                                    <select id="busqTo" name="busqTo">
                                        <option value=""></option>
                                            <% 
                                                try {
                                                    connection = DriverManager.getConnection("jdbc:sqlite:F:\\UNI\\AD\\exemple.db");
                                                    String selectStatement = "SELECT DISTINCT destino FROM vuelos";
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
                                    <th>Hora de llegada</th>
                                    <td>
                                    <select id="busqArriveHour" name="busqArriveHour">
                                        <option value=""></option>
                                            <% 
                                                try {
                                                    connection = DriverManager.getConnection("jdbc:sqlite:F:\\UNI\\AD\\exemple.db");
                                                    String selectStatement = "SELECT DISTINCT hora_llegada FROM vuelos";
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
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type=submit onclick="sendSearchVuelo();return false;" value="Buscar"/></td>
                                    <td><input type="reset"></td>
                                    <td></td>
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
