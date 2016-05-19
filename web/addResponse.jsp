<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="Query.QueryBook" %>
<%
	int ok=0;
	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
	if(request.getParameter("id")!=null)
	if(request.getParameter("name")!=null)
	if(request.getParameter("author")!=null)
	if(request.getParameter("year")!=null)
	if(request.getParameter("price")!=null){
		String id=request.getParameter("id");
		String name= java.net.URLDecoder.decode(request.getParameter("name"),"UTF-8");//获取请求参数  
		String author= java.net.URLDecoder.decode(request.getParameter("author"),"UTF-8");//获取请求参数  
        String year=request.getParameter("year");
		String price=request.getParameter("price");

		QueryBook.insertBook(id,name,author,price,year);
		ok=1;
	}
%>

<body bgcolor="#FFFF99">
<%
if (ok==1){
	out.println("<p>新增成功！！</p>");
	out.println("<p>5秒后返回<a href=\"main1.jsp\">主界面</a>！</p>");
	String content=5+";URL="+"main1.jsp";
	response.setHeader("REFRESH",content); 
}else{
	out.println("<p>新增失败！</p>");
	out.println("<p>5秒后返回录入页面！！</p>");
	String content=5+";URL="+"add.jsp";
	response.setHeader("REFRESH",content); 
}
%>
</body>