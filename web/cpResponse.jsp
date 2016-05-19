<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.ResultSetMetaData"%>
<%@ page import="Service.ChangeUserInformation" %>
<%
	int ok=0;
	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
	if(request.getParameter("passwd")!=null){
		String passwd=request.getParameter("passwd");
	    String userID=(String)session.getAttribute("userID");
		ChangeUserInformation.changePassword(passwd,userID);
		ok=1;
		/** 关闭连接 **/

	}
%>

<body bgcolor="#FFFF99">
<%
if (ok==1){
	out.println("<p>修改成功！！</p>");
	out.println("<p>5秒后返回<a href=\"main.jsp\">主界面</a>！</p>");
	String content=5+";URL="+"main.jsp";
	response.setHeader("REFRESH",content); 
}else{
	out.println("<p>密码不能为空！</p>");
	out.println("<p>5秒后返回修改页面！！</p>");
	String content=5+";URL="+"changepasswd.jsp";
	response.setHeader("REFRESH",content); 
}
%>
</body>