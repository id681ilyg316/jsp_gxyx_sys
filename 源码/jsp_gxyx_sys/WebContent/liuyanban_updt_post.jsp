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
		String cheng = request.getParameter("cheng");
		String xingbie = request.getParameter("xingbie");
		String QQ = request.getParameter("QQ");
		String youxiang = request.getParameter("youxiang");
		String dianhua = request.getParameter("dianhua");
		String neirong = request.getParameter("neirong");
		String id = request.getParameter("id");
		String sql = "update liuyanban set cheng='" + cheng + "',xingbie='" + xingbie + "',QQ='" + QQ
				+ "',youxiang='" + youxiang + "',dianhua='" + dianhua + "',neirong='" + neirong + "' where id= "
				+ id;
		connDbBean.executeUpdate(sql);
		out.print("<script>alert('修改成功!!');location.href='liuyanban_list.jsp';</script>");
	%>
</body>
</html>


