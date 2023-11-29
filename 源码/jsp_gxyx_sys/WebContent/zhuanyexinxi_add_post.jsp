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
		String zhuanye = request.getParameter("zhuanye");
		String suozaiyuanxi = request.getParameter("suozaiyuanxi");
		ResultSet RS_result = connDbBean.executeQuery("select * from zhuanyexinxi where zhuanye='" + zhuanye + "'");

		if (RS_result.next()) {
			out.print("<script>alert('该专业已经存在,请换其他专业!');window.history.go(-1);</script>");
		} else {

			String sql = "insert into zhuanyexinxi(zhuanye,suozaiyuanxi) values('" + zhuanye + "','" + suozaiyuanxi
					+ "') ";

			connDbBean.executeUpdate(sql);
			out.print("<script>alert('添加成功!!');location.href='zhuanyexinxi_add.jsp';</script>");

		}
		RS_result.close();
	%>
</body>
</html>

