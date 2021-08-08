/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.dao;


public interface DBIntializer {

//mysql-connector-java-5.1.49 sürümü ile bağlantı kurdu.
    String DRIVER = "com.mysql.jdbc.Driver";
    String CON_STRING = "jdbc:mysql://localhost:3306/InternshipProject_db";
    String USERNAME = "libraryAccess";
    String PASSWORD = "password";
}

//Oracle DB Express Edition 18 ile çalıştırılabildi.

/*
public interface DBIntializer {
    String DRIVER="oracle.jdbc.driver.OracleDriver";
    String CON_STRING="jdbc:oracle:thin:@192.168.24.1:1521:xe";
    String USERNAME="system";
    String PASSWORD="oracle";
}
 */
