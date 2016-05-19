<!--实现查询用户-->
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="checkvalid.jsp" %>
<%@page import="java.sql.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="DataBase.DataBase" %>
<%@ page import="Information.UserInformation" %>
<%@ page import="Query.QueryUser" %>

<%

	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	String userID=(String)session.getAttribute("userID");
%>
<html>
<head>
	<title>Search page</title>
	<meta http-equiv="content-Type" content="text/html;charset=UTF-8"> 
</head>

<body  align="center" style="width:700" bgcolor="#FFFF99">
	<div align="center">
	<table>
	<tr>
	<td style="width:400">Hi, <a href="main.jsp"><%
		UserInformation userInformation = QueryUser.queryUserID(userID);
	//取得结果
		out.println(userInformation.getUsername());
	%></a>
	</td>
	</tr>
	</table>
	</div>
	<hr  style="width:700" />

		<div align="center" style="width:700" >
		<li>用户名：<%out.print(userInformation.getUserID());%></li>
		<li>密码：<%out.print("不会告诉你密码的！");%><a href="changepasswd.jsp">修改</a></li>
		<li>姓名：<%out.print(userInformation.getUsername());%> <a href="changename.jsp">修改</a></li>
		<li>欠款金额：<%out.print(userInformation.getDebt());%>元</li>
		
		
		</div>

</body>
</html>
