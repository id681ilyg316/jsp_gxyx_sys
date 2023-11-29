
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

<title>宿舍楼信息</title>
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
		if (document.form1.louhao.value == "") {
			alert("请输入楼号");
			document.form1.louhao.focus();
			return false;
		}
		if (document.form1.cengshu.value == "") {
			alert("请输入层数");
			document.form1.cengshu.focus();
			return false;
		}
		if (document.form1.louguanyuan.value == "") {
			alert("请输入楼管员");
			document.form1.louguanyuan.focus();
			return false;
		}
		if (document.form1.dianhua.value == "") {
			alert("请输入电话");
			document.form1.dianhua.focus();
			return false;
		}
	}
</script>
<body>
	<%
		String id = request.getParameter("id");
	%>
	<form name="form1" id="form1" method="post"
		action="sushelouxinxi_updt_post.jsp?id=<%=id%>">
		修改宿舍楼信息: <br>
		<br>
		<%
			String sql = "select * from sushelouxinxi where id=" + id;
			String louhao = "";
			String cengshu = "";
			String louguanyuan = "";
			String dianhua = "";
			String beizhu = "";
			ResultSet RS_result = connDbBean.executeQuery(sql);
			while (RS_result.next()) {
				louhao = RS_result.getString("louhao");
				cengshu = RS_result.getString("cengshu");
				louguanyuan = RS_result.getString("louguanyuan");
				dianhua = RS_result.getString("dianhua");
				beizhu = RS_result.getString("beizhu");
			}
		%>
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td>楼号：</td>
				<td><input name='louhao' type='text' id='louhao'
					value='<%=louhao%>'
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr>
				<td>层数：</td>
				<td><input name='cengshu' type='text' id='cengshu'
					value='<%=cengshu%>'
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr>
				<td>楼管员：</td>
				<td><input name='louguanyuan' type='text' id='louguanyuan'
					value='<%=louguanyuan%>'
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr>
				<td>电话：</td>
				<td><input name='dianhua' type='text' id='dianhua'
					value='<%=dianhua%>'
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


