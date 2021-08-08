/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.controller;

import internshipProject.dao.CommonLibraryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/worksOnCommonLibraryFunctions")
public class CommonLibraryServlet extends HttpServlet {

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
            out.println("<title>Servlet CommonLibraryServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CommonLibraryServlet at " + request.getContextPath() + "</h1>");
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
        
        int status;
        int pick=0;

        String teslimid = request.getParameter("teslimID");
        String LLmemberID = request.getParameter("LLmemberID");
        String LLbookID = request.getParameter("LLbookID");
        String authorName = request.getParameter("authorName");
        String translatorName = request.getParameter("translatorName");
        String publisherName = request.getParameter("publisherName");
        String publisherAddress = request.getParameter("publisherAddress");
        
        if(teslimid!=null && LLmemberID==null && authorName==null && translatorName==null && publisherName==null){
            status=CommonLibraryDAO.updateLending(teslimid);
            System.out.println("Kitap durumu güncelleme fonksiyonu seçildi!");
            if(status>0){
                request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_loggedInStaff.jsp");
                dispatcher.forward(request, response); 
            }

            else if(status==0){
                request.setAttribute("itDoesntWork", "<script>ifItDoesntWork()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_loggedInStaff.jsp");
                dispatcher.forward(request, response); 
            }
            else{
                request.setAttribute("itCantFind", "<script>cantFind()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_loggedInStaff.jsp");
                dispatcher.forward(request, response); 
            }
        }
        
        else if(teslimid==null && LLmemberID!=null && authorName==null && translatorName==null && publisherName==null){
            status=CommonLibraryDAO.addLending(LLmemberID, LLbookID);
            System.out.println("Kitap durumu ekleme fonksiyonu seçildi!");
            
            if(status>0){
                request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_lendingLibrary.jsp");
                dispatcher.forward(request, response); 
            }
            
            else if(status==0){
                request.setAttribute("itDoesntWork", "<script>ifItDoesntWork()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_lendingLibrary.jsp");
                dispatcher.forward(request, response); 
            }
            
            else if(status==-5){ //üye bulunamadı
                request.setAttribute("memberNotFound", "<script>memberNotFound()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_lendingLibrary.jsp");
                dispatcher.forward(request, response); 
            }
            
            else if(status==-4){ //kitap bulunamadı
                request.setAttribute("bookNotFound", "<script>bookNotFound()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_lendingLibrary.jsp");
                dispatcher.forward(request, response); 
            }
            
            else if(status==-3){ //üye yasaklı
                request.setAttribute("bannedMember", "<script>bannedMember()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_lendingLibrary.jsp");
                dispatcher.forward(request, response); 
            }
            else if(status==-2){ //kitap stokta kalmadıysa
                request.setAttribute("noBookLeft", "<script>noBookLeft()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_lendingLibrary.jsp");
                dispatcher.forward(request, response); 
            }
        }
        
        else if(teslimid==null && LLmemberID==null && authorName!=null && translatorName==null && publisherName==null){
            status=CommonLibraryDAO.addAuthor(authorName);
            System.out.println("Yazar ekleme fonksiyonu seçildi!");
            if(status>0){
                request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_addAuthor.jsp");
                dispatcher.forward(request, response); 
            }

            else{
                request.setAttribute("ifItDoesntWork", "<script>ifItDoesntWork()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_addAuthor.jsp");
                dispatcher.forward(request, response); 
            }
        }
        
        else if(teslimid==null && LLmemberID==null && authorName==null && translatorName!=null && publisherName==null){
            status=CommonLibraryDAO.addTranslator(translatorName);
            System.out.println("Çevirmen ekleme fonksiyonu seçildi!");
            if(status>0){
                request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_addTranslator.jsp");
                dispatcher.forward(request, response); 
            }
            
            else{
                request.setAttribute("ifItDoesntWork", "<script>ifItDoesntWork()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_addTranslator.jsp");
                dispatcher.forward(request, response); 
            }
        }
        
        else if(teslimid==null && LLmemberID==null && authorName==null && translatorName==null && publisherName!=null){
            status=CommonLibraryDAO.addPublisher(publisherName, publisherAddress);
            System.out.println("Yayınevi ekleme fonksiyonu seçildi!");
            if(status>0){
                request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_addPublisher.jsp");
                dispatcher.forward(request, response); 
            }

            else{
                request.setAttribute("ifItDoesntWork", "<script>ifItDoesntWork()</script>");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_addPublisher.jsp");
                dispatcher.forward(request, response); 
            }
        }
        
        else{
            status=0;
            System.out.println("Kullanılacak fonksiyon seçilemedi!");
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
