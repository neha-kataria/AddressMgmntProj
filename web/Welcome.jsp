<%-- 
    Document   : Welcome
    Created on : 23 Sep, 2016, 3:07:41 PM
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
        <h1 align="center">WELCOME USER!</h1>
       <%
    if(null!=request.getAttribute("Success"))
    {
        out.println("<h3 align=\"center\">"+request.getAttribute("Success")+"</h3>");
    }
%>
 <%
    if(null!=request.getAttribute("Err_login"))
    {
        out.println("<h3 align=\"center\">"+request.getAttribute("Err_login")+"</h3>");
    }
%>
        <br><br>
        <form action="login_auth" method="post">
  <h1 align="center"> Log In</h1><br><br>
        
  <table border="0" align="center">
            <tr><td>Username </td> <td><input type="text" name="log_uname"></td></tr>
      
          
            <tr><td>
                    Password </td><td> <input type="password" name="log_pass"></td>
            </tr>
            <tr> </tr><tr></tr><tr></tr>
            <tr><td colspan="2" align="center">
                    <input type="submit" value="login"></td></tr>
            
            <tr><td colspan="2" align="center"><a href="RegisterHere.jsp" >New User? Register here first!</a></td></tr>
             
        
        </table>

        </form>
        
    </body>
</html>
