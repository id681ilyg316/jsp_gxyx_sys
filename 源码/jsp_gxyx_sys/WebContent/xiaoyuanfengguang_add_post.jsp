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
		String tupian = request.getParameter("tupian");
		String mingcheng = request.getParameter("mingcheng");
		//gdsosss ResultSet RS_result=connDbBean.executeQuery("select * from xiaoyuanfengguang where tupian='"+tupian+"'");

		//gdsosss if(RS_result.next())
		//gdsosss{
		//gdsosssout.print("<script>alert('该图片已经存在,请换其他图片!');window.history.go(-1);</script>");
		//gdsosss	}
		//gdsossselse{

		String sql = "insert into xiaoyuanfengguang(tupian,mingcheng) values('" + tupian + "','" + mingcheng
				+ "') ";

		connDbBean.executeUpdate(sql);
		out.print("<script>alert('添加成功!!');location.href='xiaoyuanfengguang_add.jsp';</script>");

		//gdsosss	}
		//gdsosss RS_result.close();
	%>
</body>
</html>

