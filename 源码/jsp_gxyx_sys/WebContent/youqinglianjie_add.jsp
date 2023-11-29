
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

<title>友情链接</title>
<LINK href="qtimages/CSS.css" type=text/css rel=stylesheet>

</head>

<body>
	<form name="form1" id="form1" method="post"
		action="youqinglianjie_add_post.jsp">
		添加友情链接: <br>
		<br>
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td>网站名称：</td>
				<td><input name='wangzhanmingcheng' type='text'
					id='wangzhanmingcheng' value='' /></td>
			</tr>
			<tr>
				<td>网址：</td>
				<td><input name='wangzhi' type='text' id='wangzhi' value=''
					size="50" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" name="Submit" value="提交"
					onClick="return check();" /> <input type="reset" name="Submit2"
					value="重置" /></td>
			</tr>
		</table>
	</form>

</body>
</html>

