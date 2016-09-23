<%-- 
    Document   : index
    Created on : 22 Sep, 2016, 4:12:58 PM
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
        <form action="address" method="post">
            
        <div id="container" style="width:100%;">                                   
  <div id="left" style="float:left; width:50%;"> This is left panel
  <br>
        <h1>Registration</h1>
        <br><br>
        <table border="0">
            <tr><td>Username </td> <td><input type="text" name="reg_uname"></td></tr>
      
            <tr><td>Mobile number </td><td><input type="text" name="reg_phone"></td></tr>
            <tr><td>
                    Password </td><td> <input type="password" name="reg_pass"></td>
            </tr>
        </table>
        <br><br>
        
        <input type="submit" value="submit">
        </table>
  </div>       
            
  <div id="right" style="float:right; width:50%;"> This is right panel
  <br><br>
  <h1> Log In</h1><br><br>
        <table border="0">
            <tr><td>Username </td> <td><input type="text" name="log_uname"></td></tr>
      
          
            <tr><td>
                    Password </td><td> <input type="password" name="log_pass"></td>
            </tr>
        </table>
        <br><br>
        
        <input type="submit" value="login">
        </table>
  </div>                   
</div>    
       
        </form>      
        
    </body>
</html>
