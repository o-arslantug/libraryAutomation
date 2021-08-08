/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.internshipProject;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SearchServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
        String[][] status = new String[1][1];

        String svfm = request.getParameter("svfm");
        String spfm = request.getParameter("spfm");
        
        if(svfm!=null){
            status=SearchFunctions.searchMember(svfm, spfm);
            System.out.println("Kitap güncelleme fonksiyonu seçildi!");
        }
        
        /*else{
            status=0;
            System.out.println("Kullanılacak fonksiyon seçilemedi!");
        }*/
        
        if(status[0][0] != null){
            request.setAttribute("welcome","WELCOME!");
            out.print("<b>ISLEM BASARILI</b>");
            RequestDispatcher rd=request.getRequestDispatcher("_memberSearchResults.jsp");
            rd.include(request, response);
        }
        
	else{
            out.print("<b>ISLEM BASARISIZ</b>");
            RequestDispatcher rd=request.getRequestDispatcher("_memberSearchResults.jsp");
            rd.include(request, response);
        }
        
	out.close();	
    }

}