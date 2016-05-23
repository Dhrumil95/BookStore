<%-- 
    Document   : 401
    Created on : Apr 1, 2016, 1:18:31 AM
    Author     : Dhrumil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>401 Error</title>
    </head>

    <body>
        <style type="text/css">
            body,
            html {
                padding: 0;
                margin: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
                background-color: rgba(255, 130, 45, 0.85);
                font-family: sans-serif;
                color: #fff
            }

            html {
                background: url('https://static.pexels.com/photos/26499/pexels-photo-large.jpg');
                background-size: cover;
                background-position: bottom
            }

            .error {
                text-align: center;
                padding: 16px;
                position: relative;
                top: 50%;
                transform: translateY(-50%);
                -webkit-transform: translateY(-50%)
            }

            h1 {
                margin: -10px 0 -30px;
                font-size: calc(17vw + 40px);
                opacity: .8;
                letter-spacing: -17px;
            }

        </style>
        <div class="error">
            <h1>401</h1>
            <p>Sorry, You Are Not Authorized To Access/View This Page</p>
            <form action="ShowBooks.jsp" method="post">
                <input style = "font-size:20px" type="submit" value="Click Here to Go Back (ShowBooks) ">
            </form> 

        </div>  
    </body>
</html>
