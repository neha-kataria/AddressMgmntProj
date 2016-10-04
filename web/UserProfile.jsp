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
        <title>User Profile</title>
        <script lang="javascript">
            
function addRow(){
    var table=document.getElementById("addr_table");
            addRow.c++;
            addRow.first_flag++;

                        var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);


// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
var cell1 = row.insertCell(0);

var cell2 = row.insertCell(1);

        cell1.innerHTML = "Address"+addRow.c;
         var element=document.createElement("textarea");
           
              
               var c="address";
               var res=c.concat(addRow.c);
                alert(res);
                element.setAttribute("name",res);
                element.setAttribute("rows","5");
                element.setAttribute("cols","40");
                
              
               
            
                 cell2.appendChild(element);
                 ob.count=addRow.c;
 document.getElementById("hiddenField").value=ob.count;
 //username
//cell3.innerHTML=content;
if(addRow.first_flag==1){
var ele_button=document.createElement("input");
ele_button.setAttribute("type","submit");
ele_button.setAttribute("value","submit");
ele_button.setAttribute("id","submit_button");
ele_button.setAttribute("style","margin:auto;display:block;");

document.getElementById("submit_space").appendChild(ele_button);
}


var del_but=document.getElementById("del_row");
del_but.setAttribute("style","margin:auto;display:block;visibility: visible;");
//<input type="submit" value="submit" style="position: absolute;top: auto; left:50%">
}


        
        
function deleteRow() {
		
			var table = document.getElementById("addr_table");
			var rowCount = table.rows.length;


				table.deleteRow(rowCount-1);
					rowCount--;
                            
                                        
      ob.count--;


                          alert("rowCount" + ob.count);
     document.getElementById("hiddenField").value=ob.count;
     if(rowCount==0)
     {
         var del_but=document.getElementById("del_row");
del_but.setAttribute("style","margin:auto;display:block;visibility: hidden;");
     }
}


var ob=new Object();
        ob.count=0;
        addRow.first_flag=0;
        addRow.c=0;

</script>
    </head>
    <body>
        <div style="margin-left: 1%;font-family: sans-serif;font-size: 28px;font-weight: bold;color: green">
            My Profile! 
       <!-- <div style="margin-left: 90%;"> -->
      
       <form action="logout" method="get"> 
           <input type="submit" value="Logout" style="margin-left: 85%; width: 180px;height: 30px">
       </form>
       
       <input type="button" value="Edit Profile" style="margin-left: 85%; width: 180px;height: 30px;" onclick="window.location='address.jsp'" > </div>
        <% //if(session.getServletContext()!=null){
            RegisterUserBean logged_user=(RegisterUserBean)session.getAttribute("logged_user");
        
        %>
        <div style="background-color: #EBECE6	 ; width: 30%;margin-left: 35%; box-shadow:5px 5px #EEEFEA  "><br>
            
           
       <table width="80%" border="0" style="margin-left:10%;display: box;text-align: left;">
            <tr style="height: 40px;" >
                <td width="50%" >username :</td>
                <td width="50%" ><%= logged_user.getName() %></td></tr>
        <tr style="height: 40px;" >
            <td width="50%" >contact </td>
            <td width="50%" ><%= logged_user.getPhone() %></td>
        </tr>
        <tr style="height: 40px;" >
            <td width="50%" >Address</td>
        <!--    <td width="50%" ><%= logged_user.getAddress() %></td> -->
        <% for(int i=0;i<logged_user.getAddress().size();i++){
            %><tr style="height: 70px;" >
            <td width="50%" ></td>
            <td width="50%" ><%= logged_user.getAddress().get(i) %></td> 
           <!-- <td><input type="button" value="Edit" onclick="editAddr()"><input type="button" value="Delete" onclick="deleteAddr()"></td> -->
        </tr> <% }  %>
        </table>
        <br><br><br>
        
        </div>
         <form action="addr_list" method="post">
             
       <input type="hidden" id="hiddenField" name ="countRows" >  
       
       <input type="hidden" name="edited" value="0">
               
       <div style="margin-top: 5%;">
        <input type="button" value="add New Address" onclick="addRow()" style="margin:auto;display:block;">
        <input type="button" value="delete Row" id="del_row"   onclick="deleteRow()" style="margin:auto;display:block;visibility: hidden;">
        <br><br><br>
       </div>
        <table border="0" id="addr_table" align="center">
        </table>
        <br><br>
        <div id="submit_space"></div>
        
         </form>
    </body>
</html>
