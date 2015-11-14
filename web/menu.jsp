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
    </head>
    <body>
            <div>
                <h1>Perry Mason & Co</h1>
                <h2>Menú principal</h2>
                <table>
                    <tr>
                        <td>
                            <a href="altaVuelo.jsp">Da de alta un vuelo</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="altaHotel.jsp">Da de alta un hotel</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="buscarVuelo.jsp">Busca un vuelo</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="buscarHotel.jsp">Busca un hotel</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="logout.jsp">Cerrar sesión</a>
                        </td>
                    </tr>
                </table>
            </div>
    </body>
</html>

