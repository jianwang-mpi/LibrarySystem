<!--实现改名功能-->
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="checkvalid.jsp" %>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>

<html>
	<head>	
		<title>修改界面</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">

		<meta http-equiv="keywords" content="social network,login">
		<meta http-equiv="description" content="This is the login page.">
		<meta http-equiv="author"content="ley"> 
		<meta http-equiv="content-Type" content="text/html;charset=UTF-8"> 
<style type="text/CSS">
</style>
</head>
	<body bgcolor="#FFFF99">
	<div align="center" class="style1 style2">修改姓名
	</div>
	<center>
	<form action="cnResponse.jsp" method="post">
		<table border="2" bordercolor="black" bgcolor="">
			<tbody>
			<tr>
				<td height="28">修改后的姓名</td>
				<td><input type="text" name="name" maxlength="20" style="width:150"></td>
			</tr>
			</tbody>
		</table>
	<input type="submit" value="修改" >&nbsp;&nbsp; 
	<input type="button" value="返回" onclick="location.href='main.jsp'">
	</form>
	</center>
	</body>
</html>