<!DOCTYPE html>

<%-- 
    Document   : AddUser
    Created on : Mar 30, 2016, 8:45:16 PM
    Author     : Dhrumil
--%>

<%@page import="helperclasses.*"%>
<%
    Connect conn = new Connect();
    Users user = new Users();

    String fullName = request.getParameter("fullName").toString();
    String userName = request.getParameter("userName").toString();
    String Password = request.getParameter("Password").toString();
    String address = request.getParameter("address").toString();
    String creditcard = request.getParameter("creditcard").toString();
    Long creditCard;
    if (creditcard.length() != 0) {
        creditCard = Long.parseLong(creditcard);
    } else {
        creditCard = 0000000000000000L;
    }

    int err = 0;
    //out.println(fullName);
    //out.println(userName);
    //out.println(Password);
    //out.println(address);
    //out.println(creditCard);

   if (  Password.matches("[0-9]+") || Password.matches("[a-zA-Z]+") || Password.length() < 8  ) err = 99;
   else err = 3;
   
    if (userName != "" && Password != "" && err != 99) {
    	String md5Pass = user.md5Val(Password);
        if (user.insertUser(fullName, userName, address, md5Pass , creditCard, conn.conn) == 0) {
            //out.println("Username Already Taken. Redirecting to Signup Page");
            err = 1;
        } else err = 0;
    }
    else {
        err = 2;
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Book Store </title>
    </head>
    <body>
    <center>
        <h1><%  if (err == 0) {
                out.println("Account Successfully Created");
            } else if (err == 1) {
                out.println("Username Already Exists. Please Signup Again");
            } else if ( err == 2 ) {
                out.println("Password Format Incorrect. Please Signup Again");
            }  %></h1>
        </br>
        <h1>Login Page</h1>
        <form action="Login.jsp" method="post">
            <br/>Username: 
            <br/><input type="text" name="username">
            <br/>Password:
            <br/><input type="password" name="password">
            <br/>
            <br/><input type="submit" value="Submit">
        </form>
        <form action="signup.html" method="post">
            </br><input type="submit" value="Sign up">
        </form>
        <br/>
          <a href="ShowBooks.jsp">Books List!</a> 
    </center>
</body>
</html>




