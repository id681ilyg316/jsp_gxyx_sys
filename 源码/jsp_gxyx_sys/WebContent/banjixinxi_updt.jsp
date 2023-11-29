
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

<title>班级信息</title>
<script language="javascript" src="js/Calendar.js"></script>
<LINK href="css.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript">
	function up(tt) {
		var pop = new Popup({
			contentType : 1,
			isReloadOnClose : false,
			width : 300,
			height : 50
		});
		pop.setContent("contentUrl", "upload.jsp?Result=" + tt);
		pop.setContent("title", "文件上传");
		pop.build();
		pop.show();
	}
</script>
</head>
<script language="javascript">
	function check() {
		if (document.form1.banji.value == "") {
			alert("请输入班级");
			document.form1.banji.focus();
			return false;
		}
		if (document.form1.banzhuren.value == "") {
			alert("请输入班主任");
			document.form1.banzhuren.focus();
			return false;
		}
	}
</script>
<body>
	<%
		String id = request.getParameter("id");
	%>
	<form name="form1" id="form1" method="post"
		action="banjixinxi_updt_post.jsp?id=<%=id%>">
		修改班级信息: <br>
		<br>
		<%
			String sql = "select * from banjixinxi where id=" + id;
			String banji = "";
			String banzhuren = "";
			String renshu = "";
			String beizhu = "";
			ResultSet RS_result = connDbBean.executeQuery(sql);
			while (RS_result.next()) {
				banji = RS_result.getString("banji");
				banzhuren = RS_result.getString("banzhuren");
				renshu = RS_result.getString("renshu");
				beizhu = RS_result.getString("beizhu");
			}
		%>
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td>班级：</td>
				<td><input name='banji' type='text' id='banji'
					value='<%=banji%>'
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr>
				<td>班主任：</td>
				<td><input name='banzhuren' type='text' id='banzhuren'
					value='<%=banzhuren%>'
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr>
				<td>人数：</td>
				<td><input name='renshu' type='text' id='renshu'
					value='<%=renshu%>'
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr>
				<td>备注：</td>
				<td><textarea name='beizhu' cols='50' rows='5' id='beizhu'
						style='border: solid 1px #000000; color: #666666'><%=beizhu%></textarea></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" name="Submit" value="提交"
					onclick="return check();"
					style='border: solid 1px #000000; color: #666666' /> <input
					type="reset" name="Submit2" value="重置"
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
		</table>
	</form>

</body>
</html>


