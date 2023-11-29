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
		String xuehao = request.getParameter("xuehao");
		String xingming = request.getParameter("xingming");
		String mima = request.getParameter("mima");
		String xingbie = request.getParameter("xingbie");
		String banji = request.getParameter("banji");
		String zhuanye = request.getParameter("zhuanye");
		String jiguan = request.getParameter("jiguan");
		String dizhi = request.getParameter("dizhi");
		String zhaopian = request.getParameter("zhaopian");
		String sushelou = request.getParameter("sushelou");
		String fangjianhao = request.getParameter("fangjianhao");
		String chuangweihao = request.getParameter("chuangweihao");
		String sql = "update xinshengbaodao set xuehao='" + xuehao + "',xingming='" + xingming + "',mima='" + mima
				+ "',xingbie='" + xingbie + "',banji='" + banji + "',zhuanye='" + zhuanye + "',jiguan='" + jiguan
				+ "',dizhi='" + dizhi + "',zhaopian='" + zhaopian + "',sushelou='" + sushelou + "',fangjianhao='"
				+ fangjianhao + "',chuangweihao='" + chuangweihao + "' where xuehao= '"
				+ request.getSession().getAttribute("username") + "'";
		connDbBean.executeUpdate(sql);
		out.print("<script>alert('修改成功!!');location.href='xinshengbaodao_updt2.jsp';</script>");
	%>
</body>
</html>


