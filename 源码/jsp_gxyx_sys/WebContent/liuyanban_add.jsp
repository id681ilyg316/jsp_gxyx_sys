
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


</head>

<body>
	<form name="form1" id="form1" method="post"
		action="liuyanban_add_post.jsp">
		添加留言板: <br>
		<br>
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td>昵称：</td>
				<td><input name='cheng' type='text' id='cheng' value='' /></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><input name='xingbie' type='text' id='xingbie' value='' /></td>
			</tr>
			<tr>
				<td>QQ：</td>
				<td><input name='QQ' type='text' id='QQ' value='' /></td>
			</tr>
			<tr>
				<td>邮箱：</td>
				<td><input name='youxiang' type='text' id='youxiang' value='' /></td>
			</tr>
			<tr>
				<td>电话：</td>
				<td><input name='dianhua' type='text' id='dianhua' value='' /></td>
			</tr>
			<tr>
				<td>内容：</td>
				<td><input name='neirong' type='text' id='neirong' value='' /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" name="Submit" value="提交"
					onclick="return check();" /> <input type="reset" name="Submit2"
					value="重置" /></td>
			</tr>
		</table>
	</form>

</body>
</html>

