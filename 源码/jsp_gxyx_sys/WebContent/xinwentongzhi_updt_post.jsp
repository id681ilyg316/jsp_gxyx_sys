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
		String biaoti = request.getParameter("biaoti");
		String leibie = request.getParameter("leibie");
		String neirong = request.getParameter("neirong");
		String tianjiaren = request.getParameter("tianjiaren");
		String shouyetupian = request.getParameter("shouyetupian");
		String dianjilv = request.getParameter("dianjilv");
		String id = request.getParameter("id");
		String sql = "update xinwentongzhi set biaoti='" + biaoti + "',leibie='" + leibie + "',neirong='" + neirong
				+ "',tianjiaren='" + tianjiaren + "',shouyetupian='" + shouyetupian + "',dianjilv='" + dianjilv
				+ "' where id= " + id;
		connDbBean.executeUpdate(sql);
		out.print("<script>alert('修改成功!!');location.href='xinwentongzhi_list.jsp?lb=" + leibie + "';</script>");
	%>
</body>
</html>


