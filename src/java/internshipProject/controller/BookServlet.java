/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.controller;

import internshipProject.dao.BookDAO;
import internshipProject.model.Book;
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


@WebServlet("/worksOnBook")
public class BookServlet extends HttpServlet {

    private BookDAO bookDAO = new BookDAO();

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
            out.println("<title>Servlet BookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookServlet at " + request.getContextPath() + "</h1>");
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

        RequestDispatcher dispatcher = request.getRequestDispatcher("/addBook.jsp");
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

        int statusAdd = 0;
        int statusUpdate = 0;
        int statusDelete = 0;

        String comingFrom = request.getParameter("comingFrom");

        String bookID = request.getParameter("bookID");
        String bookName = request.getParameter("bookName");
        String bookISBN = request.getParameter("bookISBN");
        String bookPublishingYear = request.getParameter("bookPublishingYear");
        String bookTranslatorID = request.getParameter("bookTranslatorID");
        String bookPublisherID = request.getParameter("bookPublisherID");
        String bookAuthorID = request.getParameter("bookAuthorID");
        String bookCategory = request.getParameter("bookCategory");
        String bookLocation = request.getParameter("bookLocation");
        String bookCurrentNumber = request.getParameter("bookCurrentNumber");

        Book book = new Book();

        book.setBookID(bookID);
        book.setBookName(bookName);
        book.setBookISBN(bookISBN);
        book.setBookPublishingYear(bookPublishingYear);
        book.setBookTranslatorID(bookTranslatorID);
        book.setBookPublisherID(bookPublisherID);
        book.setBookAuthorID(bookAuthorID);
        book.setBookCategory(bookCategory);
        book.setBookLocation(bookLocation);
        book.setBookCurrentNumber(bookCurrentNumber);

        if ("addBook".equals(comingFrom)) {
            try {
                statusAdd = bookDAO.addBook(book);
                System.out.println("'BookServlet' üzerinden kitap ekleme fonksiyonu olan 'addBook()' a yönlendirildik.");
                if (statusAdd >= 1) {
                    request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_bookDetails.jsp");
                    dispatcher.forward(request, response);
                } else if (statusAdd == 0) {
                    request.setAttribute("itDoesntWork", "<script>ifItDoesntWork()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_bookDetails.jsp");
                    dispatcher.forward(request, response);
                } else if (statusAdd == -1) {
                    request.setAttribute("itDidntSelect", "<script>ifItDidntSelect()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_addBook.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("itCantFind", "<script>ifItCantFind()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_bookDetails.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(StaffServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if ("updateBook".equals(comingFrom)) {
            try {
                statusUpdate = bookDAO.updateBook(book);
                System.out.println("'BookServlet' üzerinden kitap güncelleme fonksiyonu olan 'updateBook()' a yönlendirildik.");
                if (statusUpdate >= 1) {
                    request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_bookDetails.jsp");
                    dispatcher.forward(request, response);
                } else if (statusUpdate == 0) {
                    request.setAttribute("itDoesntWork", "<script>ifItDoesntWork()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_bookDetails.jsp");
                    dispatcher.forward(request, response);
                } else if (statusUpdate == -1) {
                    request.setAttribute("itDidntSelect", "<script>ifItDidntSelect()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_updateBook.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("itCantFind", "<script>ifItCantFind()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_bookDetails.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(StaffServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if ("Sil".equals(comingFrom)) {
            try {
                statusDelete = bookDAO.deleteBook(book);
                System.out.println("'BookServlet' üzerinden kitap silme fonksiyonu olan 'deleteBook()' a yönlendirildik.");
                if (statusDelete >= 1) {
                    request.setAttribute("itWorks", "<script>ifItWorks()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_bookDetails.jsp");
                    dispatcher.forward(request, response);
                } else if (statusDelete == 0) {
                    request.setAttribute("itDoesntWork", "<script>ifItDoesntWork()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_bookDetails.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("itCantFind", "<script>ifItCantFind()</script>");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_bookDetails.jsp");
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
