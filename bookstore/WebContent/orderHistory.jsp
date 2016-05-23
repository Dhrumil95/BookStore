<%-- 
    Document   : orderHistory
    Created on : Feb 29, 2016, 11:58:11 PM
    Author     : Dhrumil
--%>

<%@page import="helperclasses.*"%>
<!DOCTYPE html>
<%
    Connect con = new Connect();

    java.sql.ResultSet resultset = con.stmt.executeQuery("SELECT * FROM OrderHistory H, users I, books B WHERE I.user_id = H.user_id AND B.isbn = H.isbn order by h.currdate DESC");
    String user_name = session.getAttribute("user_name").toString();

    String User = session.getAttribute("member_level").toString();
    if (User.equals("regular")) {
        response.sendRedirect("401.jsp");
    }

%>
<html>
    <title> Sales History </title>
    <center>


    <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
        .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 10px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
        .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 10px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
        .tg .tg-k6qo{font-size:17px;font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif !important;;vertical-align:top;text-align:center}
    </style>
<center> 
    Welcome <a> <% out.print(user_name + "   "); %>   </a>
    <a href="Logout.jsp">Click here to Logout</a>  
     <form action="ShowBooks.jsp" method="post">
            <input style = "font-size:20px" type="submit" value="Click Here To Go Back ">
     </form>
</center>
<br/>
<table class = "tg">
    <thead>
        <tr>
            <th class="tg-k6qo">Order ID</th>
            <th class="tg-k6qo">Name</th>
            <th class="tg-k6qo">UserName</th>
            <th class="tg-k6qo">Book Title</th>
            <th class="tg-k6qo">ISBN</th>
            <th class="tg-k6qo">Quantity</th>
            <th class="tg-k6qo">Total Price</th>
            <th class="tg-k6qo">Date and Time</th>
        </tr>
    </thead>
    <% while (resultset.next()) {%>			
    <tr>
        <td> <%= resultset.getString("order_id")%> </td>
        <td> <%= resultset.getString("user_name")%> </td>
        <td> <%= resultset.getString("user_username")%> </td>
        <td> <%= resultset.getString("title")%> </td>
        <td> <%= resultset.getString("isbn")%> </td>
        <td> <%= resultset.getString("quantity")%> </td>
        <td>$<%= resultset.getString("t_price")%> </td>
        <td> <%= resultset.getString("currdate")%> </td>
    </tr>
    <% }%>
</table>       
</center>
</body>
</html>
