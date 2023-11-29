
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String lb = request.getParameter("lb");
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

<title>新闻通知</title>
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
		if (document.form1.biaoti.value == "") {
			alert("请输入标题");
			document.form1.biaoti.focus();
			return false;
		}
		if (document.form1.leibie.value == "") {
			alert("请输入类别");
			document.form1.leibie.focus();
			return false;
		}
		if (document.form1.tianjiaren.value == "") {
			alert("请输入添加人");
			document.form1.tianjiaren.focus();
			return false;
		}
		if (document.form1.dianjilv.value == "") {
			alert("请输入点击率");
			document.form1.dianjilv.focus();
			return false;
		}
	}
	function gow() {
		document.location.href = "xinwentongzhi_add.jsp?jihuabifffanhao="
				+ document.form1.jihuabifffanhao.value;
	}
</script>
<body>
	<form name="form1" id="form1" method="post"
		action="xinwentongzhi_add_post.jsp">
		添加<%=lb%>: <br> <br>
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td>标题：</td>
				<td><input name='biaoti' type='text' id='biaoti' value=''
					size='50' />&nbsp;*</td>
			</tr>
			<tr>
				<td>类别：</td>
				<td><input name='leibie' type='text' id='leibie'
					value='<%=lb%>' />&nbsp;*</td>
			</tr>
			<tr>
				<td>内容：</td>
				<td><textarea id="neirong" name="neirong" cols="3"
						style="width: 700px;height=400px"></textarea> <script
						type="text/javascript">
							UE.getEditor("neirong");
						</script></td>
			</tr>

			<tr>
				<td>添加人：</td>
				<td><input name='tianjiaren' type='text' id='tianjiaren'
					value='<%=request.getSession().getAttribute("username")%>' />&nbsp;*</td>
			</tr>
			<tr>
				<td>首页图片：</td>
				<td><input name='shouyetupian' type='text' id='shouyetupian'
					size='50' value='' />&nbsp;<input type='button' value='上传'
					onClick="up('shouyetupian')" /></td>
			</tr>
			<tr>
				<td>点击率：</td>
				<td><input name='dianjilv' type='text' id='dianjilv' value='1' />&nbsp;*</td>
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

