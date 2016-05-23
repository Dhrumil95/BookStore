<%@page import="helperclasses.*"%>
<%@page import="java.sql.*"%>

<%

    Connect conn = new Connect();
    Order order = new Order();
    Users user = new Users();
    Connection con = conn.conn;
    
    String user_name = session.getAttribute("user_name").toString();
    String User = session.getAttribute("member_level").toString();
    if (User.equals("regular")) {
        response.sendRedirect("401.jsp");
    }
%>

<html>
    <head>
        <title>Admin Statistics</title>
    </head>
    <body>
          <style type="text/css">
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
            .tg .tg-yw4l{vertical-align:top}
        </style>
    <center>
        Welcome <a> <% out.print(user_name + "   "); %>   </a>
        <a href="Logout.jsp">Click here to Logout</a>  
        <form action="ShowBooks.jsp" method="post">
            <input style = "font-size:20px" type="submit" value="Click Here To Go Back ">
        </form>
        <form action="OrderStatistics.jsp">
            <h2> Order By User </h2>
            <table class="tg" border = "1">
                <tr>
                    <td class="tg-031e" >Username</td>
                    <td class="tg-yw4l" ><input type="text" name="myText" id="Username" value="" placeholder=""></td>
                    <td class="tg-yw4l" >Date</td>
                    <td class="tg-yw4l" ><input type="text" name="Date" id="Date" value="" placeholder="YYYY-MM-DD"></td>

                    <td><input type="Submit" value="Click to Submit"></td>
                </tr>
            </table>
        </form>
        <br>
        <%
            String myText = request.getParameter("myText");
            String Date = request.getParameter("Date");
            if (myText == null || Date == null) {
            } else if (myText.length() == 0 || Date.length() == 0) {
        %>
        <b>Please Enter Username and Date.</b>
        <% } else { %>

        <%
            int ID = 0;
            String sID = order.getID(myText, conn.stmt);
            if (sID.equals("")) {
                ID = 0;
            } else {
                ID = Integer.parseInt(sID);
            }
            String date = Date + "23:59:59";
			
            PreparedStatement ps = null;
            String sqlSel = "select * from OrderHistory where user_id = ? and currdate > ? union all select * from Orders where user_id = ? and currdate > ? order by currdate DESC";
            ps = con.prepareStatement(sqlSel);
            ps.setInt(1, ID);
            ps.setString(2, date);
            ps.setInt(3, ID);
            ps.setString(4, date);
            
            java.sql.ResultSet resultset = ps.executeQuery() ;

        %>
        <h4> Showing Results for <%= myText%> after <%= Date%> </h4>
        <table  border = "1" >
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>ISBN</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Time Ordered</th>
                </tr>
            </thead>
            <% while (resultset.next()) {%>			
            <tr>
                <td align = "center" ><%= resultset.getString("order_id")%></td>
                <td align = "center"><%= resultset.getString("isbn")%></td>
                <td align = "center"><%= resultset.getString("quantity")%></td>
                <td align = "center"><%= resultset.getString("t_price")%></td>
                <td align = "center"><%= resultset.getString("currdate")%></td>
            </tr>
            <% } %>
        </table> 
        <%
            }
        %>
    </center>
</body>
</html> 