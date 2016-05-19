<!--实现查找功能-->
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="checkvalid.jsp" %>
<%@page import="java.sql.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="DataBase.DataBase" %>
<%@ page import="Information.UserInformation" %>
<%@ page import="Query.QueryUser" %>
<%@ page import="Information.BookInformation" %>
<%@ page import="Query.QueryBook" %>

<%

	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	//要执行的 sql 查询

	String userID=(String)session.getAttribute("userID");

	String searchName=(String)request.getParameter("searchName");

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
	<td style="width:400">Hi, <a href="index.jsp"><%
		UserInformation user = QueryUser.queryUserID(userID);
		out.println("你好！ " + user.getUsername());
	%></a>
	</td>
	<td style="width:300">
	<form action="search.jsp" method="post">
		<input type="text" name="searchName" maxlength="20" style="width:120"/>
		<input type="submit" value="查找图书" />
		<input type="button" value="退出登录" onclick="location.href='logout.jsp'" />
	</form>
	</td>
	</tr>
	</table>
	</div>
	<hr  style="width:700" />
	<%
	if (searchName!=null){


		//取得结果
		List<BookInformation> result = QueryBook.queryBookName(searchName);
		for(int i=0;i<result.size();i++){
		%>
		<div align="center" style="width:700" >
		<li>
		<%out.print(result.get(i).getId());%>
		<%out.print(result.get(i).getName());%>
		<%out.print(result.get(i).getAuthor());%>
		<%out.print(result.get(i).getYear());%>
		<%out.print(result.get(i).getPrice());%>
		<%out.print(result.get(i).getHave());%>
		</li>
		</div>
		<%
				}
	}
	%>
</body>
</html>