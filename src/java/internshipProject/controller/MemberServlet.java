/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.controller;

import internshipProject.dao.MemberDAO;
import internshipProject.model.Member;
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


@WebServlet("/worksOnMember")
public class MemberServlet extends HttpServlet {

    private MemberDAO memberDAO = new MemberDAO();

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
            out.println("<title>Servlet MemberServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MemberServlet at " + request.getContextPath() + "</h1>");
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

        RequestDispatcher dispatcher = request.getRequestDispatcher("/registerMember.jsp");
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

        String memberID = request.getParameter("memberID");
        String memberLoginID = request.getParameter("memberLoginID");
        String memberPassword = request.getParameter("memberPassword");
        String memberName = request.getParameter("memberName");
        String memberGSM = request.getParameter("memberGSM");
        String memberMail = request.getParameter("memberMail");
        String memberAddress = request.getParameter("memberAddress");
        String memberType = request.getParameter("memberType");
        String memberBanStatus = request.getParameter("memberBanStatus");

        Member member = new Member();

        member.setMemberID(memberID);
        member.setMemberLoginID(memberLoginID);
        member.setMemberPassword(memberPassword);
        member.setMemberName(memberName);
        member.setMemberGSM(memberGSM);
        member.setMemberMail(memberMail);
        member.setMemberAddress(memberAddress);
        member.setMemberType(memberType);
        member.setMemberBanStatus(memberBanStatus);

        if ("registerMember".equals(comingFrom)) {
            try {
                statusRegister = memberDAO.registerMember(member);
                System.out.println("'MemberServlet' üzerinden üye ekleme fonksiyonu olan 'registerMember()' a yönlendirildik.");
                System.out.println("returnnnn: " + statusRegister);
                if (request.getSession().getAttribute("verifyControl").toString() == "approvedStaff") {

                    if (statusRegister >= 1) {
                        request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_memberDetails.jsp");
                        dispatcher.forward(request, response);
                    } else if (statusRegister == -1) {
                        request.setAttribute("itDidntSelect", "<script>ifItDidntSelect()</script>");
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_registerMember.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        request.setAttribute("itDoesntWork", "<script>ifItDoesntWork()</script>");
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_memberDetails.jsp");
                        dispatcher.forward(request, response);
                    }
                } else {

                    if (statusRegister >= 1) {
                        request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_member.jsp");
                        dispatcher.forward(request, response);
                    } else if (statusRegister == -1) {
                        request.setAttribute("itDidntSelect", "<script>ifItDidntSelect()</script>");
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_registerMember.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        request.setAttribute("itDoesntWork", "<script>ifItDoesntWork()</script>");
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_member.jsp");
                        dispatcher.forward(request, response);
                    }

                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(MemberServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if ("updateMember".equals(comingFrom)) {
            try {
                statusUpdate = memberDAO.updateMember(member);
                System.out.println("'MemberServlet' üzerinden üye güncelleme fonksiyonu olan 'updateMember()' a yönlendirildik.");
                if (statusUpdate >= 1) {
                    request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_memberDetails.jsp");
                    dispatcher.forward(request, response);
                } else if (statusUpdate == -1) {
                    request.setAttribute("itDidntSelect", "<script>ifItDidntSelect()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_memberDetails.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("itDoesntWork", "<script>ifItDoesntWork()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_memberDetails.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(MemberServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if ("Sil".equals(comingFrom)) {
            try {
                statusDelete = memberDAO.deleteMember(member);
                System.out.println("'MemberServlet' üzerinden üye silme fonksiyonu olan 'deleteMember()' a yönlendirildik.");
                if (statusDelete >= 1) {
                    request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_memberDetails.jsp");
                    dispatcher.forward(request, response);
                } else if (statusDelete == 0) {
                    request.setAttribute("itDoesntWork", "<script>ifItDoesntWork()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_memberDetails.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("itCantFind", "<script>ifItCantFind()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_memberDetails.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(MemberServlet.class.getName()).log(Level.SEVERE, null, ex);
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
