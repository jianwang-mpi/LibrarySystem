<!--实现用户注册-->
<html>
	<head>	
		<title>图书馆用户注册</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">

		<meta http-equiv="keywords" content="social network,login">
		<meta http-equiv="description" content="This is the login page.">
		<meta http-equiv="author"content="OOPRS,shenxuchuan@pku.edu.cn"> 
		<meta http-equiv="content-Type" content="text/html;charset=UTF-8"> 
<style type="text/CSS">
</style>
</head>
	<body bgcolor="#FFFF99">
	<div align="center" class="style1 style2">用 户 注 册
	</div>
	<center>
	<form action="registerResponse.jsp" method="post">
		<table border="2" bordercolor="black" bgcolor="">
			<tbody>
			<tr>
				<td height="28">用户名</td>
				<td><input type="text" name="userID" maxlength="20" style="width:150"></td>
			</tr>
			<tr>
				<td height="28">密码</td>
				<td><input type="text" name="passwd" maxlength="20" style="width:150"></td>
			</tr>
			<tr>
				<td height="28">姓名</td>
				<td><input type="text" name="userName" maxlength="20" style="width:150"></td>
			</tr>
			</tbody>
		</table>
	<input type="submit" value="注册" >&nbsp;&nbsp; 
	<input type="button" value="返回" onclick="location.href='main1.jsp'">
	</form>
	</center>
	</body>
</html>