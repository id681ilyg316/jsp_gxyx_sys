
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
<script type="text/javascript"
	src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript"
	src="/ueditor/lang/zh-cn/zh-cn.js"></script>

<title>dx</title>


</head>

<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String lb = request.getParameter("lb");
	%>
	<form name="form1" id="form1" method="post"
		action="dx_post.jsp?lb=<%=lb%>">
		编辑<%=lb%>: <br>
		<br>
		<%
			String sql = "select * from dx where leibie='" + lb + "'";
			String contdent = "";
			ResultSet RS_result = connDbBean.executeQuery(sql);
			while (RS_result.next()) {
				contdent = RS_result.getString("content");
			}
		%>
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#00FFFF"
			style="border-collapse: collapse">

			<tr>
				<td>内容：</td>
				<td><textarea id="content" name="content" cols="3"
						style="width: 700px;height=400px"><%=contdent%></textarea> <script
						type="text/javascript">
							UE.getEditor("content");
						</script> <input name="lb" type="hidden" id="lb" value="<%=lb%>"></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" name="Submit" value="确定编辑"
					onClick="return check();" /> <input type="reset" name="Submit2"
					value="重置" /></td>
			</tr>
		</table>
	</form>

</body>
</html>


