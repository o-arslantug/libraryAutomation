/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.controller;

import internshipProject.dao.AnnouncementDAO;
import internshipProject.model.Announcement;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/worksOnAnnouncement")
public class AnnouncementServlet extends HttpServlet {

    private AnnouncementDAO announcementDAO = new AnnouncementDAO();
    
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
            out.println("<title>Servlet AnnouncementServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AnnouncementServlet at " + request.getContextPath() + "</h1>");
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
        
        boolean status = false;

        String announcementText = request.getParameter("announcementText");
        String announcementDescription = request.getParameter("announcementDescription");
        String announcerLID = request.getSession().getAttribute("username").toString();

        Announcement announcement = new Announcement();

        announcement.setAnnouncementTitle(announcementText);
        announcement.setAnnouncementDescription(announcementDescription);
        announcement.setAnnouncementAnnouncer(announcerLID);
        
        try {
            announcementDAO.addAnnouncement(announcement);
            status=true;
            System.out.println("'AnnouncementServlet' üzerinden duyuru ekleme fonksiyonu olan 'addAnnouncement()' a yönlendirildik.");
        } 
        catch (ClassNotFoundException ex) {
            Logger.getLogger(MemberServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(status==true){
            request.setAttribute("itWorks", "<script>ifItWorks()</script>");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_addAnnouncement.jsp");
            dispatcher.forward(request, response); 
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
