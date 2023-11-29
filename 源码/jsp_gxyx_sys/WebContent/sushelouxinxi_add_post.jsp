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
		String louhao = request.getParameter("louhao");
		String cengshu = request.getParameter("cengshu");
		String louguanyuan = request.getParameter("louguanyuan");
		String dianhua = request.getParameter("dianhua");
		String beizhu = request.getParameter("beizhu");
		ResultSet RS_result = connDbBean.executeQuery("select * from sushelouxinxi where louhao='" + louhao + "'");

		if (RS_result.next()) {
			out.print("<script>alert('该楼号已经存在,请换其他楼号!');window.history.go(-1);</script>");
		} else {

			String sql = "insert into sushelouxinxi(louhao,cengshu,louguanyuan,dianhua,beizhu) values('" + louhao
					+ "','" + cengshu + "','" + louguanyuan + "','" + dianhua + "','" + beizhu + "') ";

			connDbBean.executeUpdate(sql);
			out.print("<script>alert('添加成功!!');location.href='sushelouxinxi_add.jsp';</script>");

		}
		RS_result.close();
	%>
</body>
</html>

