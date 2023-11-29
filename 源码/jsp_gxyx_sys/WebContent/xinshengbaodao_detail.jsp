
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

<title>新生报到详细</title>
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

	新生报到详细:
	<br>
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
		<tr>
			<td width='11%' height=44>学号：</td>
			<td width='39%'><%=xuehao%></td>
			<td rowspan=11 align=center><a href=<%=zhaopian%> target=_blank><img
					src=<%=zhaopian%> width=228 height=215 border=0></a></td>
		</tr>
		<tr>
			<td width='11%' height=44>姓名：</td>
			<td width='39%'><%=xingming%></td>
		</tr>
		<tr>
			<td width='11%' height=44>密码：</td>
			<td width='39%'><%=mima%></td>
		</tr>
		<tr>
			<td width='11%' height=44>性别：</td>
			<td width='39%'><%=xingbie%></td>
		</tr>
		<tr>
			<td width='11%' height=44>班级：</td>
			<td width='39%'><%=banji%></td>
		</tr>
		<tr>
			<td width='11%' height=44>专业：</td>
			<td width='39%'><%=zhuanye%></td>
		</tr>
		<tr>
			<td width='11%' height=44>籍贯：</td>
			<td width='39%'><%=jiguan%></td>
		</tr>
		<tr>
			<td width='11%' height=44>地址：</td>
			<td width='39%'><%=dizhi%></td>
		</tr>
		<tr>
			<td width='11%' height=44>宿舍楼：</td>
			<td width='39%'><%=sushelou%></td>
		</tr>
		<tr>
			<td width='11%' height=44>房间号：</td>
			<td width='39%'><%=fangjianhao%></td>
		</tr>
		<tr>
			<td width='11%' height=44>床位号：</td>
			<td width='39%'><%=chuangweihao%></td>
		</tr>
		<tr>
			<td colspan=3 align=center><input type=button name=Submit5
				value=返回 onClick="javascript:history.back()" /></td>
		</tr>

	</table>

</body>
</html>


