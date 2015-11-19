/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ADServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sergi.soriano.bial
 */
@WebServlet(name = "setFechaHotelVuelo", urlPatterns = {"/setFechaHotelVuelo"})
public class setFechaHotelVuelo extends HttpServlet {

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
            out.println("<title>Servlet setFechaHotelVuelo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet setFechaHotelVuelo at " + request.getContextPath() + "</h1>");
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

        Connection connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:sqlite:F:\\UNI\\AD\\practica3.db");
            out.print("<select id=fecha>");
            if (("hotel").equals(request.getParameter("tipo")))
            {
                String selectStatement = "SELECT fecha "
                                       + "FROM hotel_fecha "
                                       + "WHERE id_hotel=?";
                PreparedStatement prepStmt = connection.prepareStatement(selectStatement);
                prepStmt.setString(1, request.getParameter("id"));
                ResultSet rs = prepStmt.executeQuery();
                while(rs.next()) {
                    out.println("<option value=\"" + rs.getString(1) + "\">" + rs.getString(1) + "</option>");
                }
            }
            else if (("vuelo").equals(request.getParameter("tipo")))
            {
                String selectStatement = "SELECT fecha "
                                       + "FROM vuelo_fecha "
                                       + "WHERE id_vuelo=?";
                PreparedStatement prepStmt = connection.prepareStatement(selectStatement);
                prepStmt.setInt(1, Integer.parseInt(request.getParameter("id")));
                ResultSet rs = prepStmt.executeQuery();
                while(rs.next()) {
                    out.println("<option value=\"" + rs.getString(1) + "\">" + rs.getString(1) + "</option>");
                }
            }
             out.print("</select>");
        } catch (SQLException ex) {
            Logger.getLogger(altaHotel.class.getName()).log(Level.SEVERE, null, ex);
        } finally
        {
            try
            {
              if(connection != null)
                connection.close();
            }
            catch(SQLException e)
            {
              // connection close failed.
              System.err.println(e.getMessage());
            }
        }
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

}
