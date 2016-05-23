<%-- 
    Document   : userManagement
    Created on : Apr 2, 2016, 3:26:23 PM
    Author     : Dhrumil
--%>

<%@page import="helperclasses.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%

        Connect conn = new Connect();
        Users user = new Users();
		Connection conec = conn.conn;
        String user_name = session.getAttribute("user_name").toString();
        String User = session.getAttribute("member_level").toString();
        if (User.equals("regular")) {
            response.sendRedirect("401.jsp");
        }

        String fullName = request.getParameter("adminfullName");
        String userName = request.getParameter("adminuserName");
        String Password = request.getParameter("adminPassword");
        String address = request.getParameter("adminaddress");
        String creditcard = request.getParameter("admincreditcard");
        String Option = request.getParameter("userLevel");
        Long creditCard;

        int err = 0;
        //out.println(fullName);
        //out.println(userName);
        //out.println(Password);
        //out.println(address);
        //out.println(creditCard);
        

        if (userName != null && Password != null) {
            String password = Password.toString();
            if (  password.matches("[0-9]+") || password.matches("[a-zA-Z]+") || password.length() < 8  ) err = 93;
			if ( err != 93 ) {
              if (creditcard.length() != 0) {
                  creditCard = Long.parseLong(creditcard);
              } else {
                  creditCard = 0000000000000000L;
              }
              password = user.md5Val(password);
              if (user.insertUseradmin(fullName.toString(), userName.toString(), address.toString(), password, creditCard, Option.toString(), conn.conn) == 0) {
                //out.println("Username Already Taken. Redirecting to Signup Page");
                  err = 1;
              }
			}
        } else {
            err = 2;
        }

    %>
    <head>
        <title>User Management</title>
    </head>
    <body>
    <center>

        <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
            .tg .tg-yw4l{vertical-align:top}
        </style>

        <h1><%  if (err == 0) {
                out.println("Account Successfully Created");
            } else if (err == 93) {
                out.println("Password Format Incorrect. Please Signup Again");
            } else if (err == 1 ) { 
                out.println("Username Already Taken. Please Signup Again");
            }%> </h1>
        Welcome <a> <% out.print(user_name + "   "); %>   </a>
        <a href="Logout.jsp">Click here to Logout</a>  
        <form action="ShowBooks.jsp" method="post">
            <input style = "font-size:20px" type="submit" value="Click Here To Go Back ">
        </form>

        <h1> User Management </h1>
        <h2> <input type="button" style="font-size:20px" value="Add a user" onclick="document.location.href = 'adminSignup.html'" /> </br> </h2>
        <form action="userManagement.jsp">
            <table class="tg">
                <tr>
                    <th class="tg-031e">Search User (username)</th>
                    <th class="tg-031e">  <input type="text" name="searchUser" id="searchUser" value="" placeholder="username"> </th>
                    <th class="tg-031e"> <button name="operation" type="submit" value="Search"> Search </button> </th>
                </tr>
            </table>
            <table class="tg">
                <%
                    String userSearch = request.getParameter("searchUser");

                    if (userSearch == null || userSearch.length() == 0) {
                        out.print("");
                    } else {
                    	PreparedStatement prestat = null;
                    	String sqlUser = "select * from users where user_username = ? ";
                        prestat = conec.prepareStatement(sqlUser);
                        prestat.setString(1, userSearch);                    	
                        java.sql.ResultSet resultset = prestat.executeQuery();

                        boolean valid = true;
                        if (!resultset.next()) {
                            valid = false;
                        }
                %>
                <% if (valid) {%>
                <tr>
                    <th class="tg-031e">User Name</th>
                    <th class="tg-yw4l">Name</th>
                    <th class="tg-yw4l">Address</th>
                    <th class="tg-yw4l">Password</th>
                    <th class="tg-yw4l">Credit Card</th>
                    <th class="tg-yw4l">Level</th>
                    <th class="tg-yw4l"> </th>
                </tr>
                <tr>

                    <td class="tg-031e" align = "center" > <%= resultset.getString("user_username")%>  </td>
                    <td class="tg-yw4l" align = "center"> <%= resultset.getString("user_name")%> </td>
                    <td class="tg-yw4l" align = "center"> <%= resultset.getString("user_address")%> </td>
                    <td class="tg-yw4l" align = "center"> <%= resultset.getString("user_password")%> </td>
                    <td class="tg-yw4l" align = "center"> <%= resultset.getString("user_creditcard")%> </td>
                    <td class="tg-yw4l" align = "center"> <%= resultset.getString("member_level")%> </td>
                    <td class="tg-yw4l" align = "center"> <button name="delete" type="submit" value="delete"> Delete </button> </td>

                </tr>
                <tr>

                    <td class="tg-yw4l" colspan="4"> <input style="width: 98%;" type="text" name="changeTxt" id="changeTxt"> </td>
                    <td class="tg-yw4l" colspan="2"> <select style="width: 98%;" name="infoModify">
                            <option value="2">Change Name</option>
                            <option value="3">Change Address</option>
                            <option value="4">Change Password</option>
                            <option value="5">Change Credit Card #</option>
                            <option value="6">Change Member Level(user_rights)</option>
                        </select></td>
                    <td class="tg-yw4l" align = "center"> <button name="change" type="submit" value="change"> Submit </button> </td>                    
                </tr>
                <% session.setAttribute("currVal", userSearch);
                        }
                    } %>
            </table>
        </form>
        <br>

        <%            String myText = request.getParameter("delete");
            if (myText == null) {
            } else if (myText.length() == 0) {
        %>
        <b>myText is empty</b>
        <% } else {%>
        <b>User Removed <%
            String usernn = session.getAttribute("currVal").toString();

            conn.stmt.executeUpdate("delete from users where user_username = '" + usernn + "' ");
            conn.stmt.executeUpdate("ALTER TABLE users AUTO_INCREMENT= 1");
            //  out.print("Called");
            //  out.println(usernn);

            %> </b>
            <%            }
            %>


        <%            String myText2 = request.getParameter("change");
            if (myText2 == null) {
            } else if (myText2.length() == 0) {
        %>
        <b>myText2 is empty</b>
        <% } else {%>
        <b>User Info Modified <%
            String usernn = session.getAttribute("currVal").toString();
            String moption = request.getParameter("infoModify");
            String tochange = request.getParameter("changeTxt");
            PreparedStatement ps = null;
			int val = 1;
            if (moption.equals("2")) {
            	
            	 String sqlQuery = "UPDATE users SET user_name = ? where user_username = ? ";
                 ps = conec.prepareStatement(sqlQuery);
                 ps.setString(1, tochange);
                 ps.setString(2, usernn);
                 ps.executeUpdate();            	
            	
            	
            } else if (moption.equals("3")) {
            	 String sqlQuery2 = "UPDATE users SET user_address = ? where user_username = ? ";
                 ps = conec.prepareStatement(sqlQuery2);
                 ps.setString(1, tochange);
                 ps.setString(2, usernn);
                 ps.executeUpdate();
            } else if (moption.equals("4")) {
            	   if (  tochange.matches("[0-9]+") || tochange.matches("[a-zA-Z]+") || tochange.length() < 8  ) val = 0;
                   if ( val != 0 ) {
                   	tochange = user.md5Val(tochange);
                   	
                   String sqlQuery3 = "UPDATE users SET user_password = ? where user_username = ? ";
                   ps = conec.prepareStatement(sqlQuery3);
                   ps.setString(1, tochange);
                   ps.setString(2, usernn);
                   ps.executeUpdate();
                   	
                   }
            } else if (moption.equals("5")) {
            	 Long creditCardval = Long.parseLong("tochange");
                 
                 
                 String sqlQuery4 = "UPDATE users SET user_creditcard = ? where user_username = ? ";
                 ps = conec.prepareStatement(sqlQuery4);
                 ps.setLong(1, creditCardval);
                 ps.setString(2, usernn);
                 ps.executeUpdate();
                 
            } else if (moption.equals("6")) {
            	  String sqlQuery5 = "UPDATE users SET member_level = ? where user_username = ? ";
                  ps = conec.prepareStatement(sqlQuery5);
                  ps.setString(1, tochange);
                  ps.setString(2, usernn);
                  ps.executeUpdate();
            }
            %> <% if (val == 0) %> <b>  Password Format Incorrect. Please try again  </b> </b>
            <%            }
            %>
    </center>
</body>
</html> 