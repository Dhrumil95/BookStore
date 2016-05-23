<%@page import="helperclasses.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Validate Login </title>
    </head>
    <body>

        <%
            Connect con = new Connect();
            String sLoginErr = "";
            sLoginErr = Login(request, response, session, out, con.conn, con.stmt);
            if ("sendRedirect".equals(sLoginErr)) {
                return;
            }

        // test login - admin:test1234

        %>

        <%!
    		Users user = new Users();
            String Login(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, javax.servlet.http.HttpSession session, javax.servlet.jsp.JspWriter out, java.sql.Connection conn, java.sql.Statement stat) throws java.io.IOException {
                String sLoginErr = "";
                try {
                	PreparedStatement ps = null;
                    String spassword = request.getParameter("password");
                    String sPassword = user.md5Val(spassword);
                    String sLogin = request.getParameter("username");
                    String sqlQuery = "select user_name, member_level, user_id from users where user_username = ? and binary user_password= ? ";
                    ps = conn.prepareStatement(sqlQuery);
                    ps.setString(1, sLogin);
                    ps.setString(2, sPassword);
                    
                    java.sql.ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        session.setAttribute("UserID", rs.getString(1));
                        session.setAttribute("username", sLogin);
                        session.setAttribute("password", sPassword);
                        session.setAttribute("member_level", rs.getString("member_level"));
                        session.setAttribute("user_name", rs.getString("user_name"));

                        try {
                            if (stat != null) {
                                stat.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        } catch (java.sql.SQLException ignore) {
                        }
                        response.sendRedirect("ShowBooks.jsp");
                        return "sendRedirect";
                    } else {
                        response.sendRedirect("index.html");
                        return "sendRedirect";
                    }
                } catch (Exception e) {
                    out.println(e.toString());
                }
                return (sLoginErr);
            }
        %>
    </body>
</html>