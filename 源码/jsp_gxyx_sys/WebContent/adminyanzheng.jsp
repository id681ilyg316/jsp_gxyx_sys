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
		String uid = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		String cx = request.getParameter("cx");
		String sql = "";
		if (cx.equals("财务处")) {
			sql = "select * from allusers where username='" + uid + "' and pwd='" + pwd + "' and cx='财务处'";
		}
		if (cx.equals("管理员")) {
			sql = "select * from allusers where username='" + uid + "' and pwd='" + pwd + "' and cx='管理员'";
		}
		if (cx.equals("辅导员")) {
			sql = "select * from allusers where username='" + uid + "' and pwd='" + pwd + "' and cx='辅导员'";
		}
		ResultSet RS_result = connDbBean.executeQuery(sql);
		if (!RS_result.next()) {
			out.print("<script>alert('你输入的用户不存在或密码错误,请重新登录!');window.history.go(-1);</script>");
		} else {

			session.setAttribute("username", uid);

			session.setAttribute("cx", RS_result.getString("cx"));

			response.sendRedirect("main.jsp");
		}
		RS_result.close();
	%>
</body>
</html>

