<!--实现管理员主界面-->
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%

	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("login")!=null && session.getAttribute("login").equals("ok")){
		String content=0+";URL="+"main.jsp";
		response.setHeader("REFRESH",content); 
	}
%>
	

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>	
		<title>欢迎来到图书管理系统</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">

		<meta http-equiv="keywords" content="social network,login">
		<meta http-equiv="description" content="This is the login page.">
		<meta http-equiv="author"content="ley,1200011027@pku.edu.cn"> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<style type="text/CSS">
<!--
.style1 {...}{
font-size: 18px;
font-weight: bold;
}
.style2 {...}{font-size: 24px}
.style5 {...}{font-size: 16px}
-->
</style>
</head>
<body bgcolor="#FFFF99" width="300" height="300">
<center>

<div align="center" class="style1 style2">系 统 管 理 登 录
</div>
<form action="loginResponseAdmini.jsp" method="post">
	<table border="2" bordercolor="black" bgcolor="">
		<tbody>
		<tr>
			<td height="28"><span class="style5">用户名</span> <input type="text" name="userID" maxlength="20" style="width:150"></td>
		</tr>
		<tr>
			<td><span class="style5">密&nbsp;&nbsp;码</span> <input type="password" name="passwd" maxlength="20" style="width:150"></td>
		</tr>
		</tbody>
	</table>
	<div align="center">
		<input type="submit" value="登录" />
	</div>
</form>
<p>&nbsp;</p>
<div align="right">
  <p>出品人：炮大师 </p>
</div>
</center>
</body>
</html>