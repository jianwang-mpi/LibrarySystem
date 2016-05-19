<!--实现查询借阅情况功能-->
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="checkvalid.jsp" %>
<%@ page import="Information.UserInformation" %>
<%@ page import="Query.QueryUser" %>
<%@ page import="Query.QueryRelation" %>
<%@ page import="java.util.List" %>
<%@ page import="Information.RelationInformation" %>

<%

	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");

	//要执行的 sql 查询

	String userID=(String)session.getAttribute("userID");
	
	String searchName=(String)request.getParameter("searchName");
	System.out.println(searchName);
	String sql=null;
	
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
	sql= "SELECT * FROM user where userID='"+userID+"' LIMIT 15";
	System.out.println(sql);

	//取得结果
		UserInformation userInformation = QueryUser.queryUserID(userID);
		out.println(userInformation.getUsername());
	%></a>
	</td>
	</tr>
	</table>
	</div>
	<hr  style="width:700" />
	<%

		List<RelationInformation> relationList = QueryRelation.queryRelationID(userID);
		for(int i=0;i<relationList.size();i++){
		%>
		<div align="center" style="width:700" >
		<li>
		<%out.print(relationList.get(i).getUserid());%>
		<%out.print(relationList.get(i).getBookid());%>
		<%out.print(relationList.get(i).getDay());%>
		
		</li>
		</div>
		<%
		
	}
	%>
</body>
</html>