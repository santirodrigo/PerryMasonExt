
<%@page import="org.apache.http.client.methods.HttpPost"%>
<%@page import="org.apache.http.client.HttpClient"%>
<%@page import="ADServlets.login"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  if (session.getAttribute("user") == null) response.sendRedirect("login.jsp");
            else {
                session.setAttribute("user", null);
                session.setAttribute("code", null);

                HttpClient client;
                HttpPost post = new HttpPost("https://accounts.google.com/o/oauth2/revoke?token="+ACCESS_TOKEN);
                response = client.execute(post);

            }
%>
<html>
    <head>
        <title>Sesión cerrada</title>
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
                        <p>
                            La sesión se ha cerrado correctamente.
                            <br /> Si quieres volver a entrar puedes <a href=login.jsp title="Log in">adelante</a>!
                        </p>
                        
                    </div>
                </div>        
            </div>
        </div>
    </body>
</html>