/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ADServlets;

import hotel.HotelWS_Service;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "reservaHabitacionHotel", urlPatterns = {"/reservaHabitacionHotel"})
public class reservaHabitacionHotel extends HttpServlet {
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
            out.println("<title>Servlet ReservaHabitacionHotel</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReservaHabitacionHotel at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");

        /* TODO output your page here. You may use following sample code. */
        int numHab;
        int idHotel = Integer.valueOf(request.getParameter("hotel"));
        int fecha = Integer.valueOf(request.getParameter("fecha"));
        if ("SOAP".equals(request.getParameter("webservice")))
        {
            numHab = reservaHabitacion(idHotel, fecha);
        }
        else
        {
            WSClass.RESTReservaHotel hotel = new WSClass.RESTReservaHotel();
            numHab = Integer.valueOf(hotel.reserva_habitacion(String.class, request.getParameter("hotel"), request.getParameter("fecha")));     
        }
        if (numHab == -1)
        {
            out.print("No se ha podido reservar habitación. Contacte con el administrador");
        }
        if (numHab == 0) out.print("No se ha podido reservar porque ya no quedan habitaciones libres");
        else if (numHab > 0) out.print("Se ha reservado correctamente. El número de habitaciones ocupadas es de "+numHab);
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

    private int reservaHabitacion(int idHotel, int fecha) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        hotel.HotelWS port = service.getHotelWSPort();
        return port.reservaHabitacion(idHotel, fecha);
    }

}
