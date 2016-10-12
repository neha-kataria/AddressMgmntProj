<%-- 
    Document   : UserProfile
    Created on : 23 Sep, 2016, 4:02:23 PM
    Author     : neha
--%>

<%@page import="add_mgmnt.UserBean"%>
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
       //   addRow.c++;
           ob.count++;
     //      alert("count="+ob.count);
            addRow.first_flag++;

                        var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);


// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
var cell1 = row.insertCell(0);

var cell2 = row.insertCell(1);

        cell1.innerHTML = "Address"+ob.count; //+addRow.c;
         var element=document.createElement("textarea");
           
              
               var c="address";
               var res=c.concat(ob.count);
            //    alert(res);
                element.setAttribute("name",res);
                element.setAttribute("rows","5");
                element.setAttribute("cols","40");
                
              
               
            
                 cell2.appendChild(element);
              //   ob.count=addRow.c;
 document.getElementById("hiddenField").value=ob.count;

if(addRow.first_flag==1){
var ele_button=document.createElement("input");
ele_button.setAttribute("type","submit");
ele_button.setAttribute("value","Submit");
ele_button.setAttribute("id","submit_button");
ele_button.setAttribute("style","margin:auto;display:block;height: 30px;");

document.getElementById("submit_space").appendChild(ele_button);
}


var del_but=document.getElementById("del_row");
del_but.setAttribute("style","margin:auto;display:block;visibility: visible;");

}


        
        
function deleteRow() {
		
			var table = document.getElementById("addr_table");
			var rowCount = table.rows.length;


				table.deleteRow(rowCount-1);
					rowCount--;
                            
                                        
      ob.count--;


                    //   alert("rowCount" + ob.count);
             
     document.getElementById("hiddenField").value=ob.count;
     if(rowCount==0)
     {
         var del_but=document.getElementById("del_row");
del_but.setAttribute("style","margin:auto;display:block;visibility: hidden;height: 30px;");
     }
}


var ob=new Object();
        ob.count=0;
        addRow.first_flag=0;
        addRow.c=0;

</script>
    </head>
    <body>
        
        <div style="margin-left: 20%;font-family: sans-serif;font-size: 28px;font-weight: bold;color: green">
            My Profile! 
       <!-- <div style="margin-left: 90%;"> -->
       <% //if(session.getServletContext()!=null){
            RegisterUserBean logged_user=(RegisterUserBean)session.getAttribute("logged_user");
            UserBean list=(UserBean)application.getAttribute("userdetails");
            int index=list.getUserList().indexOf(logged_user);
            RegisterUserBean logout_user=list.getUserList().get(index);
            
        %>
       
       <form action="logout" method="get"> 
           <%
                session.setAttribute("logout_name", logout_user); %>
           <input type="submit" value="Logout" style="margin-left: 85%; width: 180px;height: 30px">
       </form>
       
       <input type="button" value="Edit Profile" style="margin-left: 85%; width: 180px;height: 30px;" onclick="window.location='address.jsp'" > </div>
       
        <div style="background-color: #EBECE6	 ; width: 30%;margin-left: 35%; box-shadow:5px 5px #EEEFEA  "><br>
            
           
       <table width="80%" border="0" style="margin-left:10%;display: box;text-align: left;">
            <tr style="height: 40px;" >
                <td width="50%" >Username </td>
                <td width="50%" ><%= logged_user.getName() %></td></tr>
        <tr style="height: 40px;" >
            <td width="50%" >Contact </td>
            <td width="50%" ><%= logged_user.getPhone() %></td>
        </tr>
        <tr style="height: 40px;" >
            <td width="50%"  >Your Address List :</td>
        
        <% //if(logged_user.getAddress().size()==0)
            for(int i=0;i<logged_user.getAddress().size();i++){
            %>
            <tr style="height: 50px;" >
            <td width="50%" align="right" style="padding-right: 15px">Address <%=i+1 %>  </td>
            <td width="50%" ><%= logged_user.getAddress().get(i) %></td> 
           
        </tr> <% }  %>
        </table>
        <br><br><br>
        
        </div>
         <form action="addr_list" method="post">
             
       <input type="hidden" id="hiddenField" name ="countRows" >  
       
       <input type="hidden" name="edited" value="0">
               
       <div style="margin-top: 5%;">
        <input type="button" value="Add New Address" onclick="addRow()" style="margin:auto;display:block;height: 30px;">
        <input type="button" value="Delete Row" id="del_row"   onclick="deleteRow()" style="margin:auto;display:block;height: 30px;visibility: hidden; ">
        <br><br><br>
       </div>
        <table border="0" id="addr_table" align="center">
        </table>
        <br><br>
        <div id="submit_space"></div>
        
         </form>
    </body>
</html>
