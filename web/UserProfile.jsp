<%-- 
    Document   : UserProfile
    Created on : 23 Sep, 2016, 4:02:23 PM
    Author     : neha
--%>

<%@page import="add_mgmnt.RegisterUserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script lang="javascript">
function addRow(){
var table=document.getElementById("addr_table");
addRow.c++;

var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);


// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
var cell1 = row.insertCell(0);
//var cell2 = row.insertCell(1);

// Add some text to the new cells:
//cell1.innerHTML = addRow.c;
var cell2 = row.insertCell(1);
    cell1.innerHTML = "Address"+addRow.c;
     var element=document.createElement("textarea");
              addRow.count++;
              
               var c="address";
               var res=c.concat(addRow.c);
               alert(res);
                element.setAttribute("name",res);
                element.setAttribute("rows","5");
                element.setAttribute("cols","40");
                
              
               
            
                 cell2.appendChild(element);
                 
    document.getElementById("hiddenField").value=addRow.c;
 //username
//cell3.innerHTML=content;
if(addRow.c==1){
var ele_button=document.createElement("input");
ele_button.setAttribute("type","submit");
ele_button.setAttribute("value","submit");
ele_button.setAttribute("style","margin:auto;display:block;");

document.getElementById("submit_space").appendChild(ele_button);
}
//<input type="submit" value="submit" style="position: absolute;top: auto; left:50%">
}


        
        
        addRow.c=0;

function deleteRow() {
		
			var table = document.getElementById("addr_table");
			var rowCount = table.rows.length;


				table.deleteRow(rowCount-1);
					rowCount--;
					i--;
                                        
       

}
</script>
    </head>
    <body>
        <h1 align="center">My Profile!</h1>
        <% RegisterUserBean logged_user=(RegisterUserBean)session.getAttribute("logged_user");
        
        %>
         <form action="addr_list" method="post">
        <table border="0" align="center">
            <tr><td>username :</td>
                <td><%= logged_user.getName() %></td></tr>
        <tr>
            <td>contact </td>
            <td><%= logged_user.getPhone() %></td>
        </tr>
        <tr><td>Address</td>
            <td><%= logged_user.getAddress() %></td>
        </table>
        <br>
       <input type="hidden" id="hiddenField" name ="countRows" />  
        
        <input type="button" value="add" onclick="addRow()" style="margin:auto;display:block;">
        <input type="button" value="delete" onclick="deleteRow()" style="margin:auto;display:block;">
        <br><br><br>
        
        <table border="0" id="addr_table" align="center">
        </table>
        <br><br>
        <div id="submit_space"></div>
        
         </form>
    </body>
</html>
