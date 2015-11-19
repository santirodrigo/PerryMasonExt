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
 * @author Santi
 */
@WebServlet(name = "buscarVuelo", urlPatterns = {"/buscarVuelo"})
public class buscarVuelo extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<h1>Resultados</h1>");
            
            Class.forName("org.sqlite.JDBC");
            Connection connection = null;
            
            try {
                connection = DriverManager.getConnection("jdbc:sqlite:F:\\UNI\\AD\\exemple.db");
                String selectStatement = "SELECT * FROM vuelos WHERE 1=1 ";
                boolean first = true;
                if (!request.getParameter("busqNumVuelo").equals("")) {
                    selectStatement = selectStatement.concat(" AND num_vuelo = "
                            + request.getParameter("busqNumVuelo"));
                }
                if (!request.getParameter("busqCompany").equals("")) {
                    selectStatement = selectStatement.concat(" AND companyia = \'"
                            + request.getParameter("busqCompany") + "\'");
                }
                if (!request.getParameter("busqFrom").equals("")) {
                    selectStatement = selectStatement.concat(" AND origen = \'"
                            + request.getParameter("busqFrom") + "\'");
                }
                if (!request.getParameter("busqDepartHour").equals("")) {
                    selectStatement = selectStatement.concat(" AND hora_salida = \'"
                            + request.getParameter("busqDepartHour") + "\'");
                }
                if (!request.getParameter("busqTo").equals("")) {
                    selectStatement = selectStatement.concat(" AND destino = \'"
                            + request.getParameter("busqTo") + "\'");
                }
                if (!request.getParameter("busqArriveHour").equals("")) {
                    selectStatement = selectStatement.concat(" AND hora_llegada = \'"
                            + request.getParameter("busqArriveHour") + "\'");
                }
                PreparedStatement prepStmt = connection.prepareStatement(selectStatement);
                ResultSet rs = prepStmt.executeQuery();
                out.println("<table class=default>");
                int numbrows = 0;
                if(rs.next()) {
                    out.print("<tr><th>Número de vuelo</th><th>Compañía</th>");
                    out.print("<th>Ciudad de origen</th><th>Hora de salida</th>");
                    out.print("<th>Ciudad de destino</th><th>Hora de llegada</th>");
                    out.println("</tr>");
                    numbrows++;
                    out.println("<tr><td>" + rs.getString(2) + "</td>");
                    out.print("<td>" + rs.getString(3) + "</td>");
                    out.print("<td>" + rs.getString(4) + "</td>");
                    out.print("<td>" + rs.getString(5) + "</td>");
                    out.print("<td>" + rs.getString(6) + "</td>");
                    out.println("<td>" + rs.getString(7) + "</td></tr>");
                    while(rs.next()) {
                        numbrows++;
                        out.println("<tr><td>" + rs.getString(2) + "</td>");
                        out.print("<td>" + rs.getString(3) + "</td>");
                        out.print("<td>" + rs.getString(4) + "</td>");
                        out.print("<td>" + rs.getString(5) + "</td>");
                        out.print("<td>" + rs.getString(6) + "</td>");
                        out.println("<td>" + rs.getString(7) + "</td></tr>");
                    }
                }
                out.println("</table>");
                if (numbrows == 0) out.println("<span>No hemos encontrado ningún vuelo con los requisitos solicitados</span>");
                else if (numbrows == 1) out.println("<span>Hemos encontrado 1 resultado a tu búsqueda</span>");
                else out.println("<span>Hemos encontrado "+ numbrows + " resultados a tu búsqueda</span>");
            } catch (SQLException ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            }
            finally
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
            Logger.getLogger(buscarVuelo.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(buscarVuelo.class.getName()).log(Level.SEVERE, null, ex);
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
