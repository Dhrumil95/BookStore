/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helperclasses;

import java.sql.ResultSet;
import java.sql.Statement;
import java.security.*;
import java.math.*;
import java.sql.*;

/**
 *
 * @author Dhrumil
 */
public class Users {
    
    public Users() { }
    
    public int insertUser(String Name, String userName, String address, String password, Long creditCard, Connection conn ) {
    	PreparedStatement ps = null;
        String sql  = "INSERT INTO users(user_username, user_name, user_address, user_password, user_creditcard) VALUES ( ? , ? , ? , ? , ? )";
      
        
        int valid = 1;
	try {
		  ps = conn.prepareStatement(sql);
	        ps.setString(1, userName);
	        ps.setString(2, Name);
	        ps.setString(3, address);
	        ps.setString(4, password);
	        ps.setLong(5, creditCard);
		ps.executeUpdate();
	} catch(Exception e) {
		System.out.println("Unable to execute the query");
                valid = 0;
	}
      return valid;
    }  
    
     public int insertUseradmin(String Name, String userName, String address, String password, Long creditCard, String member_level, Connection conn ) {
    	 PreparedStatement ps = null;
        String sql  = "INSERT INTO users(user_username, user_name, user_address, user_password, user_creditcard, member_level) VALUES ( ? , ? , ? , ? , ? , ? )";
	
        
        int valid = 1;
	try {
		    ps = conn.prepareStatement(sql);
	        ps.setString(1, userName);
	        ps.setString(2, Name);
	        ps.setString(3, address);
	        ps.setString(4, password);
	        ps.setLong(5, creditCard);
	        ps.setString(6, member_level);
	        ps.executeUpdate();	
		} catch(Exception e) {
		System.out.println("Unable to execute the query");
                valid = 0;
	}
      return valid;
    }  
    
    public boolean validPassword(String s) {
        String n = ".*[0-9].*";
        String a = ".*[A-Z].*";
        return s.matches(n) && s.matches(a);
    }
    
    public static String md5Val (String s) {
		try {
			MessageDigest m = MessageDigest.getInstance("MD5");
			m.update(s.getBytes(),0,s.length());
			return new BigInteger(1,m.digest()).toString(16);
		} catch (Exception e) { }
   		return "";
	}
    
    
}
