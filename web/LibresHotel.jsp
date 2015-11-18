<%-- 
    Document   : LibresHotel
    Created on : 17-nov-2015, 16:53:44
    Author     : Santi
--%>
<%
    session=request.getSession();
    if (session.getAttribute("user") == null)
    {
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% Class.forName("org.sqlite.JDBC"); %>
<%! Connection connection = null; %>
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
        <script src="JS/functions.js"></script>

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
                                    <li><a href="altaVuelo.jsp">Insertar vuelo</a></li>
                                    <li><a href="buscarVuelo.jsp">Consultar vuelo</a></li>
                                    <li><a href="LibresVuelos.jsp">Consultar plazas</a></li>
                                    <li><a href="ReservarVuelo.jsp">Reservar plazas</a></li>
                                </ul>
                            </li>
                            <li class="current">
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
                                    <th>Hotel</th>
                                    <td>
                                        <select id="busqHotel" name="busqHotel" >
                                            <option value=""></option>
                                            <% 
                                                try {
                                                    connection = DriverManager.getConnection("jdbc:sqlite:F:\\UNI\\AD\\practica3.db");
                                                    String selectStatement = "SELECT DISTINCT id_hotel FROM hotel_fecha";
                                                    PreparedStatement prepStmt = connection.prepareStatement(selectStatement);
                                                    ResultSet rs = prepStmt.executeQuery();
                                                    while(rs.next()) {
                                                        out.println("<option value=\"" + rs.getString(1) + "\">" + rs.getString(1) + "</option>");
                                                    }
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
                                    <th>Fecha</th>
                                    <td><input id="fecha" name="fecha" required placeholder="aaaammdd" maxlength="8"/></td>
                                    <th>Web service</th>
                                    <td>
                                        <select id="webservice">
                                            <option value="SOAP">SOAP</option>
                                            <option value="REST">REST</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center"><button type="submit" onClick="getnumHab();return false;" >Buscar habitaciones hotel</button></td>
                                </tr>
                            </table>
                        </form>
                                        <div id="result" >
                                            "<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><title>GlassFish Server Open Source Edition  4.1.1  - Error report</title><style type="text/css"><!--H1 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:22px;} H2 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:16px;} H3 {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;font-size:14px;} BODY {font-family:Tahoma,Arial,sans-serif;color:black;background-color:white;} B {font-family:Tahoma,Arial,sans-serif;color:white;background-color:#525D76;} P {font-family:Tahoma,Arial,sans-serif;background:white;color:black;font-size:12px;}A {color : black;}HR {color : #525D76;}--></style> </head><body><h1>HTTP Status 500 - Internal Server Error</h1><hr/><p><b>type</b> Exception report</p><p><b>message</b>Internal Server Error</p><p><b>description</b>The server encountered an internal error that prevented it from fulfilling this request.</p><p><b>exception</b> <pre>javax.xml.ws.WebServiceException: Fallo al acceder al WSDL en: http://localhost:8080/hotel/hotelWS?wsdl. Ha fallado con: 	http://localhost:8080/hotel/hotelWS?wsdl.</pre></p><p><b>note</b> <u>The full stack traces of the exception and its root causes are available in the GlassFish Server Open Source Edition  4.1.1  logs.</u></p><hr/><h3>GlassFish Server Open Source Edition  4.1.1 </h3></body></html>"
                                            
                                            
                                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
