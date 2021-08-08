/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.controller;

import internshipProject.dao.StaffDAO;
import internshipProject.model.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/worksOnStaff")
public class StaffServlet extends HttpServlet {

    private StaffDAO staffDAO = new StaffDAO();

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
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet StaffServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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

        RequestDispatcher dispatcher = request.getRequestDispatcher("/registerStaff.jsp");
        dispatcher.forward(request, response);
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

        int statusRegister = 0;
        int statusUpdate = 0;
        int statusDelete = 0;

        String comingFrom = request.getParameter("comingFrom");

        String staffID = request.getParameter("staffID");
        String staffLoginID = request.getParameter("staffLoginID");
        String staffPassword = request.getParameter("staffPassword");
        String staffName = request.getParameter("staffName");
        String staffGSM = request.getParameter("staffGSM");
        String staffMail = request.getParameter("staffMail");
        String staffAddress = request.getParameter("staffAddress");

        Staff staff = new Staff();

        staff.setStaffID(staffID);
        staff.setStaffLoginID(staffLoginID);
        staff.setStaffPassword(staffPassword);
        staff.setStaffName(staffName);
        staff.setStaffGSM(staffGSM);
        staff.setStaffMail(staffMail);
        staff.setStaffAddress(staffAddress);

        if ("registerStaff".equals(comingFrom)) {
            try {
                statusRegister = staffDAO.registerStaff(staff);
                System.out.println("'StaffServlet' üzerinden personel ekleme fonksiyonu olan 'registerStaff()' a yönlendirildik.");
                if (statusRegister >= 1) {
                    request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_staffDetails.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("itDoesntWork", "<script>ifItDoesntWork()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_staffDetails.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(StaffServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if ("updateStaff".equals(comingFrom)) {
            try {
                statusUpdate = staffDAO.updateStaff(staff);
                System.out.println("'StaffServlet' üzerinden personel güncelleme fonksiyonu olan 'updateStaff()' a yönlendirildik.");
                if (statusUpdate >= 1) {
                    request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_staffDetails.jsp");
                    dispatcher.forward(request, response);
                } else if (statusUpdate == -1) {
                    request.setAttribute("itDidntSelect", "<script>ifItDidntSelect()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_staffDetails.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("itDoesntWork", "<script>ifItDoesntWork()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_staffDetails.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(StaffServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } else if ("Sil".equals(comingFrom)) {
            try {
                statusDelete = staffDAO.deleteStaff(staff);
                System.out.println("'StaffServlet' üzerinden personel silme fonksiyonu olan 'deleteStaff()' a yönlendirildik.");
                if (statusDelete >= 1) {
                    request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_staffDetails.jsp");
                    dispatcher.forward(request, response);
                } else if (statusDelete == 0) {
                    request.setAttribute("itDoesntWork", "<script>ifItDoesntWork()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_staffDetails.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("itCantFind", "<script>ifItCantFind()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_staffDetails.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(StaffServlet.class.getName()).log(Level.SEVERE, null, ex);
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
