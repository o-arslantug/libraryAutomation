/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.controller;

import internshipProject.dao.LoginVerificationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/worksOnAuthentication")
public class LoginVerificationServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginVerificationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginVerificationServlet at " + request.getContextPath() + "</h1>");
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

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String mUsername = request.getParameter("mUsername");
        String mPassword = request.getParameter("mPassword");

        HttpSession session = request.getSession();

        String vfC = LoginVerificationDAO.checkStaffLogin(username, password);
        String mvfC = LoginVerificationDAO.checkUserLogin(mUsername, mPassword);

        System.out.println("vfC return: " + vfC +"\nmvfC return: "+ mvfC);
        
        if (vfC != "0") {
            session.setAttribute("verifyControl", "approvedStaff");
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            request.setAttribute("loginSuccessful", "<script>ifLoginSuccessful()</script>");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_loggedInStaff.jsp");
            dispatcher.forward(request, response); 
            
        } 
        
        else if (mvfC != "0") {
            session.setAttribute("verifyControl", "approvedUser");
            session.setAttribute("mUsername", mUsername);
            session.setAttribute("mPassword", mPassword);
            request.setAttribute("loginSuccessful", "<script>ifLoginSuccessful()</script>");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_loggedInMember.jsp");
            dispatcher.forward(request, response); 
        } 
        
        else if (username!=null && vfC=="0"){
            System.out.println("çalıştım aslında ama neden gösterilmedim bilmiyorum.");

            request.setAttribute("loginFailed", "<script>ifLoginFailed()</script>");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_staff.jsp");
            dispatcher.forward(request, response); 
        }
        
        else if (mUsername!=null && mvfC=="0"){
            System.out.println("çalıştım aslında ama neden gösterilmedim bilmiyorum.");

            request.setAttribute("loginFailed", "<script>ifLoginFailed()</script>");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_member.jsp");
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
