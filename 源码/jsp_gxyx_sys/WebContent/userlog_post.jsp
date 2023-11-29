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
		String rand = (String) session.getAttribute("rand");
		String input = request.getParameter("rand");
		if (rand.equals(input)) {

			String uid = request.getParameter("username");
			String pwd = request.getParameter("pwd1");

			String sql = "";
			String cx = request.getParameter("cx");
			//if(cx.equals("学生"))
			//{
			sql = "select * from xinshengbaodao where xuehao='" + uid + "' and mima='" + pwd + "'";
			//}
			// else
			// {
			// 	sql="select * from gongsi where yonghuming='"+uid+"' and mima='"+pwd+"'";
			// }
			ResultSet RS_result = connDbBean.executeQuery(sql);
			if (!RS_result.next()) {
				out.print("<script>alert('你输入的用户不存在或密码错误,请重新登录!');window.history.go(-1);</script>");
			} else {

				session.setAttribute("username", uid);

				session.setAttribute("cx", cx);
				response.sendRedirect("index.jsp");
			}
			RS_result.close();
		} else {
			out.print("<script>alert('请输入正确的验证码！');location.href='index.jsp';</script>");
		}
	%>
</body>
</html>

