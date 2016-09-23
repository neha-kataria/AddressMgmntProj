<%-- 
    Document   : UserProfile
    Created on : 23 Sep, 2016, 4:02:23 PM
    Author     : neha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">My Profile!</h1>
        <table border="0" align="center">
            <tr><td>username :</td>
                <td>${user.name}</td></tr>
        <tr>
            <td>contact </td>
            <td>${user.phone}</td>
        </tr>
        <tr><td>Address</td>
            <td>${user.address}</td>
        </table>
    </body>
</html>
