<%-- 
    Document   : orderPlaced
    Created on : Feb 29, 2016, 11:50:14 PM
    Author     : Dhrumil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="index.html" %>
<%@page import="helperclasses.*"%>

<!DOCTYPE html>
<html>
    <%
        Connect con = new Connect();
        Order orders = new Order();
        String userName = session.getAttribute("username").toString();
        String CID = orders.getID(userName, con.stmt);

        orders.placeOrderHistory(con.stmt);
        orders.orderTruncate(CID, con.stmt);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Order Placed</title>
    </head>
    <body>
        <h1>Thank you! Your Order Has Been Finalized!</h1>
        </br><a href="ShowBooks.jsp">Go Back</a>
        </br><a href="Logout.jsp">Logout</a>
    </body>
</html>
