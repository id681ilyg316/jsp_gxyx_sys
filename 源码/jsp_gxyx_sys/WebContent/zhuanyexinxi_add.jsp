
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

<title>专业信息</title>
<LINK href="css.css" type=text/css rel=stylesheet>
<script language="javascript" src="js/Calendar.js"></script>
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
		if (document.form1.zhuanye.value == "") {
			alert("请输入专业");
			document.form1.zhuanye.focus();
			return false;
		}
		if (document.form1.suozaiyuanxi.value == "") {
			alert("请输入所在院系");
			document.form1.suozaiyuanxi.focus();
			return false;
		}
	}
	function gow() {
		document.location.href = "zhuanyexinxi_add.jsp?jihuabifffanhao="
				+ document.form1.jihuabifffanhao.value;
	}
</script>
<body>
	<%
		String sql;
		ResultSet RS_result;
		//islbdq String id=request.getParameter("id");
		//islbdq sql="select * from melieibaoduqubiaoiguo where id="+id;
		//islbdq gogogogogo
		//islbdq RS_result=connDbBean.executeQuery(sql);
		//islbdq while(RS_result.next()){
		//islbdq lelelelelele
		//islbdq }
	%>
	<form name="form1" id="form1" method="post"
		action="zhuanyexinxi_add_post.jsp">
		添加专业信息: <br>
		<br>
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td>专业：</td>
				<td><input name='zhuanye' type='text' id='zhuanye' value=''
					style='border: solid 1px #000000; color: #666666' />&nbsp;*</td>
			</tr>
			<tr>
				<td>所在院系：</td>
				<td><input name='suozaiyuanxi' type='text' id='suozaiyuanxi'
					value='' style='border: solid 1px #000000; color: #666666' />&nbsp;*</td>
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

