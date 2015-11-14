<%-- 
    Document   : index
    Created on : 15-sep-2015, 17:09:08
    Author     : sergi.soriano.bial
--%>
<%
    session=request.getSession();
    if (session.getAttribute("user") != null)
    {
        response.sendRedirect("menu.jsp");
    }
    else response.sendRedirect("login.jsp");

%>

<html>
    <body>
        <%=session.getAttribute("user") %>
    </body>
</html>