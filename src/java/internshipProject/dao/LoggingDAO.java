/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.dao;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;


public class LoggingDAO {

    public static void LendingDetailsLogging2File() {

        try {
            PrintWriter printWriter = new PrintWriter(new File("C:/Users/oA/Documents/NetBeansProjects/InternshipProject 2/lendingRecords.csv"));
            StringBuilder stringBuilder = new StringBuilder();

            Connection connection = AccessLayer.getConnection();
            ResultSet rs = null;

            String query = "select kitapdurum.kitapDurum_id, uye.uye_id, uye.uye_ad, kitap.kitap_id, kitap.kitap_ad, kitapdurum.kitapdurum_verilisTarih, kitapdurum.kitapdurum_teslimTarih, IF(kitapdurum.kitapdurum_teslimDurumu>0,'Teslim Edilmiş','Teslim Edilmemiş') as kitapDurumStatus from kitapdurum  inner join kitap on kitapdurum.kitap_id = kitap.kitap_id  inner join uye on uye.uye_id = kitapdurum.uye_id ORDER BY kitapdurum.kitapdurum_id ASC";
            PreparedStatement ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
            Date date = new Date();  
            System.out.println(simpleDateFormat.format(date));  
            
            stringBuilder.append("Loglar, "+ simpleDateFormat.format(date) + "'de alınmıştır.\n");
            stringBuilder.append("Kayıt ID; Üye ID ve Adı; Kitap ID ve Adı; Veriliş Tarihi; Teslim Tarihi; Teslim Durumu\n");
            while (rs.next()) {
                
                stringBuilder.append(rs.getString("kitapdurum_id"));
                stringBuilder.append("; ");
                stringBuilder.append("ID: " + rs.getString("uye.uye_id") + ", Ad: " + rs.getString("uye.uye_ad"));
                stringBuilder.append("; ");
                stringBuilder.append("ID: " + rs.getString("kitap.kitap_id") + ", Ad: " + rs.getString("kitap.kitap_ad"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("kitapdurum.kitapdurum_verilistarih"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("kitapdurum.kitapdurum_teslimtarih"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("kitapDurumStatus"));
                stringBuilder.append("\n");
            }

            printWriter.write(stringBuilder.toString());
            printWriter.close();
            System.out.println("lendingRecords dosyası başarıyla oluşturuldu.");

        } catch (Exception e) {
            // TODO: handle exception
        }
    }
    
    public static void MemberDetailsLogging2File() {

        try {
            PrintWriter printWriter = new PrintWriter(new File("C:/Users/oA/Documents/NetBeansProjects/InternshipProject 2/memberRecords.csv"));
            StringBuilder stringBuilder = new StringBuilder();

            Connection connection = AccessLayer.getConnection();
            ResultSet rs = null;

            String query = "select uye_id, uye_lid, uye_ad, uye_gsm, uye_mail, uye_adres, uye_syd, IF(uye_yasakDurumu>0,'Yasaklı Üye','Mevcut Yasak Yok') as uyeYasakStatus FROM Uye ORDER BY uye_id ASC";
            PreparedStatement ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
            Date date = new Date();  
            System.out.println(simpleDateFormat.format(date));  
            
            stringBuilder.append("Loglar, "+ simpleDateFormat.format(date) + "'de alınmıştır.\n");
            stringBuilder.append("Kayıt ID ve Kullanıcı Adı; Üye Adı; GSM; Mail; Adres; Tip; Yasak Durumu\n");
            while (rs.next()) {
                
                stringBuilder.append("ID: " + rs.getString("uye_id") + ", Kullanıcı Adı: " + rs.getString("uye_lid"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("uye_ad"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("uye_gsm"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("uye_mail"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("uye_adres"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("uye_syd"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("uyeYasakStatus"));
                stringBuilder.append("\n");
            }

            printWriter.write(stringBuilder.toString());
            printWriter.close();
            System.out.println("memberRecords dosyası başarıyla oluşturuldu.");

        } catch (Exception e) {
            // TODO: handle exception
        }
    }
    
    public static void BookDetailsLogging2File() {

        try {
            PrintWriter printWriter = new PrintWriter(new File("C:/Users/oA/Documents/NetBeansProjects/InternshipProject 2/bookRecords.csv"));
            StringBuilder stringBuilder = new StringBuilder();

            Connection connection = AccessLayer.getConnection();
            ResultSet rs = null;

            String query = "select kitap_id, kitap_ad, kitap_isbn, kitap_basimYili, cevirmen.cevirmen_ad, yayinevi.yayinevi_ad, yazar.yazar_ad, kitap_kategori, kitap_konum, IF(kitap_mevcutSayi>0,kitap_mevcutSayi,'Mevcut Değil') as kitapSayiStatus from kitap inner join yazar on kitap.kitap_yazarId = yazar_id inner join cevirmen on kitap.kitap_cevirmenid = cevirmen.cevirmen_id inner join yayinevi on kitap.kitap_yayineviid = yayinevi.yayinevi_id ORDER BY kitap.kitap_id ASC";
            PreparedStatement ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
            Date date = new Date();  
            System.out.println(simpleDateFormat.format(date));  
            
            stringBuilder.append("Loglar, "+ simpleDateFormat.format(date) + "'de alınmıştır.\n");
            stringBuilder.append("Kitap ID; Kitaı Adı; ISBN; Basım Yılı; Çevirmen Adı; Yayınevi Adı; Yazar Adı; Kategori; Konumu; Mevcut Sayı\n");
            while (rs.next()) {
                
                stringBuilder.append(rs.getString("kitap_id"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("kitap_ad"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("kitap_isbn"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("kitap_basimYili"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("cevirmen.cevirmen_ad"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("yayinevi.yayinevi_ad"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("yazar.yazar_ad"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("kitap_kategori"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("kitap_konum"));
                stringBuilder.append("; ");
                stringBuilder.append(rs.getString("kitapSayiStatus"));
                stringBuilder.append("\n");
            }

            printWriter.write(stringBuilder.toString());
            printWriter.close();
            System.out.println("memberRecords dosyası başarıyla oluşturuldu.");

        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    public static void DeleteLendingLogFile() {

        try {
            File file = new File("C:\\Users\\oA\\Documents\\NetBeansProjects\\InternshipProject 2\\lendingRecords.csv");  
            if (file.delete()) 
            {
                System.out.println(file.getName() + " başarıyla silindi."); 
            } else {
                System.out.println("Dosya silinirken bir hata oluştu.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void DeleteMembersLogFile() {

        try {
            File file = new File("C:\\Users\\oA\\Documents\\NetBeansProjects\\InternshipProject 2\\memberRecords.csv");  
            if (file.delete()) 
            {
                System.out.println(file.getName() + " başarıyla silindi."); 
            } else {
                System.out.println("Dosya silinirken bir hata oluştu.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void DeleteBooksLogFile() {

        try {
            File file = new File("C:\\Users\\oA\\Documents\\NetBeansProjects\\InternshipProject 2\\bookRecords.csv");  
            if (file.delete()) 
            {
                System.out.println(file.getName() + " başarıyla silindi."); 
            } else {
                System.out.println("Dosya silinirken bir hata oluştu.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
