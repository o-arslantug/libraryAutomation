/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.dao;

import java.sql.*;


public class AccessLayer {

    private AccessLayer() {
        System.out.println("AccessLayer nesnesi oluşturuldu.");
    }

    public static Connection connection;

    static {
        try {
            Class.forName(DBIntializer.DRIVER);
            connection = DriverManager.getConnection(DBIntializer.CON_STRING, DBIntializer.USERNAME, DBIntializer.PASSWORD);
            System.out.println("Bağlantı başarılı!");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();

        } catch (SQLException e) {
            System.out.println("Bağlantı başarısız!");
        }
    }

    public static Connection getConnection() {
        return connection;
    }

    public static int getPrimaryKey() {
        int nextvalue = 0;
        Connection connection = AccessLayer.getConnection();
        PreparedStatement preparedStatement;

        try {
            preparedStatement = connection.prepareStatement("select Javatpoint.nextval from dual");
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            nextvalue = resultSet.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nextvalue;
    }
}
