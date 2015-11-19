/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ADServlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;
import vuelo.VueloWS_Service;

/**
 *
 * @author pimen
 */
@WebServlet(name = "consultaPlazasVuelo", urlPatterns = {"/consultaPlazasVuelo"})
public class consultaPlazasVuelo extends HttpServlet {
    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/vuelo/vueloWS.wsdl")
    private VueloWS_Service service;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet consultaHabitacionesHotel</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet consultaHabitacionesHotel at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        /* TODO output your page here. You may use following sample code. */
        int numPlazas;
        int idVuelo = Integer.valueOf(request.getParameter("vuelo"));
        int fecha = Integer.valueOf(request.getParameter("fecha"));
        if ("SOAP".equals(request.getParameter("webservice")))
        {
            numPlazas = consultaLibres(idVuelo, fecha);
        }
        else
        {
            WSClass.RESTConsultaLibresVuelo vuelo = new WSClass.RESTConsultaLibresVuelo();
            numPlazas = Integer.valueOf(vuelo.consulta_libres(String.class, request.getParameter("vuelo"), request.getParameter("fecha")));     
        }
        if (numPlazas == -1)
        {
            out.print("No existe este vuelo con esta fecha");
        }
        if (numPlazas == 0) out.print("No hay plazas disponibles");
        else if (numPlazas == 1) out.print("Hay 1 plaza disponible");
        else if (numPlazas > 1) out.print("Hay "+ numPlazas +" plazas disponible");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private int consultaLibres(int idVuelo, int fecha) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        vuelo.VueloWS port = service.getVueloWSPort();
        return port.consultaLibres(idVuelo, fecha);
    }
}
