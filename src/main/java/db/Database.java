package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {

    static public Connection con=null;

    public static Connection getCon() throws Exception{
        if(con==null  || con.isClosed()){
            Class.forName("com.mysql.cj.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/application","root","system");
        }
        return con;
    }
}
