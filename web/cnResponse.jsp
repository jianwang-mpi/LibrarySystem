<%@page language="java" pageEncoding="UTF-8"%>
<%@ page import="Service.ChangeUserInformation" %>
<%
	int ok=0;
	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
	if(request.getParameter("name")!=null){
		String name=request.getParameter("name");
	    String userID=(String)session.getAttribute("userID");
		ChangeUserInformation.changeUsername(name,userID);
		ok=1;
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
	out.println("<p>姓名不能为空！</p>");
	out.println("<p>5秒后返回修改页面！！</p>");
	String content=5+";URL="+"changename.jsp";
	response.setHeader("REFRESH",content); 
}
%>
</body>