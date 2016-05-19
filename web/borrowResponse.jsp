<%@page language="java" pageEncoding="UTF-8"%>
<%@ page import="Service.BorrowBook" %>
<%
	int ok=0;
	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
	if(request.getParameter("userid")!=null)
	if(request.getParameter("bookid")!=null){
		String userid=request.getParameter("userid");
		String bookid=request.getParameter("bookid");

		if (BorrowBook.borrowBook(userid,bookid)){
			ok=1;
		}

	}
%>

<body bgcolor="#FFFF99">
<%
if (ok==1){
	out.println("<p>借阅成功！！</p>");
	out.println("<p>5秒后返回<a href=\"main1.jsp\">主界面</a>！</p>");
	String content=5+";URL="+"main1.jsp";
	response.setHeader("REFRESH",content); 
}else{
	out.println("<p>借阅失败！</p>");
	out.println("<p>5秒后返回借书页面！！</p>");
	String content=5+";URL="+"borrow.jsp";
	response.setHeader("REFRESH",content); 
}
%>
</body>