<%-- 
    Document   : ForgetPswd
    Created on : 4 Oct, 2016, 12:33:01 PM
    Author     : neha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password Page</title>
        <script lang="javascript">
            
		function myFocusFunction(i) {
    document.getElementById(i).style.backgroundColor = "#FFE4B5";  
}
function myBlurFunction(i) {
    document.getElementById(i).style.backgroundColor = "white";  
}
function changePswd()
{
    document.PswdForm.submit();
}
	</script>
    </head>
    <body>
       <div style="background-color: #EBECE6	 ; width: 30%;margin-left: 35%;margin-top: 10%; box-shadow:5px 5px #EEEFEA  ">
	<div align="center" style="font-size: 28px;font-family: sans-serif;font-weight: bold;margin-left:5%;margin-top:40%;color: blue;">
            <br>
            Password Reset</div>
            <form name="PswdForm" action="forgot_pswd" method="post">
	<table width="60%" border="0" style="margin-top: 5%;margin-left:23%;display: box;text-align: center;">
		<tr style="height: 40px;" >
			<td width="50%" >
				UserName
			</td>
			<td width="50%" >
                            <input type="text" name="forgot_uname" id="uname"  style="height: 30px;" onfocus="myFocusFunction(id)" onblur="myBlurFunction(id)" required />
			</td>
		</tr>
                <tr style="height: 40px;" >
			<td width="50%" >
				Contact
			</td>
			<td width="50%" >
                            <input type="text" name="forgot_phone" id="uname"  style="height: 30px;" onfocus="myFocusFunction(id)" onblur="myBlurFunction(id)" required />
			</td>
		</tr>
		<tr style="height: 40px;">
			<td>New Password</td>
			<td><input type="password" name="forgot_pass" id="pass" style="height: 30px;" onfocus="myFocusFunction(id)" required/></td>
		</tr>
	</table>
                <br>
	<div align="center">
            <input type="button" value="Submit" onclick="changePswd()">
        </div>
            </form>
		<br />
    </body>
</html>
