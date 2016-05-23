/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helperclasses;

/**
 *
 * @author Dhrumil
 */
import java.sql.*;
import java.sql.Timestamp;
import java.util.Random;

public class Order
{
	public Order() {}
        
        public int gen() {
            Random r = new Random( System.currentTimeMillis() );
            return ((1 + r.nextInt(2)) * 10000 + r.nextInt(10000));
        }
	
        public String getID (String username, Statement stmt ) {
            
            String sql = "SELECT * from users WHERE user_username = '"+username+"' ";
            String output = "";
            ResultSet rs=null;
            
            try {
			rs=stmt.executeQuery(sql);
			
			while (rs.next())
				output += rs.getString("user_id");
			
			rs.close();
		} catch(Exception e) {
			System.out.println("Could not execute query.");
		} finally {
			try {
				if (rs != null && !rs.isClosed())
					rs.close();
			} catch(Exception e) {
				System.out.println("Unable to resultset.");
			}
		}
		
		return output;
            
        }
        
        public float price_book(String isbn, int quantity, Statement stmt)
	{
		String sql = "SELECT price FROM books where isbn = '"+ isbn +"'";
		float output = 0;
		ResultSet rs=null;

		try { 
                
                 rs=stmt.executeQuery(sql);
                   while (rs.next())    
                        output = (float)(quantity * rs.getFloat("price"));
			
		rs.close();
		} catch(Exception e) {
			System.out.println("Unable to execute the query");
		} finally {
			try {
				if (rs != null && !rs.isClosed())
					rs.close();
			} catch(Exception e) {
				System.out.println("Unable to close resultset");
			}
		}
		
		return (Math.round(output * 100.0f) / 100.0f) ;
	}

        public float getTotal(String CID, Statement stmt)
	{
		String sql = "SELECT t_price FROM orders where user_id = "+CID+"";
		float output = 0;
		ResultSet rs=null;
               
		try {
			rs=stmt.executeQuery(sql);
                        while (rs.next())
                            output += rs.getFloat("t_price");
			
			rs.close();
		} catch(Exception e) {
			System.out.println("Unable to execute the query");
		} finally {
			try {
				if (rs != null && !rs.isClosed())
					rs.close();
			} catch(Exception e) {
				System.out.println("Unable to close resultset");
			}
		}
		
		return (Math.round(output * 100.0f) / 100.0f);
	}
        
	public void placeOrder(int OID, String cid, String ISBN, int quantity, float t_price, Statement stmt)
	{
		Timestamp  sqlDate = new java.sql.Timestamp(new java.util.Date().getTime());
		String sql  = "INSERT INTO orders(order_id, isbn , user_id , quantity, currdate, t_price) VALUES ( '"+OID+"' , '"+ISBN+"', "+cid+", "+quantity+", '"+sqlDate+"', '"+t_price+"')";
		
		try {
			stmt.execute(sql);
		} catch(Exception e) {
			System.out.println("Unable to execute the query");
		}
	}
        
        public void orderTruncate(String cid, Statement stmt)
	{
		//String sql1 = "truncate table orders";
        String sql1 = " DELETE FROM orders WHERE user_id = '"+ cid  +"' ";
        
                try {
                        stmt.execute(sql1);
		} catch(Exception e) {
			System.out.println("Unable to execute the query");
		}
	}
        
        
        public void placeOrderHistory(Statement stmt)
	{
		String sql  = "INSERT INTO orderhistory SELECT * FROM orders";

                try {
			stmt.execute(sql);
		} catch(Exception e) {
			System.out.println("Unable to execute the query");
		}
	}
}
