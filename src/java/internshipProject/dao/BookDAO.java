/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.dao;

import static internshipProject.dao.AccessLayer.connection;
import internshipProject.model.Book;
import java.sql.*;


public class BookDAO {

    static int status = 0;

    public int addBook(Book book) throws ClassNotFoundException {
        System.out.println("'BookDAO' üzerinden yazılı kitap ekleme fonksiyonu olan 'addBook()' çalıştırıldı.");
        Connection connection = AccessLayer.getConnection();
        PreparedStatement preparedStatement;

        try {
            preparedStatement = connection.prepareStatement("INSERT INTO Kitap VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            int nextvalue1 = AccessLayer.getPrimaryKey();
            preparedStatement.setInt(1, nextvalue1);
            preparedStatement.setString(2, book.getBookName());
            preparedStatement.setString(3, book.getBookISBN());
            preparedStatement.setString(4, book.getBookPublishingYear());
            preparedStatement.setString(5, book.getBookTranslatorID());
            preparedStatement.setString(6, book.getBookPublisherID());
            preparedStatement.setString(7, book.getBookAuthorID());
            preparedStatement.setString(8, book.getBookCategory());
            preparedStatement.setString(9, book.getBookLocation());
            preparedStatement.setString(10, book.getBookCurrentNumber());

            status = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Kitap ekleme işlemi sırasında bir hata oluştu: " + e.getMessage());
            return -1;
        }

        return status;
    }

    public int updateBook(Book book) throws ClassNotFoundException {
        System.out.println("'BookDAO' üzerinden yazılı kitap güncelleme fonksiyonu olan 'updateBook()' çalıştırıldı.");
        Connection connection = AccessLayer.getConnection();
        PreparedStatement preparedStatement;
        PreparedStatement preparedStatement1;

        try {
            preparedStatement1 = connection.prepareStatement("SELECT * FROM Kitap WHERE Kitap_id = ?");
            preparedStatement1.setString(1, book.getBookID());

            status = -1;

            ResultSet resultSet = preparedStatement1.executeQuery();
            if (resultSet.next()) {
                status = 0;
            }

            if (status == 0) {
                preparedStatement = connection.prepareStatement("UPDATE Kitap SET kitap_ad = ?, kitap_isbn = ?, kitap_basimYili = ?, kitap_cevirmenId = ?, kitap_yayinEviId = ?, kitap_yazarId = ?, kitap_kategori = ?, kitap_konum = ?, kitap_mevcutSayi = ? where kitap_id = ?");
                preparedStatement.setString(1, book.getBookName());
                preparedStatement.setString(2, book.getBookISBN());
                preparedStatement.setString(3, book.getBookPublishingYear());
                preparedStatement.setString(4, book.getBookTranslatorID());
                preparedStatement.setString(5, book.getBookPublisherID());
                preparedStatement.setString(6, book.getBookAuthorID());
                preparedStatement.setString(7, book.getBookCategory());
                preparedStatement.setString(8, book.getBookLocation());
                preparedStatement.setString(9, book.getBookCurrentNumber());
                preparedStatement.setString(10, book.getBookID());

                status = preparedStatement.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Kitap düzenleme işlemi sırasında bir hata oluştu:" + e.getMessage());
            return -1;
        }
        return status;
    }

    public static int deleteBook(Book book) throws ClassNotFoundException {
        System.out.println("'BookDAO' üzerinden yazılı kitap silme fonksiyonu olan 'deleteBook()' çalıştırıldı.");
        Connection connnection = AccessLayer.getConnection();
        PreparedStatement preparedStatement;
        PreparedStatement preparedStatement1;

        try {
            preparedStatement1 = connection.prepareStatement("SELECT * FROM Kitap WHERE Kitap_id = ?");
            preparedStatement1.setString(1, book.getBookID());

            status = -1;
            ResultSet resultSet = preparedStatement1.executeQuery();
            if (resultSet.next()) {
                status = 0;
            }

            if (status == 0) {
                preparedStatement = connection.prepareStatement("DELETE FROM Kitap where kitap_id = ?");
                preparedStatement.setString(1, book.getBookID());

                status = preparedStatement.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Kitap silme işlemi sırasında bir hata oluştu: " + e.getMessage());
        }

        return status;
    }

}
