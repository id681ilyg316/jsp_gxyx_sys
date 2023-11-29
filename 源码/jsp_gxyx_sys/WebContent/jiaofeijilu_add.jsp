
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

<title>缴费记录</title>
<LINK href="css.css" type=text/css rel=stylesheet>
<script language="javascript" src="js/Calendar.js"></script>
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
	if(document.form1.xuehao.value==""){alert("请输入学号");document.form1.xuehao.focus();return false;}if(document.form1.xingming.value==""){alert("请输入姓名");document.form1.xingming.focus();return false;}if(document.form1.feiyongjine.value==""){alert("请输入费用金额");document.form1.feiyongjine.focus();return false;}if((/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(document.form1.feiyongjine.value))){}else{alert("费用金额必需数字型");document.form1.feiyongjine.focus();return false;}
}
function gow()
{
	document.location.href="jiaofeijilu_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
}
</script>
<body>
	<%
		String sql;
		ResultSet RS_result;
		String id = request.getParameter("id");
		sql = "select * from xinshengbaodao where id=" + id;
		String xuehao = "";
		String xingming = "";
		String banji = "";
		String zhuanye = "";
		RS_result = connDbBean.executeQuery(sql);
		while (RS_result.next()) {
			xuehao = RS_result.getString("xuehao");
			xingming = RS_result.getString("xingming");
			banji = RS_result.getString("banji");
			zhuanye = RS_result.getString("zhuanye");
		}
	%>
	<form name="form1" id="form1" method="post"
		action="jiaofeijilu_add_post.jsp">
		添加缴费记录: <br>
		<br>
		<table width="100%" border="1" align="center" cellpadding="3"
			cellspacing="1" bordercolor="#00FFFF"
			style="border-collapse: collapse">
			<tr>
				<td>学号：</td>
				<td><input name='xuehao' type='text' id='xuehao'
					style='border: solid 1px #000000; color: #666666'
					value='<%=request.getSession().getAttribute("username")%>'
					readonly='readonly' />&nbsp;*</td>
			</tr>
			<script language="javascript">document.form1.xuehao.value='<%=xuehao%>';</script>
			<tr>
				<td>姓名：</td>
				<td><input name='xingming' type='text' id='xingming' value=''
					style='border: solid 1px #000000; color: #666666'
					readonly='readonly' />&nbsp;*</td>
			</tr>
			<script language="javascript">document.form1.xingming.value='<%=xingming%>';</script>
			<tr>
				<td>班级：</td>
				<td><input name='banji' type='text' id='banji' value=''
					style='border: solid 1px #000000; color: #666666'
					readonly='readonly' /></td>
			</tr>
			<script language="javascript">document.form1.banji.value='<%=banji%>';</script>
			<tr>
				<td>专业：</td>
				<td><input name='zhuanye' type='text' id='zhuanye' value=''
					style='border: solid 1px #000000; color: #666666'
					readonly='readonly' /></td>
			</tr>
			<script language="javascript">document.form1.zhuanye.value='<%=zhuanye%>
				';
			</script>
			<tr>
				<td>学年：</td>
				<td><select name='xuenian' id='xuenian'>
						<option value="2014">2014</option>
						<option value="2013">2013</option>
						<option value="2012">2012</option>
						<option value="2011">2011</option>

				</select></td>
			</tr>
			<tr>
				<td>学期：</td>
				<td><select name='xueqi' id='xueqi'>
						<option value="1">1</option>
						<option value="2">2</option>
				</select></td>
			</tr>
			<tr>
				<td>费用类型：</td>
				<td><select name='feiyongleixing' id='feiyongleixing'>
						<option value="学杂费">学杂费</option>
						<option value="住宿费">住宿费</option>
						<option value="教材费">教材费</option>
						<option value="保险费">保险费</option>
				</select></td>
			</tr>
			<tr>
				<td>费用金额：</td>
				<td><input name='feiyongjine' type='text' id='feiyongjine'
					value='' style='border: solid 1px #000000; color: #666666' />&nbsp;*&nbsp;&nbsp;必需数字型</td>
			</tr>
			<tr>
				<td>备注：</td>
				<td><textarea name='beizhu' cols='50' rows='5' id='beizhu'
						style='border: solid 1px #000000; color: #666666'></textarea></td>
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

