<%-- 
    Document   : login
    Created on : 29-sep-2015, 16:17:43
    Author     : sergi.soriano.bial
--%>
<%
    if (session.getAttribute("user") != null) response.sendRedirect("menu.jsp");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Perry Mason & Co - Log in</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <LINK REL=StyleSheet HREF="CSS/styles.css" TYPE="text/css" >
    </head>
    <body>
        <h1>Perry Mason & Co</h1>
        <h2>Iniciar sesión</h2>
        <form id="formLogIn" method="post" action="login">
            <table>
                <tr>
                    <td>
                        <label for="user">User </label>
                    </td>
                    <td>
                        <input type="text" size="15" name="user" id="user" autofocus required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="user">Password </label>
                    </td>
                    <td>
                        <input type="password" size="15" name="pass" id="pass" required/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><button type="submit" value="Log in">Log in</button></td>
                </tr>
            </table>
        </form>      
    </body>
</html>
