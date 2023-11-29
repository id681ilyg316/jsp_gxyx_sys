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
		//ResultSet RS_result=connDbBean.executeQuery("select * from [fdsfds] where fdsfssd='"+fdsfd+"'");

		// if(RS_result.next())
		//{
		//out.print("<script>alert('该班级已经存在,请换其他名称的班级!');window.history.go(-1);</script>");
		//	}
		//else{

		String sql = "insert into xinwentongzhi(biaoti,leibie,neirong,tianjiaren,shouyetupian,dianjilv) values('"
				+ biaoti + "','" + leibie + "','" + neirong + "','" + tianjiaren + "','" + shouyetupian + "','"
				+ dianjilv + "') ";
		//out.print(sql);
		connDbBean.executeUpdate(sql);
		out.print("<script>alert('添加成功!!');location.href='xinwentongzhi_add.jsp?lb=" + leibie + "';</script>");

		//	}
		//RS_result.close();
	%>
</body>
</html>

