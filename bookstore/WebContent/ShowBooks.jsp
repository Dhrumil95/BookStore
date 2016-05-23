<%-- 
    Document   : ShowBooks
    Created on : Feb 28, 2016, 09:23:14 PM
    Author     : Dhrumil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="helperclasses.Connect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Books Catalog</title>
    </head>
    <body>
        <%
        	String userName = "", user_name = "", member_level = ""; int signedIN = 0;
        	try {
           		 userName = session.getAttribute("username").toString();
           		 user_name = session.getAttribute("user_name").toString();
         	     member_level = session.getAttribute("member_level").toString();
        	}
        	catch ( Exception e ) { signedIN = 1; }
            //System.out.print(signedIN);
            //out.println("Welcome " + name); 
            //out.print(test);
            
            
     	   Connect con = new Connect();
           //   java.sql.ResultSet resultset = con.stmt.executeQuery("select * from books") ; 
       	   java.sql.ResultSet resultset = con.stmt.executeQuery("SELECT *, group_concat(T.author_name ORDER BY T.author_name) authors FROM books B INNER JOIN bookAuthor A ON B.isbn = A.isbn  INNER JOIN authors T ON A.Author_ID = T.id GROUP   BY B.isbn, b.Title ");


        %>
        <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 10px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 10px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
            .tg .tg-k6qo{font-size:17px;font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif !important;;vertical-align:top;text-align:center}
        </style>	
    <center> <h3>
    <% if ( signedIN == 0 ) {  %>
            Welcome <a> <% out.print(user_name + "   "); %>   </a> 
            <a href="Logout.jsp">Logout</a> 
            <% } else { %>
            Not Logged In...
            <a href="index.html"> Log in</a> 
            <% } %>
            <% if (member_level.equals("admin")) { %> 
            </br>

            <input type="button" style="font-size:20px" value="Order History By User Statistics" onclick="document.location.href = 'OrderStatistics.jsp'" />
            <input type="button" style="font-size:20px" value="Statistics about orders"  onclick="document.location.href = 'OrderStatistics2.jsp'" />
            <input type="button" style="font-size:20px" value="User Account Modification"  onclick="document.location.href = 'userManagement.jsp'" />
            <input type="button" style="font-size:20px" value="Order History of All Users"  onclick="document.location.href = 'orderHistory.jsp'" />

            <% } %>
        </h3> </center>
    <table class = "tg">
        <thead>
            <tr>
                <th class="tg-k6qo">Book Cover</th>
                <th class="tg-k6qo">Title</th>
                <th class="tg-k6qo">Author(s)</th>
                <th class="tg-k6qo">Description</th>
                <th class="tg-k6qo">Price</th>
                <th class="tg-k6qo">Quantity</th>
            </tr>
        </thead>
        <% while (resultset.next()) {%>			
        <form action="ShoppingCart.jsp" method="post">
            <tr>
                <td><img src="<%= resultset.getString("image")%>" style="height: 318px; width: 197px; "></td>
                <td><%= resultset.getString("title")%> </td>
                <td><%= resultset.getString("authors")%></td>
                <td><%= resultset.getString("description")%></td>
                <td>$<%= resultset.getFloat("price")%></td>
                <td>
                    <input type="text" name="quantity" value="">
                </td>
            <input type="hidden" name="isbn" value="<%= resultset.getString("isbn")%>">
            <td>
                <input type="submit" value="Order">
            </td>
            </tr>
        </form>
        <% }%>

    </table>
</body>
</html>