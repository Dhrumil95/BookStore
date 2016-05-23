<%-- 
    Document   : ShoppingCart
    Created on : Feb 28, 2016, 12:01:13 AM
    Author     : Dhrumil
--%>

<%@page import="helperclasses.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="index.html" %>
<!DOCTYPE html>
<html>
    <%
        Connect con = new Connect();
        Order orders = new Order();
        int Quantity = 0;

        String user_name = session.getAttribute("user_name").toString();
        String userName = session.getAttribute("username").toString();
        String ISBN = (String) request.getParameter("isbn");

        if (request.getParameter("quantity").toString() == "") {
            Quantity = 1;
        } else {
            Quantity = Integer.parseInt(request.getParameter("quantity").toString());
        }

        String CID = orders.getID(userName, con.stmt);
        int OID = orders.gen();
        float price_book = orders.price_book(ISBN, Quantity, con.stmt);
        orders.placeOrder(OID, CID, ISBN, Quantity, price_book, con.stmt);
        java.sql.ResultSet resultset = con.stmt.executeQuery("SELECT * FROM books B, orders O WHERE O.user_id =" + CID + " AND B.isbn = O.isbn order by O.currdate DESC");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Shopping Cart </title>
    </head>
    <body>

        <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 10px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 10px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
            .tg .tg-k6qo{font-size:17px;font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif !important;;vertical-align:top;text-align:center}

            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
            }

            .button {
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
            }
        </style>

        <h3>  Welcome <a> <% out.print(user_name + "   "); %>   </a> 
            <a href="Logout.jsp">Logout</a> 
        </h3>
        <h2> Shopping Cart </h2>
        <h4> Items in your cart is listed here </h4>
        <form action="ShowBooks.jsp" method="post">
            <input style = "font-size:20px" type="submit" value="Click Here To Go Back ">
        </form>  

        <br/>

        <table class = "tg" >
            <thead>
                <tr>
                    <th class="tg-k6qo">Order ID</th>
                    <th class="tg-k6qo">Title</th>
                    <th class="tg-k6qo">Quantity</th>
                    <th class="tg-k6qo">Price per book</th>
                    <th class="tg-k6qo">Total Price</th>
                </tr>
            </thead>
            <% while (resultset.next()) {%>			
            <tr>
                <td><%= resultset.getString("order_id")%></td>
                <td><%= resultset.getString("title")%></td>
                <td><%= resultset.getString("quantity")%></td>
                <td>$<%= resultset.getString("price")%></td>
                <td>$<%= (resultset.getFloat("t_price"))%></td>
            </tr>
            <% } %>
        </table>
        <form style="display: inline; font-size:40px" action="orderPlaced.jsp" method="post">
            <h3> Total Price : $<% out.print((orders.getTotal(CID, con.stmt)));%> 
                <%--  <input style = "font-size:40px" type="submit" value="Checkout"> --%>
                </br><button class="button button">Checkout</button>
        </form>  
    </h3>
</body>
</html>
