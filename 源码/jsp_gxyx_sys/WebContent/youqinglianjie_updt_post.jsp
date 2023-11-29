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
		String wangzhanmingcheng = request.getParameter("wangzhanmingcheng");
		String wangzhi = request.getParameter("wangzhi");
		String id = request.getParameter("id");
		String sql = "update youqinglianjie set wangzhanmingcheng='" + wangzhanmingcheng + "',wangzhi='" + wangzhi
				+ "' where id= " + id;
		connDbBean.executeUpdate(sql);
		out.print("<script>alert('修改成功!!');location.href='youqinglianjie_list.jsp';</script>");
	%>
</body>
</html>


