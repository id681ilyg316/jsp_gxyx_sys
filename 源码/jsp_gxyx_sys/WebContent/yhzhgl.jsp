
<%
	if (request.getSession().getAttribute("cx").equals("管理员")) {

	} else {
		out.print("<script>alert('对不起,您没有这个权限!!');history.back();</script>");
	}
%>
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

<title>修改密码</title>


</head>
<script language="javascript">
	function check() {
		if (document.form1.username.value == "") {
			alert("请输入用户名");
			document.form1.username.focus();
			return false;
		}
		if (document.form1.pwd1.value == "") {
			alert("请输入密码");
			document.form1.pwd1.focus();
			return false;
		}
		if (document.form1.pwd2.value == "") {
			alert("请输入确认密码");
			document.form1.pwd2.focus();
			return false;
		}
		if (document.form1.pwd2.value != document.form1.pwd1.value) {
			alert("两次密码不一致,请确认");
			document.form1.pwd1.value = "";
			document.form1.pwd2.value = "";
			document.form1.pwd1.focus();
			return false;
		}
	}
</script>
<body>
	<form name="form1" id="form1" action="yhzhgl_post.jsp">
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td>用户名：</td>
				<td><input name="username" type="text" id="username" /> *</td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input name="pwd1" type="password" id="pwd1" /> *</td>
			</tr>
			<tr>
				<td>确认密码：</td>
				<td><input name="pwd2" type="password" id="pwd2" /> *</td>
			</tr>
			<tr>
				<td>权限：</td>
				<td><select name="cx" id="cx">
						<option value="辅导员">辅导员</option>
						<option value="财务处">财务处</option>
				</select></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" name="Submit" value="提交"
					onClick="return check();" /> <input type="reset" name="Submit2"
					value="重置" /></td>
			</tr>
		</table>
	</form>
	<p>已有管理员列表：</p>
	<table width="100%" border="1" align="center" cellpadding="3"
		cellspacing="1" bordercolor="#00FFFF"
		style="border-collapse: collapse">
		<tr>
			<td bgcolor="A4B6D7">序号</td>
			<td bgcolor="A4B6D7">用户名</td>
			<td bgcolor="A4B6D7">密码</td>
			<td bgcolor="A4B6D7">权限</td>
			<td bgcolor="A4B6D7">添加时间</td>
			<td bgcolor="A4B6D7">操作</td>
		</tr>
		<%
			ResultSet RS_result = connDbBean.executeQuery("select * from allusers order by id desc");
			String id = "";
			String username = "";
			String pwd = "";
			String cx = "";
			String addtime = "";
			int i = 0;

			while (RS_result.next()) {
				i = i + 1;
				id = RS_result.getString("id");
				username = RS_result.getString("username");
				pwd = RS_result.getString("pwd");
				cx = RS_result.getString("cx");
				addtime = RS_result.getString("addtime");
		%>
		<tr>
			<td><%=i%></td>
			<td><%=username%></td>
			<td><%=pwd%></td>
			<td><%=cx%></td>
			<td><%=addtime%></td>
			<td><a href="del.jsp?id=<%=id%>&tablename=allusers"
				onClick="return confirm('真的要删除？')">删除</a></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>

