/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.dao;

import internshipProject.model.Staff;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static internshipProject.dao.AccessLayer.connection;


public class StaffDAO {

    static int status = 0;

    public int registerStaff(Staff staff) throws ClassNotFoundException {
        System.out.println("'StaffDAO' üzerinden yazılı personel ekleme fonksiyonu olan 'registerStaff()' çalıştırıldı.");
        Connection connection = AccessLayer.getConnection();
        PreparedStatement preparedStatement;

        try {
            preparedStatement = connection.prepareStatement("INSERT INTO Personel VALUES(?, ?, ?, ?, ?, ?, ?)");
            int nextvalue1 = AccessLayer.getPrimaryKey();
            preparedStatement.setInt(1, nextvalue1);
            preparedStatement.setString(2, staff.getStaffLoginID());
            preparedStatement.setString(3, staff.getStaffPassword());
            preparedStatement.setString(4, staff.getStaffName());
            preparedStatement.setString(5, staff.getStaffGSM());
            preparedStatement.setString(6, staff.getStaffMail());
            preparedStatement.setString(7, staff.getStaffAddress());

            status = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Personel ekleme işlemi sırasında bir hata oluştu: " + e.getMessage());
        }

        return status;
    }

    public static int updateStaff(Staff staff) throws ClassNotFoundException {
        System.out.println("'StaffDAO' üzerinden yazılı personel güncelleme fonksiyonu olan 'updateStaff()' çalıştırıldı.");
        Connection connection = AccessLayer.getConnection();
        PreparedStatement preparedStatement;

        try {
            preparedStatement = connection.prepareStatement("UPDATE Personel SET personel_lid = ?, personel_sifre = ?, personel_ad = ?, personel_gsm = ?, personel_mail = ?, personel_adres = ? where personel_id = ?");
            preparedStatement.setString(1, staff.getStaffLoginID());
            preparedStatement.setString(2, staff.getStaffPassword());
            preparedStatement.setString(3, staff.getStaffName());
            preparedStatement.setString(4, staff.getStaffGSM());
            preparedStatement.setString(5, staff.getStaffMail());
            preparedStatement.setString(6, staff.getStaffAddress());
            preparedStatement.setString(7, staff.getStaffID());

            status = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Personel düzenleme işlemi sırasında bir hata oluştu: " + e.getMessage());
        }

        return status;
    }

    public static int deleteStaff(Staff staff) throws ClassNotFoundException {
        System.out.println("'StaffDAO' üzerinden yazılı personel silme fonksiyonu olan 'deleteStaff()' çalıştırıldı.");
        Connection connnection = AccessLayer.getConnection();
        PreparedStatement preparedStatement;
        PreparedStatement preparedStatement1;

        try {
            preparedStatement1 = connection.prepareStatement("SELECT * FROM Personel WHERE Personel_id = ?");
            preparedStatement1.setString(1, staff.getStaffID());

            status = -1;
            ResultSet resultSet = preparedStatement1.executeQuery();
            if(resultSet.next()) {
                status = 0;
            }
            
            if(status == 0) {
                preparedStatement = connection.prepareStatement("DELETE FROM Personel WHERE Personel_id = ?");
                preparedStatement.setString(1, staff.getStaffID());

                status = preparedStatement.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Personel silme işlemi sırasında bir hata oluştu: " + e.getMessage());
        }

        return status;
    }
}