
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

<title>缴费记录详细</title>
<script language="javascript" src="js/Calendar.js"></script>

<LINK href="css.css" type=text/css rel=stylesheet>

</head>
<script language="javascript">
	function check() {
		fewgidsoidfjdkgds
	}
</script>
<body>
	<%
		String id = request.getParameter("id");
	%>

	缴费记录详细:
	<br>
	<br>
	<%
		String sql = "select * from jiaofeijilu where id=" + id;
		String xuehao = "";
		String xingming = "";
		String banji = "";
		String zhuanye = "";
		String xuenian = "";
		String xueqi = "";
		String feiyongleixing = "";
		String feiyongjine = "";
		String beizhu = "";
		ResultSet RS_result = connDbBean.executeQuery(sql);
		while (RS_result.next()) {
			xuehao = RS_result.getString("xuehao");
			xingming = RS_result.getString("xingming");
			banji = RS_result.getString("banji");
			zhuanye = RS_result.getString("zhuanye");
			xuenian = RS_result.getString("xuenian");
			xueqi = RS_result.getString("xueqi");
			feiyongleixing = RS_result.getString("feiyongleixing");
			feiyongjine = RS_result.getString("feiyongjine");
			beizhu = RS_result.getString("beizhu");
		}
	%>
	<table width="100%" border="1" align="center" cellpadding="3"
		cellspacing="1" bordercolor="#00FFFF"
		style="border-collapse: collapse">
		<tr>
			<td width='11%'>学号：</td>
			<td width='39%'><%=xuehao%></td>
			<td width='11%'>姓名：</td>
			<td width='39%'><%=xingming%></td>
		</tr>
		<tr>
			<td width='11%'>班级：</td>
			<td width='39%'><%=banji%></td>
			<td width='11%'>专业：</td>
			<td width='39%'><%=zhuanye%></td>
		</tr>
		<tr>
			<td width='11%'>学年：</td>
			<td width='39%'><%=xuenian%></td>
			<td width='11%'>学期：</td>
			<td width='39%'><%=xueqi%></td>
		</tr>
		<tr>
			<td width='11%'>费用类型：</td>
			<td width='39%'><%=feiyongleixing%></td>
			<td width='11%'>费用金额：</td>
			<td width='39%'><%=feiyongjine%></td>
		</tr>
		<tr>
			<td width='11%'>备注：</td>
			<td width='39%'><%=beizhu%></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan=4 align=center><input type=button name=Submit5
				value=返回 onClick="javascript:history.back()" /></td>
		</tr>

	</table>

</body>
</html>


