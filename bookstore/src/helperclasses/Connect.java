package helperclasses;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
/**
 *
 * @author Dhrumil
 */
public class Connect {
    public Connection conn;
    public Statement stmt;

    public Connect() throws Exception {
        try {
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             String url = "jdbc:mysql://localhost/bookstore?allowMultiQueries=true";
             String userName = "dpate85";
             String password = "1234";
			
	     conn = DriverManager.getConnection(url, userName, password);
	     stmt = conn.createStatement();

             } catch (Exception e) {
		System.err.println("Unable to open mysql jdbc connection. The error is as follows,\n");
		System.err.println(e.getMessage());
		throw (e);
            }

	}
}
