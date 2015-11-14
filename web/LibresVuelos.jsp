<%-- 
    Document   : LibresVuelos
    Created on : 10-nov-2015, 17:17:30
    Author     : Santi
--%>

<% 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

    <%-- start web service invocation --%><hr/>
    <%
    try {
	hotel.HotelWS_Service service = new hotel.HotelWS_Service();
	hotel.HotelWS port = service.getHotelWSPort();
	 // TODO initialize WS operation arguments here
	int idHotel = 0;
	int fecha = 0;
	// TODO process result here
	int result = port.consultaLibres(idHotel, fecha);
	out.println("Result = "+result);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
    </body>
</html>
