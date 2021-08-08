/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.internshipProject;

import internshipProject.dao.AccessLayer;
import java.sql.*;


public class SearchFunctions {

    static int status = 0;

//searcBook fonksiyonu, işlemler ilgili JSP sayfası üzerinden yapıldığı için pasif bırakılmıştır.
//Bahsi geçen ilgili JSP sayfası = "_searchResults.jsp"
    /*

    public static int searchBook(String sv, String sp){
	Connection con=AccessLayer.getConnection();
	PreparedStatement ps;
        String ret;
        
        if(sp.equals("Kitap Adı")){
            try {
            ps = con.prepareStatement("select kitap.kitap_isbn, kitap.kitap_ad, yazar.yazar_ad from kitap inner join yazar on kitap.kitap_yazarId = yazar_id inner join cevirmen on kitap.kitap_cevirmenid = cevirmen.cevirmen_id inner join yayinevi on kitap.kitap_yayineviid = yayinevi.yayinevi_id where kitap.kitap_ad like'%" + sv + "%'");
            
            System.out.println("sv1: "+ sv);
            
            //ps.setString(1, sv);
            
            System.out.println("sv2: "+ sv);
            ResultSet rs = ps.executeQuery();
            System.out.println("sv3: "+ sv);
                while(rs.next()==true){
                    ret = rs.getString(1);
                    System.out.println("ret: "+ ret);
                }                
            } 
        
            catch (SQLException e) {
		e.printStackTrace();
                System.out.println("Kitap arama işlemi sırasında bir hata oluştu:" + e.getMessage());
            }
        }
        
        else if(sp.equals("ISBN Numarası")){
            try {
            ps = con.prepareStatement("select kitap.kitap_isbn, kitap.kitap_ad, yazar.yazar_ad from kitap inner join yazar on kitap.kitap_yazarId = yazar_id inner join cevirmen on kitap.kitap_cevirmenid = cevirmen.cevirmen_id inner join yayinevi on kitap.kitap_yayineviid = yayinevi.yayinevi_id where kitap.kitap_isbn like'%" + sv + "%'");
            
            System.out.println("sv1: "+ sv);
            
            //ps.setString(1, sv);
            
            System.out.println("sv2: "+ sv);
            ResultSet rs = ps.executeQuery();
            System.out.println("sv3: "+ sv);
                while(rs.next()==true){
                    ret = rs.getString(1);
                    System.out.println("ret: "+ ret);
                }                
            } 
        
            catch (SQLException e) {
		e.printStackTrace();
                System.out.println("Kitap arama işlemi sırasında bir hata oluştu:" + e.getMessage());
            }
        }
        
        else if(sp.equals("Kitap Yazarı")){
            try {
            ps = con.prepareStatement("select kitap.kitap_isbn, kitap.kitap_ad, yazar.yazar_ad from kitap inner join yazar on kitap.kitap_yazarId = yazar_id inner join cevirmen on kitap.kitap_cevirmenid = cevirmen.cevirmen_id inner join yayinevi on kitap.kitap_yayineviid = yayinevi.yayinevi_id where yazar.yazar_ad like'%" + sv + "%'");
            
            System.out.println("sv1: "+ sv);
            
            //ps.setString(1, sv);
            
            System.out.println("sv2: "+ sv);
            ResultSet rs = ps.executeQuery();
            System.out.println("sv3: "+ sv);
                while(rs.next()==true){
                    ret = rs.getString(1);
                    System.out.println("ret: "+ ret);
                }                
            } 
        
            catch (SQLException e) {
		e.printStackTrace();
                System.out.println("Kitap arama işlemi sırasında bir hata oluştu:" + e.getMessage());
            }
        }
        else{
            System.out.println("Arama parametresi seçimi sırasında bir hata oluştu.");
        }
        System.out.println("status" + status);
        return status;
    }

     */
    public static String[][] searchMember(String svfm, String spfm) {
        Connection con = AccessLayer.getConnection();
        PreparedStatement ps;
        String[][] returnList = new String[1][1];
        String ret;

        int i = 0;
        int j = 0;

        if (spfm.equals("Üye Adı")) {
            try {
                ps = con.prepareStatement("SELECT * from Uye where uye_ad like'%" + svfm + "%'");
                ResultSet counter = ps.executeQuery();

                while (counter.next() == true) {
                    i++;
                }

                returnList = new String[i][4];

                ResultSet rs = ps.executeQuery();
                while (rs.next() == true) {
                    ret = rs.getString(1);
                    returnList[j][0] = rs.getString(1);
                    returnList[j][1] = rs.getString(4);
                    returnList[j][2] = rs.getString(5);
                    returnList[j][3] = rs.getString(6);
                    j++;
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Üye arama işlemi sırasında bir hata oluştu:" + e.getMessage());
            }
        } else if (spfm.equals("Telefon No")) {
            try {
                ps = con.prepareStatement("SELECT * from Uye where uye_gsm like'%" + svfm + "%'");
                ResultSet counter = ps.executeQuery();

                while (counter.next() == true) {
                    i++;
                }

                returnList = new String[i][4];

                ResultSet rs = ps.executeQuery();

                while (rs.next() == true) {
                    ret = rs.getString(1);
                    returnList[j][0] = rs.getString(1);
                    returnList[j][1] = rs.getString(4);
                    returnList[j][2] = rs.getString(5);
                    returnList[j][3] = rs.getString(6);
                    j++;
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Üye arama işlemi sırasında bir hata oluştu:" + e.getMessage());
            }
        } else {
            System.out.println("Arama parametresi seçimi sırasında bir hata oluştu.");
        }

        return returnList;
    }
}
