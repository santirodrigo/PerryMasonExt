<%-- 
    Document   : logout.jsp
    Created on : 29-sep-2015, 15:39:54
    Author     : Santi
--%>

<%@page import="AD.login"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sesión cerrada</title>
    </head>
    <body>
        <h1>Perry Mason & Co</h1>
        <h2>Sesión cerrada</h2>
        <%  if (session.getAttribute("user") == null) response.sendRedirect("login.jsp");
            else session.setAttribute("user", null);%>
        <h1>Se ha cerrado tu sesión correctamente</h1>
        <a href="login.jsp">Volver a iniciar sesión</a>
    </body>
</html>
