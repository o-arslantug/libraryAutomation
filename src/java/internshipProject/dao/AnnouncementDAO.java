/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.dao;

import internshipProject.model.Announcement;
import java.util.*;
import java.sql.*;


public class AnnouncementDAO {
    
    static int status = 0;
    
    public static List<Announcement> getAnnouncementRecords() throws ClassNotFoundException {
    
        List<Announcement> announcementsList = new ArrayList<Announcement>();
        
        try {
            Connection connection = AccessLayer.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select duyuru.duyuru_id, personel.personel_ad, duyuru.duyuru_metni, duyuru.duyuru_tarihi, duyuru.duyuru_icerigi from duyuru inner join personel on duyuru.duyuru_sahibi = personel_id ORDER BY duyuru.duyuru_id DESC");
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while(resultSet.next()){
                Announcement announcement = new Announcement();
                announcement.setAnnouncementAnnouncer(resultSet.getString(1));
                announcement.setAnnouncementAnnouncer(resultSet.getString(2));
                announcement.setAnnouncementTitle(resultSet.getString(3));
                announcement.setAnnouncementDate(resultSet.getString(4));
                announcement.setAnnouncementDescription(resultSet.getString(5));
                announcementsList.add(announcement);
            }
        }
        
        catch(Exception e){
            System.out.println("Duyuru pagination sırasında hata: " + e.getMessage());
        }
        return announcementsList;
    } 
    
    public int addAnnouncement(Announcement announcement) throws ClassNotFoundException {
        Connection con = AccessLayer.getConnection();
        PreparedStatement ps;
        PreparedStatement psg;
        int announcerID = 0;

        try {
            psg = con.prepareStatement("Select personel_id from Personel where personel_lid= ? ");
            psg.setString(1, announcement.getAnnouncementAnnouncer());
            ResultSet rs = psg.executeQuery();

            if (rs.next()) {
                announcerID = rs.getInt(1);
            }

            System.out.println("Announcer ID is: " + announcerID);
        } catch (SQLException eg) {
            eg.printStackTrace();
            System.out.println("Duyuru ekleyen yöneticiyi bulma işlemi sırasında bir hata oluştu: " + eg.getMessage());
        }

        try {
            ps = con.prepareStatement("INSERT INTO Duyuru VALUES(?, ?, ?, ?, curDate())");
            int nextvalue1 = AccessLayer.getPrimaryKey();
            ps.setInt(1, nextvalue1);
            ps.setInt(2, announcerID);
            ps.setString(3, announcement.getAnnouncementTitle());
            ps.setString(4, announcement.getAnnouncementDescription());

            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Duyuru ekleme işlemi sırasında bir hata oluştu: " + e.getMessage());
        }

        return status;
    }
}
