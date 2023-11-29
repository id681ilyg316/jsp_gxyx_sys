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
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String lb = request.getParameter("lb");
		String tablename = request.getParameter("tablename");

		String sql = "delete from " + tablename + " where id=" + id + "";

		connDbBean.executeUpdate(sql);
		out.print("<script>alert('删除成功!!');location.href='xinwentongzhi_list.jsp?lb=" + lb + "';</script>");
	%>
</body>
</html>

