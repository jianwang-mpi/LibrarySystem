<!--实现检查登录状态功能-->
<%
if(session.getAttribute("login")==null||!session.getAttribute("login").equals("ok")){
response.sendRedirect("login.jsp");
}
%>
