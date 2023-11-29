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
		String yuan = new String(request.getParameter("yuan").getBytes("8859_1"));
		String id = request.getParameter("id");
		String tablename = request.getParameter("tablename");
		String sql = "";
		if (yuan.equals("是")) {
			sql = "update " + tablename + " set issh='否' where id=" + id;
		} else {
			sql = "update " + tablename + " set issh='是' where id=" + id;
		}
		connDbBean.executeUpdate(sql);
		out.print("<script>alert('操作成功!!');location.href='" + request.getHeader("Referer") + "';</script>");
	%>
</body>
</html>


