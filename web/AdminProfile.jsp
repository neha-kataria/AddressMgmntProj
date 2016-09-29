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
        <title>Admin Page</title>
        <script lang="javascript">
            function showAddrPop(address) {
                //if(address.){
                
                alert("Registered Address:\n"+address);
            }
            
        </script>
    </head>
    <body>
        <h1 align="left" style="font-family: sans-serif;font-size: 28px;font-weight: bold;color: green">Welcome Admin!</h1>
        <br>
        <input type="hidden" name="admin" value="hidden" >
        <input type="button" name="admin" value="Logout" onclick="window.location='Welcome.jsp'" style="margin-left: 80%">
        <h2 align="left" style="font-family: sans-serif;font-size: 22px;font-weight: bold;color: green;margin-left: 10%;">List of users</h2>
        <% UserBean all_users=(UserBean)application.getAttribute("userdetails"); 
        if(all_users!=null){
        int num=all_users.getUserList().size();
         
       for(int i=0;i<num;i++){
            RegisterUserBean ob=all_users.getUserList().get(i);
            //ob.getAddress();
        %>
        <br><br><br>
        <table border="1"  style="margin-left: 10%;display: box; width: 40%;">
            
            <tr style="text-align: left; height:30px;">
                
                <td style="width:10%" ><%=i+1 %></td>
                <td style="width:30%">UserName :</td>  
                <td style="width:30%"><%=ob.getName() %></td>
                <td style="width:20%"><% if(ob.isLogged()){ %> Logged In<% }else{ %> Logged Out <% } %></td>
                <td style="width:30%"><input type="button" value="Address" onclick="showAddrPop('<%= ob.getAddress() %>')"></td>
                
            </tr>
          
                
           
         </table>
        <%
            }
       }
        
        %>
       
        <h1></h1><br>
        <h2></h2>
        
        
        
        
    </body>
</html>
