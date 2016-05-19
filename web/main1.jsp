<!--实现管理员主界面-->
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="checkvalid.jsp" %>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>

<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	String userID=(String)session.getAttribute("userID");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
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
	<p>Hi!您现在想做的是？</p>
	<form action="search.jsp" method="post">
		<input type="text" name="searchName" maxlength="20" style="width:120"/>
		<input type="submit" value="查找图书" />
		</form>
	<input type="button" value="借阅图书" onclick="location.href='borrow.jsp'" />
	<input type="button" value="归还图书" onclick="location.href='return.jsp'" />
	<input type="button" value="新增图书" onclick="location.href='add.jsp'" />
	<input type="button" value="删除图书" onclick="location.href='delete.jsp'" />
	<input type="button" value="查询借阅情况" onclick="location.href='searchborrowall.jsp'" />
	<input type="button" value="读者注册" onclick="location.href='register.jsp'"/>
	<input type="button" value="退出登录" onclick="location.href='logout.jsp'" />
	</div>

</body>
</html>