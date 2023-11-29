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
	request.setCharacterEncoding("UTF-8");
	String lb = request.getParameter("lb");
	String sql = "";
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
										<td width="92%" class="red STYLE2"><%=lb%></td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td height="725" valign="top" class="boder"><table
									width="98%" border="0" align="center" cellpadding="3"
									cellspacing="1" bordercolor="#FA9090" class="newsline"
									style="border-collapse: collapse">
									<%
										int curpage = 1;//当前页
										int page_record = 20;//每页显示的记录数
										int zgs = 0;
										int zys = 0;
										//用下面的方法（sql查询完成，速度快）
										String hsgnpage = request.getParameter("page");
										String fysql = "select count(id) as ss from xinwentongzhi where leibie='" + lb + "'";
										ResultSet RS_resultfy = connDbBean.executeQuery(fysql);
										while (RS_resultfy.next()) {
											zgs = Integer.parseInt(RS_resultfy.getString("ss"));
											if ((zgs % page_record) == 0) {
												zys = zgs / page_record;
											} else {
												zys = zgs / page_record + 1;
											}
										}
										if (hsgnpage != null) {
											curpage = Integer.parseInt(request.getParameter("page"));//获取传递的值，需要显示的页
										} else {
											curpage = 1;
										}
										if (curpage == 0) {
											curpage = 1;
										}
										if (curpage > zys) {
											curpage = zys;
										}
										if (((curpage - 1) * page_record) == 0 || curpage == 0) {
											sql = "select  * from xinwentongzhi where leibie='" + lb + "' ";
										} else {
											String tempsql = "select  id from xinwentongzhi where leibie='" + lb + "' order by id desc limit 0,"
													+ (curpage - 1) * page_record + "";
											ResultSet tempRS_result = connDbBean.executeQuery(tempsql);
											int tempid = 0;
											String tempidstring = "";
											while (tempRS_result.next()) {
												tempidstring = tempidstring + tempRS_result.getString("id") + ",";
											}
											tempidstring = tempidstring.substring(0, tempidstring.length() - 1);
											sql = "select  * from xinwentongzhi where id not in (" + tempidstring + ") and leibie='" + lb + "' ";
										}

										if (request.getParameter("keyword") == "" || request.getParameter("keyword") == null) {
										} else {
											sql = sql + " and biaoti like '%"
													+ new String(request.getParameter("keyword").getBytes("8859_1")).trim() + "%'";
										}
										sql = sql + " order by id desc  limit 0," + page_record + "";
										//out.print(sql);
										ResultSet RS_result = connDbBean.executeQuery(sql);
										String id = "";
										String biaoti = "";
										String leibie = "";
										String neirong = "";
										String tianjiaren = "";
										String shouyetupian = "";
										String dianjilv = "";
										String addtime = "";
										int i = 0;

										while (RS_result.next()) {
											i = i + 1;
											id = RS_result.getString("id");
											biaoti = RS_result.getString("biaoti");
											leibie = RS_result.getString("leibie");
											neirong = RS_result.getString("neirong");
											tianjiaren = RS_result.getString("tianjiaren");
											shouyetupian = RS_result.getString("shouyetupian");
											dianjilv = RS_result.getString("dianjilv");
											addtime = RS_result.getString("addtime");
									%>
									<tr>
										<td width="31" align="center"><%=i%></td>
										<td width="517"><a href="gg_detail.jsp?id=<%=id%>"><%=biaoti%></a></td>
										<td width="79">被点击<%=dianjilv%>次
										</td>
										<td width="79" align="center"><%=addtime.substring(0, 10)%></td>
									</tr>
									<%
										}
									%>
								</table> <br> 以上数据共<%=i%>条,<a style="cursor: hand"
								onClick="javascript:window.print();">打印本页</a>
								<p align="center">
									&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record%>条/页 <a
										href="news.jsp?page=1&lb=<%=lb%>">首页</a> <a
										href="news.jsp?page=<%=curpage - 1%>&lb=<%=lb%>">上一页</a> <A
										href="news.jsp?page=<%=curpage + 1%>&lb=<%=lb%>">下一页</A> <a
										href="news.jsp?page=<%=zys%>&lb=<%=lb%>">尾页</A> 当前第<FONT
										color=red><%=curpage%></FONT>页/共<FONT color=red><%=zys%></FONT>页
								</p></td>
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

