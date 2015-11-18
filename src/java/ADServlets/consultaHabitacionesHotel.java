    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ADServlets;

import WSClass.RESTConsultaLibresHotel;
import WSClass.SOAPHotel;
import hotel.HotelWS_Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;

/**
 *
 * @author pimen
 */
@WebServlet(name = "consultaHabitacionesHotel", urlPatterns = {"/consultaHabitacionesHotel"})
public class consultaHabitacionesHotel extends HttpServlet {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/hotel/hotelWS.wsdl")
    private HotelWS_Service service;

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
        int numHab;
        int idHotel = Integer.valueOf(request.getParameter("hotel"));
        int fecha = Integer.valueOf(request.getParameter("fecha"));
        if ("SOAP".equals(request.getParameter("webservice")))
        {
            numHab = SOAPHotel.consultaLibres(idHotel, fecha);
        }
        else
        {
            RESTConsultaLibresHotel hotel = new RESTConsultaLibresHotel();
            numHab = Integer.valueOf(hotel.consulta_libres(String.class, request.getParameter("hotel"), request.getParameter("fecha")));     
        }
        if (numHab == -1)
        {
            out.print("No existe este hotel con esta fecha");
        }
        if (numHab == 0) out.print("No hay habitaciones disponibles");
        else if (numHab == 1) out.print("Hay 1 habitación disponible");
        else if (numHab > 1) out.print("Hay "+ numHab +" habitaciones disponible");
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

    private int consultaLibres(int idHotel, int fecha) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        hotel.HotelWS port = service.getHotelWSPort();
        return port.consultaLibres(idHotel, fecha);
    }

}
