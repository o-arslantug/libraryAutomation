/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.dao;

import static internshipProject.dao.AccessLayer.connection;
import internshipProject.model.Member;
import java.sql.*;


public class MemberDAO {

    static int status = 0;

    public int registerMember(Member member) throws ClassNotFoundException {
        System.out.println("'MemberDAO' üzerinden yazılı üye ekleme fonksiyonu olan 'registerMember()' çalıştırıldı.");
        Connection connection = AccessLayer.getConnection();
        PreparedStatement preparedStatement;

        try {
            preparedStatement = connection.prepareStatement("INSERT INTO Uye VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)");
            int nextvalue1 = AccessLayer.getPrimaryKey();
            preparedStatement.setInt(1, nextvalue1);
            preparedStatement.setString(2, member.getMemberLoginID());
            preparedStatement.setString(3, member.getMemberPassword());
            preparedStatement.setString(4, member.getMemberName());
            preparedStatement.setString(5, member.getMemberGSM());
            preparedStatement.setString(6, member.getMemberMail());
            preparedStatement.setString(7, member.getMemberAddress());
            preparedStatement.setString(8, member.getMemberType());
            preparedStatement.setString(9, "0");
            
            System.out.println("member type: " + member.getMemberType());
            if("-1".equals(member.getMemberType())){
                return -1;
            }
System.out.println("bana komazzzzzzzzzzzzzzzz");
            status = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Üye ekleme işlemi sırasında bir hata oluştu: " + e.getMessage());
        }

        return status;
    }

    public static int updateMember(Member member) throws ClassNotFoundException {
        System.out.println("'MemberDAO' üzerinden yazılı üye güncelleme fonksiyonu olan 'updateMember()' çalıştırıldı.");
        Connection connection = AccessLayer.getConnection();
        PreparedStatement preparedStatement;

        try {
            preparedStatement = connection.prepareStatement("UPDATE Uye SET uye_lid = ?, uye_sifre = ?, uye_ad = ?, uye_gsm = ?, uye_mail = ?, uye_adres = ?, uye_syd = ? where uye_id = ?");
            preparedStatement.setString(1, member.getMemberLoginID());
            preparedStatement.setString(2, member.getMemberPassword());
            preparedStatement.setString(3, member.getMemberName());
            preparedStatement.setString(4, member.getMemberGSM());
            preparedStatement.setString(5, member.getMemberMail());
            preparedStatement.setString(6, member.getMemberAddress());
            preparedStatement.setString(7, member.getMemberType());
            preparedStatement.setString(8, member.getMemberID());
            
            status = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Üye düzenleme işlemi sırasında bir hata oluştu: " + e.getMessage());
        }
        
        return status;
    }

    public static int deleteMember(Member member) throws ClassNotFoundException {
        System.out.println("'MemberDAO' üzerinden yazılı üye silme fonksiyonu olan 'deleteMember()' çalıştırıldı.");
        Connection connnection = AccessLayer.getConnection();
        PreparedStatement preparedStatement;
        PreparedStatement preparedStatement1;

        try {
            preparedStatement1 = connection.prepareStatement("SELECT * FROM Uye WHERE Uye_id = ?");
            preparedStatement1.setString(1, member.getMemberID());

            status = -1;
            ResultSet resultSet = preparedStatement1.executeQuery();
            if (resultSet.next()) {
                System.out.println("id olmasa bile çalışacak mı?");
                status = 0;
            }
            
            if(status==0){
                preparedStatement = connection.prepareStatement("DELETE FROM Uye WHERE uye_id = ?");
                preparedStatement.setString(1, member.getMemberID());
                
                status = preparedStatement.executeUpdate(); 
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Üye silme işlemi sırasında bir hata oluştu: " + e.getMessage());
        }

        return status;
    }
}