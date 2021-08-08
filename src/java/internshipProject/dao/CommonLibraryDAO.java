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


public class CommonLibraryDAO {

    static int status = 0;

    public static int updateLending(String teslimID) {
        Connection connection = AccessLayer.getConnection();
        PreparedStatement preparedStatement;
        PreparedStatement preparedStatement1;
        PreparedStatement preparedStatement2;
        String kitapID = "";

        try {
            preparedStatement1 = connection.prepareStatement("SELECT kitap_id FROM KitapDurum WHERE kitapDurum_id = ?");
            preparedStatement1.setString(1, teslimID);

            status = -1;
            ResultSet resultSet = preparedStatement1.executeQuery();
            if (resultSet.next()) {
                kitapID = resultSet.getString(1);
                status = 0;
            }

            if (status == 0) {
                preparedStatement = connection.prepareStatement("UPDATE kitapDurum SET kitapDurum_teslimDurumu = 1 where kitapDurum_id = ? and kitapDurum_teslimDurumu = 0");
                preparedStatement.setString(1, teslimID);
                status = preparedStatement.executeUpdate();
                preparedStatement2 = connection.prepareStatement("UPDATE Kitap SET kitap_mevcutSayi = kitap_mevcutSayi+1 where kitap_id = ?");
                preparedStatement2.setString(1, kitapID);
                preparedStatement2.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("'CommonLibraryDAO' sınıfı, 'updateLending()' fonksiyonuna göre kitap teslim alma işlemi sırasında bir hata oluştu:" + e.getMessage());
        }
        return status;
    }

    public static int addLending(String LLmemberID, String LLbookID) {
        Connection connection = AccessLayer.getConnection();
        PreparedStatement preparedStatement;
        PreparedStatement preparedStatement1;
        PreparedStatement preparedStatement2;
        PreparedStatement preparedStatement3;
        PreparedStatement preparedStatement4;
        PreparedStatement preparedStatement5;
        System.out.println("DEĞERLER LLmemberID: "+ LLmemberID +" LLbookID: "+LLbookID);

        try {
            preparedStatement1 = connection.prepareStatement("SELECT * FROM Uye WHERE Uye_id = ?");
            preparedStatement1.setString(1, LLmemberID);
            ResultSet resultSet1 = preparedStatement1.executeQuery();

            if (resultSet1.next()) {
                System.out.println("'CommonLibraryDAO' sınıfı, 'addLending()' fonksiyonuna göre: Üye mevcut.");
                preparedStatement2 = connection.prepareStatement("SELECT * FROM Kitap WHERE Kitap_id = ?");
                preparedStatement2.setString(1, LLbookID);
                ResultSet resultSet2 = preparedStatement2.executeQuery();

                if (resultSet2.next()) {
                    System.out.println("'CommonLibraryDAO' sınıfı, 'addLending()' fonksiyonuna göre: Kitap mevcut.");
                    preparedStatement3 = connection.prepareStatement("SELECT * FROM Uye where uye_id=? && uye_yasakDurumu=0");
                    preparedStatement3.setString(1, LLmemberID);
                    ResultSet resultSet3 = preparedStatement3.executeQuery();

                    if (resultSet3.next()) {
                        System.out.println("'CommonLibraryDAO' sınıfı, 'addLending()' fonksiyonuna göre: Üyenin yasağı bulunmuyor.");
                        preparedStatement4 = connection.prepareStatement("SELECT * FROM Kitap WHERE kitap_id = ? AND kitap_mevcutSayi>=1");
                        preparedStatement4.setString(1, LLbookID);
                        ResultSet resultSet4 = preparedStatement4.executeQuery();

                        if (resultSet4.next() == true) {
                            System.out.println("'CommonLibraryDAO' sınıfı, 'addLending()' fonksiyonuna göre: Kitap yeterli sayıda mevcut.");
                            preparedStatement = connection.prepareStatement("INSERT INTO kitapDurum VALUES(?, ?, ?, CURDATE() , CURDATE() + INTERVAL 15 DAY, 0)");
                            int nextvalue1 = AccessLayer.getPrimaryKey();
                            preparedStatement.setInt(1, nextvalue1);
                            preparedStatement.setString(2, LLmemberID);
                            preparedStatement.setString(3, LLbookID);
                            status = preparedStatement.executeUpdate();
                            preparedStatement5 = connection.prepareStatement("UPDATE Kitap SET kitap_mevcutSayi = kitap_mevcutSayi-1 where kitap_id = ?");
                            preparedStatement5.setString(1, LLbookID);
                            preparedStatement5.executeUpdate();
                        } else {
                            status = -2;
                            System.out.println("'CommonLibraryDAO' sınıfı, 'addLending()' fonksiyonuna göre: Kitap mevcut değil.");
                        }
                    } else {
                        status = -3;
                        System.out.println("'CommonLibraryDAO' sınıfı, 'addLending()' fonksiyonuna göre: Üyenin yasağı var.");
                    }
                } else {
                    status = -4;
                    System.out.println("'CommonLibraryDAO' sınıfı, 'addLending()' fonksiyonuna göre: Kitap bulunamadı.");
                }

            } else {
                status = -5;
                System.out.println("'CommonLibraryDAO' sınıfı, 'addLending()' fonksiyonuna göre: Üye bulunamadı.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("'CommonLibraryDAO' sınıfı, 'addLending()' fonksiyonuna göre ödünç verme işlemi sırasında bir hata oluştu: " + e.getMessage());
        }
        return status;
    }
    
    public static int addAuthor(String authorName) {
        Connection con = AccessLayer.getConnection();
        PreparedStatement ps;

        try {
            ps = con.prepareStatement("INSERT INTO Yazar VALUES(?, ?)");
            int nextvalue1 = AccessLayer.getPrimaryKey();
            ps.setInt(1, nextvalue1);
            ps.setString(2, authorName);

            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Yazar ekleme işlemi sırasında bir hata oluştu: " + e.getMessage());
        }

        return status;
    }

    public static int addPublisher(String publisherName, String publisherAddress) {
        Connection con = AccessLayer.getConnection();
        PreparedStatement ps;

        try {
            ps = con.prepareStatement("INSERT INTO YayinEvi VALUES(?, ?, ?)");
            int nextvalue1 = AccessLayer.getPrimaryKey();
            ps.setInt(1, nextvalue1);
            ps.setString(2, publisherName);
            ps.setString(3, publisherAddress);

            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Yayınevi ekleme işlemi sırasında bir hata oluştu: " + e.getMessage());
        }

        return status;
    }

    public static int addTranslator(String translatorName) {
        Connection con = AccessLayer.getConnection();
        PreparedStatement ps;

        try {
            ps = con.prepareStatement("INSERT INTO Cevirmen VALUES(?, ?)");
            int nextvalue1 = AccessLayer.getPrimaryKey();
            ps.setInt(1, nextvalue1);
            ps.setString(2, translatorName);

            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Çevirmen ekleme işlemi sırasında bir hata oluştu: " + e.getMessage());
        }

        return status;
    }

}
