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

<title>新生报到系统</title>
<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--
.style1 {
	WIDTH: 63px
}

.STYLE2 {
	color: #477641;
	font-weight: bold;
}

.STYLE3 {
	color: #FFFFFF
}

.STYLE4 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
</style>

</head>
<%
	String id = request.getParameter("id");
	connDbBean.executeUpdate("update xinwentongzhi set dianjilv=dianjilv+1 where id=" + id);
%>
<body>
	<table width="992" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="2"><%@ include file="qttop.jsp"%>
			</td>
		</tr>
		<tr>
			<td width="163" valign="top"><%@ include file="qtleft.jsp"%></td>
			<td width="813" valign="top"><table width="98%" border="0"
					align="center" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td height="44" background="qtimages/index_r4_c8.jpg"><table
									width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="8%">&nbsp;</td>
										<td width="92%" class="red STYLE2">内容详细</td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td height="723" valign="top" class="boder">
								<%
									String sql = "select * from xinwentongzhi where id=" + id;
									String biaoti = "";
									String leibie = "";
									String neirong = "";
									String tianjiaren = "";
									String dianjilv = "";
									ResultSet RS_result = connDbBean.executeQuery(sql);
									while (RS_result.next()) {
										biaoti = RS_result.getString("biaoti");
										leibie = RS_result.getString("leibie");
										neirong = RS_result.getString("neirong");
										tianjiaren = RS_result.getString("tianjiaren");
										dianjilv = RS_result.getString("dianjilv");
								%>
								<table width="96%" border="0" align="center" cellpadding="0"
									cellspacing="0" bordercolor="#528945" class="newsline"
									style="border-collapse: collapse">
									<tr>
										<td height="46" align="center"><%=biaoti%> (被访问<%=dianjilv%>次)
										</td>
									</tr>
									<tr>
										<td height="110" align="left"><%=neirong%></td>
									</tr>
									<tr>
										<td height="31" align="right"><input type="button"
											name="Submit5" value="返回"
											onClick="javascript:history.back();"
											style="height: 19px; border: solid 1px #000000; color: #666666"></td>
									</tr>
								</table>
								<%
									}
								%>







							</td>
						</tr>
						<tr>
							<td valign="top" height="9"><img
								src="qtimages/index_r19_c8.jpg" width="320" /></td>
						</tr>

					</tbody>
				</table></td>
		</tr>
	</table>
	<%@ include file="qtdown.jsp"%>
</body>
</html>

