<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="checkvalid.jsp" %>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>
<%@ page import="Information.RelationInformation" %>
<%@ page import="Query.QueryRelation" %>

<%

	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	

%>
<html>
<head>
	<title>Search page</title>
	<meta http-equiv="content-Type" content="text/html;charset=UTF-8"> 
</head>

<body  align="center" style="width:700" bgcolor="#FFFF99">

	<hr  style="width:700" />
	<%
		
		List<RelationInformation> rs = QueryRelation.queryRelationAll();
		for(int i=0;i<rs.size();i++){
		%>
		<div align="center" style="width:700" >
		<li>
		<%out.print(rs.get(i).getUserid());%>
		<%out.print(rs.get(i).getBookid());%>
		<%out.print(rs.get(i).getDay());%>
		
		</li>
		</div>
		<%
		
	}
	%>
</body>
</html>
