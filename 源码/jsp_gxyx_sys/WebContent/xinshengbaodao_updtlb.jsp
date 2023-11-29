
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
<script language="javascript" src="js/Calendar.js"></script>
<LINK href="css.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript">
	    function up(tt)
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
            pop.setContent("contentUrl","upload.jsp?Result="+tt);
            pop.setContent("title","文件上传");
            pop.build();
            pop.show();
	    }
	</script>
</head>
<script language="javascript">
function check()
{
	if(document.form1.xuehao.value==""){alert("请输入学号");document.form1.xuehao.focus();return false;}if(document.form1.xingming.value==""){alert("请输入姓名");document.form1.xingming.focus();return false;}if(document.form1.mima.value==""){alert("请输入密码");document.form1.mima.focus();return false;}
}
</script>
<body>
	<%
		String id = request.getParameter("id");
	%>
	<form name="form1" id="form1" method="post"
		action="xinshengbaodao_updt_postlb.jsp?id=<%=id%>">
		设置新生报到: <br>
		<br>
		<%
			String sql = "select * from xinshengbaodao where id=" + id;
			String xuehao = "";
			String xingming = "";
			String mima = "";
			String xingbie = "";
			String banji = "";
			String zhuanye = "";
			String jiguan = "";
			String dizhi = "";
			String zhaopian = "";
			String sushelou = "";
			String fangjianhao = "";
			String chuangweihao = "";
			ResultSet RS_result = connDbBean.executeQuery(sql);
			while (RS_result.next()) {
				xuehao = RS_result.getString("xuehao");
				xingming = RS_result.getString("xingming");
				mima = RS_result.getString("mima");
				xingbie = RS_result.getString("xingbie");
				banji = RS_result.getString("banji");
				zhuanye = RS_result.getString("zhuanye");
				jiguan = RS_result.getString("jiguan");
				dizhi = RS_result.getString("dizhi");
				zhaopian = RS_result.getString("zhaopian");
				sushelou = RS_result.getString("sushelou");
				fangjianhao = RS_result.getString("fangjianhao");
				chuangweihao = RS_result.getString("chuangweihao");
			}
		%>
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#00FFFF"
			style="border-collapse: collapse">
			<tr style='display: none'>
				<td>学号：</td>
				<td><input name='xuehao' type='text' id='xuehao'
					value='<%=xuehao%>'
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr style='display: none'>
				<td>姓名：</td>
				<td><input name='xingming' type='text' id='xingming'
					value='<%=xingming%>'
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr style='display: none'>
				<td>密码：</td>
				<td><input name='mima' type='text' id='mima' value='<%=mima%>'
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr style='display: none'>
				<td>性别：</td>
				<td><select name='xingbie' id='xingbie'><option
							value="男">男</option>
						<option value="女">女</option></select></td>
			</tr>
			<script language="javascript">document.form1.xingbie.value='<%=xingbie%>';</script>
			<tr style='display: none'>
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
			<script language="javascript">document.form1.banji.value='<%=banji%>';</script>
			<tr style='display: none'>
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
			<script language="javascript">document.form1.zhuanye.value='<%=zhuanye%>';</script>
			<tr style='display: none'>
				<td>籍贯：</td>
				<td><input name='jiguan' type='text' id='jiguan'
					value='<%=jiguan%>'
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr style='display: none'>
				<td>地址：</td>
				<td><input name='dizhi' type='text' id='dizhi' size='50'
					value='<%=dizhi%>'
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr style='display: none'>
				<td>照片：</td>
				<td><input name='zhaopian' type='text' id='zhaopian' size='50'
					value='<%=zhaopian%>'
					style='border: solid 1px #000000; color: #666666' />&nbsp;<input
					type='button' value='上传' onClick="up('zhaopian')"
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr>
				<td>宿舍楼：</td>
				<td><select name='sushelou' id='sushelou'>
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
			<script language="javascript">document.form1.sushelou.value='<%=sushelou%>
				';
			</script>
			<tr>
				<td>房间号：</td>
				<td><input name='fangjianhao' type='text' id='fangjianhao'
					value='<%=fangjianhao%>'
					style='border: solid 1px #000000; color: #666666' /></td>
			</tr>
			<tr>
				<td>床位号：</td>
				<td><input name='chuangweihao' type='text' id='chuangweihao'
					value='<%=chuangweihao%>'
					style='border: solid 1px #000000; color: #666666' /></td>
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


