<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>
<%@ page import="Query.QueryUser" %>
<%
	int ok=0;
	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
	if(request.getParameter("userID")!=null)
	if(request.getParameter("passwd")!=null)
	if(request.getParameter("userName")!=null){
		String userID=request.getParameter("userID");
		String passwd=request.getParameter("passwd");
		String userName= java.net.URLDecoder.decode(request.getParameter("userName"),"UTF-8");//获取请求参

		if (QueryUser.insertUser(userID,passwd,userName)){
			ok=1;
		}
	}
%>

<body bgcolor="#FFFF99">
<%
if (ok==1){
	out.println("<p>注册成功！！</p>");
	out.println("<p>5秒后返回<a href=\"index.jsp\">主</a>页面！</p>");
	String content=5+";URL="+"main1.jsp";
	response.setHeader("REFRESH",content); 
}else{
	out.println("<p>注册失败！</p>");
	out.println("<p>5秒后返回注册页面！！</p>");
	String content=5+";URL="+"register.jsp";
	response.setHeader("REFRESH",content); 
}
%>
</body>