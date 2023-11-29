<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="connDbBean" scope="page" class="db.db" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'adminyanzheng.jsp' starting page</title>


</head>

<body>
	<%
		if (request.getSession().getAttribute("cx").equals("辅导员")) {
			response.sendRedirect("left4.jsp");
		}
		if (request.getSession().getAttribute("cx").equals("学生")) {
			response.sendRedirect("left3.jsp");
		}

		if (request.getSession().getAttribute("cx").equals("财务处")) {
			response.sendRedirect("left2.jsp");
		}
		if (request.getSession().getAttribute("cx").equals("管理员")) {
			response.sendRedirect("left.jsp");
		}
	%>
</body>
</html>

