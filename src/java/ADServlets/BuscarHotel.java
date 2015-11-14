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
@WebServlet(name = "BuscarHotel", urlPatterns = {"/BuscarHotel"})
public class BuscarHotel extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        Class.forName("org.sqlite.JDBC");
        Connection conn = null;
                
        try {
            conn = DriverManager.getConnection("jdbc:sqlite:F:\\UNI\\AD\\exemple.db");
            String selectStatement = "SELECT * FROM hoteles WHERE 1=1 "; //cadena = ? OR ciudad = ? OR nom_hotel like ?";
            
            if (!request.getParameter("busqCadenaHotel").equals("")) selectStatement = selectStatement.concat("AND cadena= \'"+request.getParameter("busqCadenaHotel")+"\'" );
            if (!request.getParameter("busqCiudadHotel").equals("")) selectStatement = selectStatement.concat("AND ciudad= \'"+request.getParameter("busqCiudadHotel")+"\'" );
            if (!request.getParameter("textSearch").equals("")) selectStatement = selectStatement.concat("AND nom_hotel like \'%"+request.getParameter("textSearch")+"%\'  " );
                 
            PreparedStatement prepStmt = conn.prepareStatement(selectStatement);
            
            ResultSet rs = prepStmt.executeQuery();
            String concat = "";
            if(rs.next()) { 
                concat = "<table><tr><th>Nombre hotel</th><th>Cadena</th><th>Dirección</th><th>Habitaciones</th></tr>";

                concat += "<tr><td>"+rs.getString("nom_hotel")+"</td>";
                concat += "<td>"+rs.getString("cadena")+"</td>";
                concat += "<td>"+rs.getString("calle")+", "+rs.getString("numero")+", "+rs.getString("ciudad")+"</td>";
                concat += "<td>"+rs.getString("numb_hab")+"</td></tr>";
               while(rs.next())
                {
                    concat += "<tr><td>"+rs.getString("nom_hotel")+"</td>";
                    concat += "<td>"+rs.getString("cadena")+"</td>";
                    concat += "<td>"+rs.getString("calle")+" núm. "+rs.getString("numero")+", "+rs.getString("ciudad")+"</td>";
                    concat += "<td>"+rs.getString("numb_hab")+"</td></tr>";
                }
                concat += "</table>";
            }
            else concat = "No se han encontrado resultados";
            out.println(concat);
        } catch (SQLException ex) {
            Logger.getLogger(BuscarHotel.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("error.java?idError=3");

        } 
        finally
        {
            try
            {
              if(conn != null)
                conn.close();
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
            Logger.getLogger(BuscarHotel.class.getName()).log(Level.SEVERE, null, ex);
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
      //  try {
      ///      processRequest(request, response);
      //  } catch (ClassNotFoundException ex) {
        //    Logger.getLogger(BuscarHotel.class.getName()).log(Level.SEVERE, null, ex);
        //}
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection conn = null;
                
        try {
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection("jdbc:sqlite:F:\\UNI\\AD\\exemple.db");
            String selectStatement = "SELECT * FROM hoteles WHERE 1=1 "; //cadena = ? OR ciudad = ? OR nom_hotel like ?";
            
            if (!request.getParameter("busqCadenaHotel").equals("")) selectStatement = selectStatement.concat("AND cadena= \'"+request.getParameter("busqCadenaHotel")+"\'" );
            if (!request.getParameter("busqCiudadHotel").equals("")) selectStatement = selectStatement.concat("AND ciudad= \'"+request.getParameter("busqCiudadHotel")+"\'" );
            if (!request.getParameter("textSearch").equals("")) selectStatement = selectStatement.concat("AND nom_hotel like \'%"+request.getParameter("textSearch")+"%\'  " );
                 
            PreparedStatement prepStmt = conn.prepareStatement(selectStatement);
            
            ResultSet rs = prepStmt.executeQuery();
            String concat = "";
            if(rs.next()) { 
                concat = "<table><tr><th>Nombre hotel</th><th>Cadena</th><th>Dirección</th><th>Habitaciones</th></tr>";

                concat += "<tr><td>"+rs.getString("nom_hotel")+"</td>";
                concat += "<td>"+rs.getString("cadena")+"</td>";
                concat += "<td>"+rs.getString("calle")+", "+rs.getString("numero")+", "+rs.getString("ciudad")+"</td>";
                concat += "<td>"+rs.getString("numb_hab")+"</td></tr>";
               while(rs.next())
                {
                    concat += "<tr><td>"+rs.getString("nom_hotel")+"</td>";
                    concat += "<td>"+rs.getString("cadena")+"</td>";
                    concat += "<td>"+rs.getString("calle")+" núm. "+rs.getString("numero")+", "+rs.getString("ciudad")+"</td>";
                    concat += "<td>"+rs.getString("numb_hab")+"</td></tr>";
                }
                concat += "</table>";
            }
            else concat = "No se han encontrado resultados";
            out.println(concat);
        } catch (SQLException ex) {
            Logger.getLogger(BuscarHotel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BuscarHotel.class.getName()).log(Level.SEVERE, null, ex);
        } 
        finally
        {
            try
            {
              if(conn != null)
                conn.close();
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
