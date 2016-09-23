<%-- 
    Document   : address
    Created on : 22 Sep, 2016, 4:21:39 PM
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
       
       
        <h1>Welcome User!</h1>
        <br><br>
        <table border="0">
            <tr><td>username :</td>
                <td>${user.name}</td></tr>
        <tr>
            <td>contact </td>
            <td>${user.phone}</td>
        </tr>
        <tr>
            <td>Address 1</td><td> <input type="text" name="address1"></td></tr>
        <tr><td>
                Address 2</td><td> <input type="text" name="address2"></td></tr>
        <tr><td>
                Address 3 </td> <td><input type="text" name="address3"></td></tr>
        </table>
        <br>
        <input type="submit" value="submit">
    </body>
</html>
