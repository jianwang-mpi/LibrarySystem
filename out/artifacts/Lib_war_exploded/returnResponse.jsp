<%@page language="java" pageEncoding="UTF-8"%>

<%@ page import="Service.ReturnBook" %>
<%
	int ok=0;
	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
	if(request.getParameter("bookid")!=null){
		String bookid=request.getParameter("bookid");

		int returnval = ReturnBook.returnBook(bookid);
		if(returnval==-1) {
			out.println("<p>逾期还书，扣款5元！！</p>");
			ok=1;
		}
		else if(returnval==1)
			ok=1;
	}
%>

<body bgcolor="#FFFF99">
<%
if (ok==1){
	out.println("<p>还书成功！！</p>");
	out.println("<p>5秒后返回<a href=\"main1.jsp\">主界面</a>！</p>");
	String content=5+";URL="+"main1.jsp";
	response.setHeader("REFRESH",content); 
}else{
	out.println("<p>书未被借走！</p>");
	out.println("<p>5秒后返回还书页面！！</p>");
	String content=5+";URL="+"return.jsp";
	response.setHeader("REFRESH",content); 
}
%>
</body>