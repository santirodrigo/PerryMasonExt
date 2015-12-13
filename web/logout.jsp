
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import="org.apache.http.client.HttpClient"%>
<%@page import="org.apache.http.client.methods.HttpGet"%>
<%@page import="org.apache.http.HttpResponse"%>
<%@page import="com.google.api.client.auth.oauth.OAuthGetAccessToken"%>
<%@page import="org.apache.http.client.methods.HttpPost"%>
<%@page import="ADServlets.login"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  boolean googleLogoutError = true;
    if (session.getAttribute("user") == null) response.sendRedirect("login.jsp");
    else {
        session.setAttribute("user", null);
        session.setAttribute("code", null);
        String url = "https://accounts.google.com/o/oauth2/revoke?token="+session.getAttribute("token");
        URLConnection connection = new URL(url).openConnection();
        InputStream resp = connection.getInputStream();
        int status = ((HttpURLConnection)connection).getResponseCode();
        if (status == 200) googleLogoutError = false;
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
                        <% if (googleLogoutError) out.println("Ha habido un error borrando tus datos de sesión de Google.");
                           else out.println("La sesión se ha cerrado correctamente.");
                        %>
                            <br /> Si quieres volver a entrar, puedes hacerlo: <a href=login.jsp title="Log in">adelante</a>!
                        </p>
                        
                    </div>
                </div>        
            </div>
        </div>
    </body>
</html>