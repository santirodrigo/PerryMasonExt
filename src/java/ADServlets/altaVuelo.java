package ADServlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sergi.soriano.bial
 */
@WebServlet(urlPatterns = {"/altaVuelo"})
public class altaVuelo extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException {
        HttpSession Session=request.getSession(); 
        
        /* TODO output your page here. You may use following sample code. */
        
        Class.forName("org.sqlite.JDBC");
        Connection connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:sqlite:F:\\UNI\\AD\\exemple.db");
            
            String insertStatement = "INSERT INTO vuelos (num_vuelo,companyia,origen,hora_salida,destino,hora_llegada) values(?,?,?,?,?,?)";
            PreparedStatement prepStmt = connection.prepareStatement(insertStatement);
            prepStmt.setString(1, request.getParameter("numVuelo"));
            prepStmt.setString(2, request.getParameter("company"));
            prepStmt.setString(3, request.getParameter("from"));
            prepStmt.setString(4, request.getParameter("departHour")+":"+request.getParameter("departMin"));
            prepStmt.setString(5, request.getParameter("to"));
            prepStmt.setString(6, request.getParameter("arriveHour")+":"+request.getParameter("arriveMin"));
            int result = prepStmt.executeUpdate();
            if (result == 0) {
                
            }
            response.sendRedirect("menu.jsp");
            
        } catch (SQLException ex) {
            Logger.getLogger(altaVuelo.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("error.java?idError=2");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(altaVuelo.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(altaVuelo.class.getName()).log(Level.SEVERE, null, ex);
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
