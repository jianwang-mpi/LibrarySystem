<!--实现用户主界面-->
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="checkvalid.jsp" %>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
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
	<title>~欢迎来到图书馆~</title>
	<meta http-equiv="content-Type" content="text/html;charset=UTF-8"> 
	<style>
		.input_detail {
			width:500px;
			height: 80px;
			border: 1px solid #ccc;
			border-left-color: #9a9a9a;
			border-top-color: #9a9a9a;
			outline: none;
			word-wrap: break-word;
			font-size: 18px;
			overflow:auto;
		}
		.comment{
			border-style: dashed; 
			border-width: 1px 0px 0px 0px; 
			border-color: "#202020";
		}
	</style>
</head>
<body  align="center" style="width:700" bgcolor="#FFFF99">
	<div align="center">
	
	<tr>
	<td style="width:100">Hi, <a href="main.jsp"><%
	//取得结果
		UserInformation userInformation = QueryUser.queryUserID(userID);
		out.println(userInformation.getUsername());
	%></a>
	</td>
	
	<p>您现在想做的是？</p>
	<form action="search.jsp" method="post">
		<input type="text" name="searchName" maxlength="20" style="width:120"/>
		<input type="submit" value="查找图书" />
		</form>
    <input type="button" value="查询/修改个人信息" onclick="location.href='searchuser.jsp'" />
	<input type="button" value="查询借阅情况" onclick="location.href='searchborrow.jsp'" />
	<input type="button" value="退出登录" onclick="location.href='logout.jsp'" />
	</div>

</body>
</html>
