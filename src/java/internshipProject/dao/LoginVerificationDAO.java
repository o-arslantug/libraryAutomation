/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginVerificationDAO {
    
    public static String checkStaffLogin(String username, String password) {
        boolean status = false;
        String _booleanDeger = "0";
        Connection con = AccessLayer.getConnection();

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Personel WHERE personel_lid = ? and personel_sifre = ?");
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            status = rs.next();

            if (status == true) {
                _booleanDeger = "1";
            } else {
                _booleanDeger = "0";
            }

            if (_booleanDeger == "1") {
                PreparedStatement ps1 = con.prepareStatement("SELECT personel_ad FROM Personel WHERE personel_lid = ?");
                ps1.setString(1, username);
                ResultSet rs1 = ps1.executeQuery();
                while (rs1.next()) {
                    _booleanDeger = rs1.getString(1);
                }
            } else {
                _booleanDeger = "0";
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Hata mesajo: " + e.getMessage());
        }
        return _booleanDeger;

    }

    public static String checkUserLogin(String username, String password) {
        boolean status = false;
        String _booleanDeger = "0";
        Connection con = AccessLayer.getConnection();

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM uye WHERE uye_lid = ? and uye_sifre = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            status = rs.next();

            if (status == true) {
                _booleanDeger = "1";
            } else {
                _booleanDeger = "0";
            }

            if (_booleanDeger == "1") {
                PreparedStatement ps1 = con.prepareStatement("SELECT uye_ad FROM uye WHERE uye_lid = ?");
                ps1.setString(1, username);
                ResultSet rs1 = ps1.executeQuery();
                while (rs1.next()) {
                    _booleanDeger = rs1.getString(1);
                }
            } else {
                _booleanDeger = "0";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return _booleanDeger;
    }
}
