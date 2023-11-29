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
		String sql = "";
		sql = "backup database jspqymhxns to disk='C:/jspqymhxns.dat'";

		connDbBean.executeUpdate(sql);
		out.print("<script>alert('操作成功!!，您的数据库已成功备份于C:/jspqymhxns.dat');location.href='sy.jsp';</script>");
	%>
</body>
</html>

