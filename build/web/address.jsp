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
               alert(res);
                element.setAttribute("name",res);
                element.setAttribute("rows","5");
                element.setAttribute("cols","40");
                
              
               
            
                 cell2.appendChild(element);
                 
    document.getElementById("hiddenField").value=addRow.count;
}
addRow.count=0;
             
            </script>
    </head>
    <body>
     
        
        <h1>Welcome User!</h1>
        <br><br>
        <form action="addr_list" method="post">
        <table border="0" >
            <tr><td>username :</td>
             <td><%= request.getParameter("log_uname")%></td></tr> 
        <tr>
            <td>contact </td>
            <td><%= request.getAttribute("log_phone")%></td>
            
        </tr>
        
        </table>
        
        <br>
        <input type="button" value="Add"  onclick="addRow()" ><br>
        <input type="hidden" id="hiddenField" name ="countRows" />
        
        
        <table border="0" id="mytable">
        
        </table>
       
           
        <input type="submit" value="submit">
        </form>
    </body>
</html>
