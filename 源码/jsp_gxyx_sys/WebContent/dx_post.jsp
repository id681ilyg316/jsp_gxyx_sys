<%@ page language="java" pageEncoding="UTF-8" import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'adminyanzheng.jsp' starting page</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String neirong = request.getParameter("content");
		String lb = request.getParameter("lb");
		String sql = "update dx set content='" + neirong + "' where leibie= '" + lb + "'";
		connDbBean.executeUpdate(sql);
		out.print("<script>alert('编辑成功!!');history.back();</script>");
	%>
</body>
</html>


