
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

<title>新生报到</title>
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
		if (document.form1.xuehao.value == "") {
			alert("请输入学号");
			document.form1.xuehao.focus();
			return false;
		}
		if (document.form1.xingming.value == "") {
			alert("请输入姓名");
			document.form1.xingming.focus();
			return false;
		}
		if (document.form1.mima.value == "") {
			alert("请输入密码");
			document.form1.mima.focus();
			return false;
		}
	}
	function gow() {
		document.location.href = "xinshengbaodao_add.jsp?jihuabifffanhao="
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
		action="xinshengbaodao_add_post.jsp">
		添加新生报到: <br>
		<br>
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td>学号：</td>
				<td><input name='xuehao' type='text' id='xuehao' value=''
					style='border: solid 1px #000000; color: #666666' />&nbsp;*</td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td><input name='xingming' type='text' id='xingming' value=''
					style='border: solid 1px #000000; color: #666666' />&nbsp;*</td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input name='mima' type='text' id='mima' value=''
					style='border: solid 1px #000000; color: #666666' />&nbsp;*</td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><select name='xingbie' id='xingbie'><option
							value="男">男</option>
						<option value="女">女</option></select></td>
			</tr>
			<tr>
				<td>班级：</td>
				<td><select name='banji' id='banji'>
						<%
							sql = "select banji from banjixinxi order by id desc";
							RS_result = connDbBean.executeQuery(sql);
							while (RS_result.next()) {
						%><option
							value="<%=RS_result.getString("banji")%>"><%=RS_result.getString("banji")%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td>专业：</td>
				<td><select name='zhuanye' id='zhuanye'>
						<%
							sql = "select zhuanye from zhuanyexinxi order by id desc";
							RS_result = connDbBean.executeQuery(sql);
							while (RS_result.next()) {
						%><option
							value="<%=RS_result.getString("zhuanye")%>"><%=RS_result.getString("zhuanye")%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td>籍贯：</td>
				<td><input name='jiguan' type='text' id='jiguan' value=''
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr>
				<td>地址：</td>
				<td><input name='dizhi' type='text' id='dizhi' value=''
					size='50' style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr>
				<td>照片：</td>
				<td><input name='zhaopian' type='text' id='zhaopian' size='50'
					value='' style='border: solid 1px #000000; color: #666666' />&nbsp;<input
					type='button' value='上传' onClick="up('zhaopian')"
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr style='display: none'>
				<td>宿舍楼：</td>
				<td><select name='sushelou' id='sushelou'>
						<option value=""></option>
						<%
							sql = "select louhao from sushelouxinxi order by id desc";
							RS_result = connDbBean.executeQuery(sql);
							while (RS_result.next()) {
						%><option
							value="<%=RS_result.getString("louhao")%>"><%=RS_result.getString("louhao")%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr style='display: none'>
				<td>房间号：</td>
				<td><input name='fangjianhao' type='text' id='fangjianhao'
					value='' style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr style='display: none'>
				<td>床位号：</td>
				<td><input name='chuangweihao' type='text' id='chuangweihao'
					value='' style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" name="Submit" value="提交"
					onClick="return check();"
					style='border: solid 1px #000000; color: #666666' /> <input
					type="reset" name="Submit2" value="重置"
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
		</table>
	</form>

</body>
</html>

