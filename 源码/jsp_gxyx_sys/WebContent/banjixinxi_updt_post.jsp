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
		String banji = request.getParameter("banji");
		String banzhuren = request.getParameter("banzhuren");
		String renshu = request.getParameter("renshu");
		String beizhu = request.getParameter("beizhu");
		String id = request.getParameter("id");
		String sql = "update banjixinxi set banji='" + banji + "',banzhuren='" + banzhuren + "',renshu='" + renshu
				+ "',beizhu='" + beizhu + "' where id= " + id;
		connDbBean.executeUpdate(sql);
		out.print("<script>alert('修改成功!!');location.href='banjixinxi_list.jsp';</script>");
	%>
</body>
</html>


