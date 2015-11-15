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
                            <li><a href="altaVuelo.jsp">Alta vuelo</a></li>
                            <li><a href="altaHotel.jsp">Alta hotel</a></li>
                            <li><a href="buscarVuelo.jsp">Busca vuelo</a></li>
                            <li><a href="buscarHotel.jsp">Busca hotel</a></li>
                        </ul>
                    </nav>
                </header>
            </div>
            <div id="main-wrapper">
                <div class="container">
                    <div id="content">
                        <!--<form id="formLogIn" method="post" action="login">
                            <table>
                                <tr >
                                    <td style="vertical-align:middle; padding-bottom: 1em;" >
                                        <h1>User </h1>
                                    </td>
                                    <td style="padding-bottom: 1em;">
                                        <input type="text" size="15" name="user" id="user" autofocus required/>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td style="vertical-align:middle;" >
                                        <h1>Password </h1>
                                    </td>
                                    <td style="padding-bottom: 1em;">
                                        <input type="password" size="15" name="pass" id="pass" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><button type="submit" value="Log in">Log in</button></td>
                                </tr>
                            </table>
                        </form>-->
                    </div>
                </div>        
            </div>
        </div>
    </body>
</html>

