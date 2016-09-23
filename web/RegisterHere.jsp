<%-- 
    Document   : RegisterHere
    Created on : 23 Sep, 2016, 3:51:42 PM
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
        <form action="register" method="post">
        <h1 align="center">Register Here!</h1>
        
  <br>
       
        <br><br>
        <table border="0" align="center">
            <tr><td>Username </td> <td><input type="text" name="reg_uname"></td></tr>
      
            <tr><td>Mobile number </td><td><input type="text" name="reg_phone"></td></tr>
            <tr><td>
                    Password </td><td> <input type="password" name="reg_pass"></td>
            </tr>
       
            <tr></tr><tr></tr>
        <tr><td colspan="2" align="center">
                <input type="submit" value="submit"></td></tr>
         
        </table>
        </form>
    </body>
</html>
