<%-- 
    Document   : AdminProfile
    Created on : 27 Sep, 2016, 2:55:32 PM
    Author     : neha
--%>

<%@page import="add_mgmnt.RegisterUserBean"%>
<%@page import="add_mgmnt.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">Hello Admin!</h1>
        <br><br>
        <h2 align="center">List of users</h2>
        <% UserBean all_users=(UserBean)application.getAttribute("userdetails"); 
        int num=all_users.getUserList().size();
        for(int i=0;i<num;i++){
            RegisterUserBean ob=all_users.getUserList().get(i);
        %>
        <br><br><br>
        <table border="0"  style="margin: auto;display: box; width: 60%;">
            
            <tr><td style="text-align: center;width: 20%"><%=i+1 %></td>
                <td style="text-align: left;width: 40%">UserName</td>   <td style="text-align: left;width: 80%"><%=ob.getName() %></td>
            </tr>
            <tr><td></td>
                <td>Contact No.</td><td><%= ob.getPhone() %></td>
            </tr>
            <tr><td></td>
                <td colspan="2">Address</td>
            </tr>
            
            <% for(int k=0;k<ob.getAddress().size();k++) {%><tr><td></td><td></td><td><%=ob.getAddress().get(k)%></td></tr><% } %>
            
                
                
           
         </table>
        <%
            
        }
        
        %>
       
        <h1></h1><br>
        <h2></h2>
        
        
        
        
    </body>
</html>
