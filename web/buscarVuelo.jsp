<%-- 
    Document   : buscarVuelo
    Created on : 22-sep-2015, 17:30:36
    Author     : Santi
--%>
<%@page import="AD.login"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar un vuelo - Perry Mason & Co.</title>
        <script src="JS/functions.js"></script>
    </head>
    <body>
        <h1>Perry Mason & Co</h1>
        <h2>Buscar un vuelo</h2>
        <form id="formBuscaVuelo" method="post" action="buscarVuelo">
                <table>
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
                                        response.sendRedirect("error.java?idError=3");
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
                                        response.sendRedirect("error.java?idError=3");
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
                                        response.sendRedirect("error.java?idError=3");
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
                                        response.sendRedirect("error.java?idError=3");
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
                                        response.sendRedirect("error.java?idError=3");
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
                                        response.sendRedirect("error.java?idError=3");
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
                        <td><button onclick="sendSearchVuelo();return false;">Buscar</button></td>
                        <td><input type="reset"></td>
                    </tr>
                </table>
            </form>
                <div id="formResult" name="formResult"></div>
                <p><a href="menu.jsp">Volver al menú inicial</a></p>
    </body>
</html>
