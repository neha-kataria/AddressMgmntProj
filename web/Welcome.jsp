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
        <title>Login/Register Page</title>
        <script lang="javascript">
            
		function myFocusFunction(i) {
    document.getElementById(i).style.backgroundColor = "#FFE4B5";  
}
function myBlurFunction(i) {
    document.getElementById(i).style.backgroundColor = "white";  
}
function signIn()
{
    document.signInForm.submit();
}
	</script>
    </head>
  
      <body bgcolor="white">
           <%
    if(null!=request.getAttribute("Success"))
    {
        out.println("<h3 align=\"center\" >"+request.getAttribute("Success")+"</h3>");
    }
%>
 <%
    if(null!=request.getAttribute("Err_login"))
    {
        out.println("<h3 align=\"center\">"+request.getAttribute("Err_login")+"</h3>");
    }
%>
	<div style="background-color: #EBECE6	 ; width: 30%;margin-left: 35%;margin-top: 10%; box-shadow:5px 5px #EEEFEA  ">
	<div align="center" style="font-size: 28px;font-family: sans-serif;font-weight: bold;margin-left:5%;margin-top:40%;color: blue;">
            <br>
            Sign In/Register</div>
            <form name="signInForm" action="login_auth" method="post">
	<table width="60%" border="0" style="margin-top: 5%;margin-left:23%;display: box;text-align: center;">
		<tr style="height: 40px;" >
			<td width="50%" >
				UserName
			</td>
			<td width="50%" >
                            <input type="text" name="log_uname" id="uname"  style="height: 30px;" onfocus="myFocusFunction(id)" onblur="myBlurFunction(id)" required />
			</td>
		</tr>
		<tr style="height: 40px;">
			<td>Password</td>
			<td><input type="password" name="log_pass" id="pass" style="height: 30px;" onfocus="myFocusFunction(id)" required/></td>
		</tr>
	</table>
	<div align="center">
		
		<br />
<!--	<input type="submit" value="Sign In" style="color: blue; width: 250px;height: 40px;margin-left: 10% "> -->
<input type="button" value="Sign In" onclick="signIn()" style="color: blue; width: 250px;height: 40px;margin-left: 10% ">
	<br>
		<p style="margin-left: 10%">New user? <a href="RegisterHere.jsp" >Register here</a> </p> 
		
	</div>
	</form>
	</div>
</body>
</html>
