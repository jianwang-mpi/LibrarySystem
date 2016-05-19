<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>
<%@ page import="Query.QueryBook" %>
<%
	int ok=0;
	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
	if(request.getParameter("id")!=null){
		String id=request.getParameter("id");

		if(QueryBook.deleteBookID(id)){
			ok=1;
		}
	}
%>

<body bgcolor="#FFFF99">
<%
if (ok==1){
	out.println("<p>删除成功！！</p>");
	out.println("<p>5秒后返回<a href=\"main1.jsp\">主界面</a>！</p>");
	String content=5+";URL="+"main1.jsp";
	response.setHeader("REFRESH",content); 
}else{
	out.println("<p>书id不存在！</p>");
	out.println("<p>5秒后返回删除页面！！</p>");
	String content=5+";URL="+"delete.jsp";
	response.setHeader("REFRESH",content); 
}
%>
</body>