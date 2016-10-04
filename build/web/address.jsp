<%-- 
    Document   : address
    Created on : 22 Sep, 2016, 4:21:39 PM
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
        <script lang="javascript">
           
            function addRow(){
              
    var table = document.getElementById("mytable");
    var row = table.insertRow(0);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    cell1.innerHTML = "Address";
     var element=document.createElement("textarea");
              addRow.count++;
              
               var c="address";
               var res=c.concat(addRow.count);
             //  alert(res);
                element.setAttribute("name",res);
                element.setAttribute("rows","5");
                element.setAttribute("cols","40");
                
              
               
            
                 cell2.appendChild(element);
                 
    document.getElementById("hiddenField").value=addRow.count;
}
addRow.count=0;
             // document.getElementById("hiddenField").value=addRow.count;
            </script>
    </head>
    <body>
     
        
        <h1>Welcome User!</h1>
        <br><br>
        <% RegisterUserBean ob=(RegisterUserBean)session.getAttribute("logged_user");
            %>
        
            <form action="addr_list" method="post">
        <table border="0" >
            <tr><td>username :</td>
                <td><input type="text" value="<%= ob.getName() %>" name="edit_uname"></td></tr> 
        <tr>
            <td>contact </td>
            <td><input type="text" value="<%= ob.getPhone() %>" name="edit_phone"></td>
            
        </tr>
        <tr>
            <td>password </td>
            <td><input type="password" value="<%= ob.getPass()%>" name="edit_pass"></td>
            
        </tr>
        <tr>
            <td>Your Address List: </td>
            
            
        </tr>
        <% for(int i=0;i<ob.getAddress().size();i++){
            %><tr style="height: 70px;" >
            <td width="50%" ><%= "Address "+(i+1) %></td>
            <td width="50%" ><input type="text" value="<%= ob.getAddress().get(i) %>" name=<%= "edit_address"+i %>></td> 
           
        </tr> <% } %>
        </table>
        <input type="hidden" name="edited" value="1">
        <br>
        <input type="button" value="Add address"  onclick="addRow()"  ><br>
        <input type="hidden" id="hiddenField" name ="countRows" value="0"/>
        
        
        <table border="0" id="mytable">
        
        </table>
       
        <br>
        <input type="submit" value="submit">
        </form>
    </body>
</html>
