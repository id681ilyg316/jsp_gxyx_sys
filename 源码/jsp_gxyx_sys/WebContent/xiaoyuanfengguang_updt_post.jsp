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
		String tupian = request.getParameter("tupian");
		String mingcheng = request.getParameter("mingcheng");
		String id = request.getParameter("id");
		String sql = "update xiaoyuanfengguang set tupian='" + tupian + "',mingcheng='" + mingcheng + "' where id= "
				+ id;
		connDbBean.executeUpdate(sql);
		out.print("<script>alert('修改成功!!');location.href='xiaoyuanfengguang_list.jsp';</script>");
	%>
</body>
</html>


