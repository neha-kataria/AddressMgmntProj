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
        <title>Sign Up Page</title>
        <script lang="javascript">
            
		function myFocusFunction(i) {
    document.getElementById(i).style.backgroundColor = "#FFE4B5";  
}
function myBlurFunction(i) {
    document.getElementById(i).style.backgroundColor = "white";  
}
	</script>
    </head>
    <body>
        <div style="background-color: #EBECE6	 ; width: 30%;margin-left: 35%;margin-top: 10%; box-shadow:5px 5px #EEEFEA  ">
	<div align="center" style="font-size: 28px;font-family: sans-serif;font-weight: bold;margin-left:5%;margin-top:40%;color: green;">
            <br>
            Register Here!</div>
	
        
        
        <form action="register" method="post">
        
        
       <!-- <table border="0" align="center">  -->
       <table width="80%" border="0" style="margin-top: 5%;margin-left:10%;display: box;text-align: left;">
            <tr style="height: 40px;" >
                <td width="50%" >Username </td> <td><input type="text" name="reg_uname" style="height: 30px;" onfocus="myFocusFunction(id)" onblur="myBlurFunction(id)" required ></td></tr>
      
            <tr style="height: 40px;" >
                <td width="50%" >Mobile number </td><td><input type="text" name="reg_phone" style="height: 30px;" onfocus="myFocusFunction(id)" onblur="myBlurFunction(id)" required ></td></tr>
           <tr style="height: 40px;" >
                <td>
                    Password </td><td> <input type="password" name="reg_pass" style="height: 30px;" onfocus="myFocusFunction(id)" onblur="myBlurFunction(id)" required ></td>
            </tr>
       
            
      <!--  <tr><td colspan="2" align="center">
                <input type="submit" value="submit"></td></tr>
         -->
        </table>
       <div align="center">
		
		<br />
	<input type="submit" value="Submit" style="color: black; width: 250px;height: 40px;margin-left: 10% ">
	<br>
        </form>
            <br>
            <br>
        </div>
        
    </body>
</html>
