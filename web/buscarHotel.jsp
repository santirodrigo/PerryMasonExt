<%-- 
    Document   : buscarHotel
    Created on : 23-sep-2015, 15:23:27
    Author     : sergi.soriano.bial
--%>
<%@page import="AD.login"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar un vuelo - Perry Mason & Co.</title>
        <script src="JS/functions.js"></script>

    </head>
    <body>
        <form id="formBuscaHotel"  method="post" action="BuscarHotel">
            <h1>Perry Mason & Co</h1>
            <h2>Buscar un hotel</h2>
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
        <p><a href="menu.jsp">Volver al menú inicial</a></p>
        <div id="formResult" name="formResult"></div>
    </body>
</html>
