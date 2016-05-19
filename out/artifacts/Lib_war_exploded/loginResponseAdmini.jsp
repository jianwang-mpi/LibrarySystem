<%@page language="java" pageEncoding="UTF-8"%>
<%@ page import="Service.VipCertificate" %>
<%
	int ok=0;
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("login")!=null && session.getAttribute("login").equals("ok")){
		ok=1;
	}
	
	else if(request.getParameter("userID")!=null && request.getParameter("passwd")!=null){
		String userID=request.getParameter("userID");
		String passwd=request.getParameter("passwd");

			if (VipCertificate.vipCertificate(userID,passwd)){
				ok=1;
				session.setAttribute("login","ok");
				session.setAttribute("userID",userID);
				session.setMaxInactiveInterval(-1);
			}

	}
if (ok==1){
	String content=0+";URL="+"main1.jsp";
	response.setHeader("REFRESH",content); 
}else{
	out.println("用户名或密码错误！");
	String content=2+";URL="+"vip.jsp";
	response.setHeader("REFRESH",content); 
}
%>