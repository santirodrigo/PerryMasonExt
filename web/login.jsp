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
    <body class="homepage">
        <div id="page-wrapper">
            <!-- Header -->
            <div id="header-wrapper">
                <header id="header" class="container">
                    <!-- Logo -->
                    <div id="logo">
                        <h1><a href="index.jsp">Perry Mason</a></h1>
                    </div>
                </header>
            </div>
            <div id="main-wrapper">
                <div class="container">
                    <div id="content">
                        <form id="formLogIn" method="post" action="login">
                            <table class="default">
                                <tr>
                                    <td style="vertical-align:middle;" >
                                        <h1>User </h1>
                                    </td>
                                    <td>
                                        <input type="text" size="15" name="user" id="user" autofocus required/>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td style="vertical-align:middle;" >
                                        <h1>Password </h1>
                                    </td>
                                    <td>
                                        <input type="password" size="15" name="pass" id="pass" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align:center">
                                        <button type="submit" value="Log in">Log in</button>
                                        <br />
                                        <%
                                            try
                                            {
                                                if(request.getParameter("idError").equals("1"))
                                                {
                                                    out.print("<span style=color:red>El usuario o la contraseña es incorrecta</span>");
                                                }
                                            }catch(java.lang.NullPointerException e){

                                            }
                                        %>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        
                    </div>
                </div>        
            </div>
        </div>
    </body>
</html>
