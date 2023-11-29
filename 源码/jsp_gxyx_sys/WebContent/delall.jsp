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
		String id = "";
		String tablename = request.getParameter("tablename");
		String lb = request.getParameter("lb");
		String[] values = request.getParameterValues("pldel");
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				id = id + values[i] + ",";
			}
			//out.print(id);

			id = id.substring(0, id.length() - 1);

			String sql = "delete from " + tablename + " where id in (" + id + ")";
			//out.print(sql);
			connDbBean.executeUpdate(sql);
			out.print("<script>alert('删除成功!!');location.href='xinwentongzhi_list.jsp?lb=" + lb + "';</script>");

		} else {
			out.print("<script>alert('对不起，您没有选择任何要删除的行!!');location.href='xinwentongzhi_list.jsp?lb=" + lb
					+ "';</script>");
		}
	%>
</body>
</html>

