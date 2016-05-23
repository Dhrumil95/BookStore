
<%-- 
    Document   : OrderStatistics2
    Created on : Apr 1, 2016, 5:03:43 PM
    Author     : Dhrumil
--%>

<%@page import="helperclasses.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connect conn = new Connect();
    Connection con = conn.conn;
    String user_name = session.getAttribute("user_name").toString();
    String User = session.getAttribute("member_level").toString();
    if (User.equals("regular")) {
        response.sendRedirect("401.jsp");
    }
%>

<html>
    <head>
        <title>Order Statistics</title>
    </head>
    <body>
    <center>
        Welcome <a> <% out.print(user_name + "   "); %>   </a>
        <a href="Logout.jsp">Click here to Logout</a>  
        <form action="ShowBooks.jsp" method="post">
            <input style = "font-size:20px" type="submit" value="Click Here To Go Back ">
        </form>
        <h2> Statistics about orders  </h2>
        <form action="OrderStatistics2.jsp">
            <table border="1">
                <tr>
                    <th align="left"> 1) the number of orders and total sales between two dates </th>
                    <td><input type="text" name="date1" id="date1" value="" placeholder="YYYY-MM-DD" ></td>
                    <td><input type="text" name="date2" id="date2" value="" placeholder="YYYY-MM-DD" ></td>
                    <td> </td>
                    <td><input type="Submit" value="Click to Submit"></td>
                </tr>
                <tr>
                    <th align="left">2) given a book’s title, the sales of that book between two dates  </th>
                    <td><input type="text" name="title" id="title" value="" placeholder="Book Title" ></td>
                    <td><input type="text" name="tdate1" id="tdate1" value="" placeholder="YYYY-MM-DD" ></td>
                    <td><input type="text" name="tdate2" id="tdate2" value="" placeholder="YYYY-MM-DD" ></td>
                    <td><input type="Submit" value="Click to Submit"></td>
                </tr>
                <tr>
                    <th align="left">3) given an author’s name, the sales of books from that author between two dates,  </th>
                    <td><input type="text" name="author" id="author" value="" placeholder="Author" ></td>
                    <td><input type="text" name="adate1" id="adate1" value="" placeholder="YYYY-MM-DD" ></td>
                    <td><input type="text" name="adate2" id="adate2" value="" placeholder="YYYY-MM-DD" ></td>
                    <td><input type="Submit" value="Click to Submit"></td>
                </tr>
                <tr>
                    <th align="left">4) a list of the books ranked by sales, between two dates </th>
                    <td><input type="text" name="sdate1" id="sdate1" value="" placeholder="YYYY-MM-DD" ></td>
                    <td><input type="text" name="sdate2" id="sdate2" value="" placeholder="YYYY-MM-DD" ></td>
                    <td>
                        <select name="sorting">
                            <option value="1">Amount of Money</option>
                            <option value="2">Number of Orders</option>
                        </select>
                    </td>
                    <td><input type="Submit" value="Click to Submit"></td>
                </tr>
            </table>
        </form>
        <br>
        <%
            String date1 = request.getParameter("date1");
            String date2 = request.getParameter("date2");
            if (date1 == null || date2 == null) {
            } else if (date1.length() == 0 || date2.length() == 0) {
        %>
        <% } else {%>
        <%
            String date3 = date1 + "23:59:59";
            String date4 = date2 + "23:59:59";
            PreparedStatement ps = null;
            String sqlQuery1 = "select Count(*) as TotalOrders, Sum(t_price) as TotalSales from OrderHistory where currdate > ? and currdate < ? ";
            ps = con.prepareStatement(sqlQuery1);
            ps.setString(1, date3);
            ps.setString(2, date4);
            
            java.sql.ResultSet resultset = ps.executeQuery();
        %>
        <h3> Displaying Results for dates between <%= date1%> and <%= date2%>  </h3> </br>

        <h2>Total Orders :  <% if (resultset.next())%>			
            <%= resultset.getInt("TotalOrders")%> </h2>

        <h2>Total Sales: $<%= resultset.getFloat("TotalSales")%> </h2>

        <%
            }
        %>
        <%
            String title = request.getParameter("title");
            String tdate1 = request.getParameter("tdate1");
            String tdate2 = request.getParameter("tdate2");
            if (title == null || tdate1 == null || tdate2 == null) {
            } else if (title.length() == 0 || tdate1.length() == 0 || tdate2.length() == 0) {
        %>
        <% } else {%>
        <%
        	PreparedStatement ps = null;
            String tdate3 = tdate1 + "23:59:59";
            String tdate4 = tdate2 + "23:59:59";
            String sqlQuery2 = "select Sum(t_price) as TotalSales from OrderHistory OH, Books B where B.title = ? and B.isbn = OH.isbn and currdate > ? and currdate < ? ";
            ps = con.prepareStatement(sqlQuery2);
            ps.setString(1, title);
            ps.setString(2, tdate3);
            ps.setString(3, tdate4);
            
            java.sql.ResultSet resultset = ps.executeQuery();
        %>
        <h3> Displaying Results for <%= title%> between <%= tdate1%> and <%= tdate2%>  </h3> </br>
        <h2>Total Sales
            <% if (resultset.next())%>			
            : $<%= resultset.getFloat("TotalSales") %> </h2>
            <%
                }
            %>
            <%
                String author = request.getParameter("author");
                String adate1 = request.getParameter("adate1");
                String adate2 = request.getParameter("adate2");
                if (title == null || adate1 == null || adate2 == null) {
                } else if (author.length() == 0 || adate1.length() == 0 || adate2.length() == 0) {
            %>
            <% } else {%>
            <%
        		PreparedStatement ps = null;
                String adate3 = adate1 + "23:59:59";
                String adate4 = adate2 + "23:59:59";
                String sqlQuery3 = "select Sum(t_price) as TotalSales from OrderHistory OH, authors A, bookAuthor BA where A.author_name = ? and A.id = BA.Author_id and BA.ISBN = OH.isbn and currdate > ? and currdate < ? ";
                ps = con.prepareStatement(sqlQuery3);
                ps.setString(1, author);
                ps.setString(2, adate3);
                ps.setString(3, adate4);
                
                java.sql.ResultSet resultset = ps.executeQuery();
            %>
        <h3> Displaying Results for <%= author%> between <%= adate1%> and <%= adate2%>  </h3> </br>
        <h2>Total Sales
            <% if (resultset.next())%>			
            : $<%= resultset.getFloat("TotalSales") %> </h2>
            <%
                }
            %>
            <%
                String Option = request.getParameter("sorting");
                String sdate1 = request.getParameter("sdate1");
                String sdate2 = request.getParameter("sdate2");
                if (sdate1 == null || sdate2 == null) {
                } else if (sdate1.length() == 0 || sdate2.length() == 0) {
            %>
            <% } else {%>
            <%
                String sdate3 = sdate1 + "23:59:59";
                String sdate4 = sdate2 + "23:59:59";
                java.sql.ResultSet resultset;
                int option = 1;
                if (Option.equals("1")) {
                	PreparedStatement ps = null;
                	String sqlQuery4 = "select B.title, OH.isbn, ROUND(Sum(OH.t_price),2) as TotalSales from OrderHistory OH, books B  where OH.isbn = B.isbn  and currdate > ? and currdate < ? group by isbn order by TotalSales DESC";
                    ps = con.prepareStatement(sqlQuery4);
                    ps.setString(1, sdate3);
                    ps.setString(2, sdate4);
                	resultset = ps.executeQuery();
                } else {
                	
                	PreparedStatement ps = null;
                	String sqlQuery5 = "select B.title, OH.isbn, Count(*) as TotalOrders from OrderHistory OH, books B  where OH.isbn = B.isbn  and currdate > ? and currdate < ? group by isbn order by TotalOrders DESC";
                    ps = con.prepareStatement(sqlQuery5);
                    ps.setString(1, sdate3);
                    ps.setString(2, sdate4);
                	resultset = ps.executeQuery();
                    option = 2;
                }
            %>
        <h3> Displaying Results for dates between <%= sdate1%> and <%= sdate2%>  </h3> </br>

        <table  border="1">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>ISBN</th>
                        <% if (option == 1) {%>
                    <th>Total Sale</th>
                        <% } else { %>
                    <th>Total Orders</th>
                        <% } %>
                </tr>
            </thead>
            <% while (resultset.next()) {%>			
            <tr>
                <td><%= resultset.getString("title")%></td>
                <td><%= resultset.getString("isbn")%></td>
                <% if (option == 1) {%>
                <td align="center">$<%= resultset.getString("TotalSales")%></td>
                <% } else {%>
                <td align="center"><%= resultset.getString("TotalOrders")%></td>
                <% } %>
            </tr>
            <% } %>
        </table> 

        <%
            }
        %>

    </center>
</body>
</html>
