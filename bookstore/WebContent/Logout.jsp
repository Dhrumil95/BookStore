<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Logout Page </title>
    </head>
    <body>
        <%
            session.removeAttribute("username");
            session.removeAttribute("password");
            session.invalidate();
        %>
        <h1>You have successfully logged out!</h1>
        <form action="index.html" method="post">
            <br/><input type="submit" value="Click here to login">
        </form>    
    </body>
</html>



