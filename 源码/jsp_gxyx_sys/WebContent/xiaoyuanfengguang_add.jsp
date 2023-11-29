
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

<title>校园风光</title>
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
		if (document.form1.tupian.value == "") {
			alert("请输入图片");
			document.form1.tupian.focus();
			return false;
		}
		if (document.form1.mingcheng.value == "") {
			alert("请输入名称");
			document.form1.mingcheng.focus();
			return false;
		}
	}
	function gow() {
		document.location.href = "xiaoyuanfengguang_add.jsp?jihuabifffanhao="
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
		action="xiaoyuanfengguang_add_post.jsp">
		添加校园风光: <br>
		<br>
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td>图片：</td>
				<td><input name='tupian' type='text' id='tupian' size='50'
					value='' style='border: solid 1px #000000; color: #666666' />&nbsp;<input
					type='button' value='上传' onClick="up('tupian')"
					style='border: solid 1px #000000; color: #666666' />&nbsp;*</td>
			</tr>
			<tr>
				<td>名称：</td>
				<td><input name='mingcheng' type='text' id='mingcheng' value=''
					size='50' style='border: solid 1px #000000; color: #666666' />&nbsp;*</td>
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

