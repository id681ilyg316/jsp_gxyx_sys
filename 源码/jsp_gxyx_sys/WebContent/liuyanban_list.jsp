
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="connDbBean" scope="page" class="db.db" />
<html>
<head>
<base href="<%=basePath%>">

<title>留言板</title>
<LINK href="css.css" type=text/css rel=stylesheet>

</head>

<body>
	<p>已有留言板列表：</p>


	<table width="100%" border="1" align="center" cellpadding="3"
		cellspacing="1" bordercolor="#00FFFF"
		style="border-collapse: collapse">
		<tr>
			<td width="4%" bgcolor="A4B6D7">序号</td>
			<td width="12%" bgcolor='#A4B6D7'>昵称</td>
			<td width="4%" bgcolor='#A4B6D7'>性别</td>
			<td width="10%" bgcolor='#A4B6D7'>QQ</td>
			<td width="11%" bgcolor='#A4B6D7'>邮箱</td>
			<td width="16%" bgcolor='#A4B6D7'>电话</td>
			<td width="12%" bgcolor="A4B6D7">内容</td>
			<td width="12%" bgcolor="A4B6D7">添加时间</td>

			<td width="11%" bgcolor="A4B6D7">回复内容</td>
			<td width="8%" bgcolor="A4B6D7">操作</td>
		</tr>
		<%
			String sql = "";
			sql = "select * from liuyanban where 1=1";
			if (request.getParameter("bianhao") == "" || request.getParameter("bianhao") == null) {
			} else {
				sql = sql + " and bianhao like '%" + request.getParameter("bianhao") + "%'";
			}
			sql = sql + " order by id desc";
			ResultSet RS_result = connDbBean.executeQuery(sql);
			String id = "";
			String cheng = "";
			String xingbie = "";
			String QQ = "";
			String youxiang = "";
			String dianhua = "";
			String neirong = "";
			String huifuneirong = "";
			String addtime = "";
			int i = 0;

			while (RS_result.next()) {
				i = i + 1;
				id = RS_result.getString("id");
				cheng = RS_result.getString("cheng");
				xingbie = RS_result.getString("xingbie");
				QQ = RS_result.getString("QQ");
				youxiang = RS_result.getString("youxiang");
				dianhua = RS_result.getString("dianhua");
				neirong = RS_result.getString("neirong");
				huifuneirong = RS_result.getString("huifuneirong");
				addtime = RS_result.getString("addtime");
		%>
		<tr>
			<td><%=i%></td>
			<td><%=cheng%></td>
			<td><%=xingbie%></td>
			<td><%=QQ%></td>
			<td><%=youxiang%></td>
			<td><%=dianhua%></td>
			<td><%=neirong%></td>
			<td><%=addtime%></td>
			<td><%=huifuneirong%></td>
			<td><a href="del.jsp?id=<%=id%>&tablename=liuyanban"
				onClick="return confirm('真的要删除？')">删除</a> <a
				href="hf.jsp?id=<%=id%>">回复</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<br> 以上数据共<%=i%>条,
	<a style="cursor: hand" onClick="javascript:window.print();">打印本页</a>
</body>
</html>

