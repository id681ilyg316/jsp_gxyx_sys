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
<script language="javascript" src="js/Calendar.js"></script>
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
	String sql;
	ResultSet RS_result;
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
										<td width="92%" class="red STYLE2">校园风光</td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td height="723" valign="top" class="boder">






								<form name="form1" id="form1" action="">
									搜索: 名称：<input name="mingcheng" type="text" id="mingcheng"
										style='border: solid 1px #000000; color: #666666' size='10' />
									<input type="submit" name="Submit" value="查找"
										style='border: solid 1px #000000; color: #666666' />
								</form>
								<table width="100%" height="12%" border="0" align="center"
									cellpadding="0" cellspacing="0">
									<tr>
										<%
											int curpage = 1;//当前页
											int page_record = 16;//每页显示的记录数
											int zgs = 0;
											int zys = 0;
											//用下面的方法（sql查询完成，速度快）
											String hsgnpage = request.getParameter("page");
											String fysql = "select count(id) as ss from xiaoyuanfengguang";
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
											if (((curpage - 1) * page_record) == 0) {
												sql = "select  * from xiaoyuanfengguang where 1=1 ";
											} else {
												String tempsql = "select  id from xiaoyuanfengguang order by id desc limit 0,"
														+ (curpage - 1) * page_record + "";
												ResultSet tempRS_result = connDbBean.executeQuery(tempsql);
												int tempid = 0;
												String tempidstring = "";
												while (tempRS_result.next()) {
													tempidstring = tempidstring + tempRS_result.getString("id") + ",";
												}

												if (tempidstring == "") {
													sql = "select * from xiaoyuanfengguang";
												} else {
													tempidstring = tempidstring.substring(0, tempidstring.length() - 1);
													sql = "select  * from xiaoyuanfengguang where id not in (" + tempidstring + ")  ";
												}

											}

											if (request.getParameter("mingcheng") == "" || request.getParameter("mingcheng") == null) {
											} else {
												sql = sql + " and mingcheng like '%" + new String(request.getParameter("mingcheng").getBytes("8859_1"))
														+ "%'";
											}
											sql = sql + " order by id desc  limit 0," + page_record + "";
											RS_result = connDbBean.executeQuery(sql);
											String id = "";
											String tupian = "";
											String mingcheng = "";
											String addtime = "";
											int i = 0;
											while (RS_result.next()) {
												i = i + 1;
												id = RS_result.getString("id");
												tupian = RS_result.getString("tupian");
												mingcheng = RS_result.getString("mingcheng");
												addtime = RS_result.getString("addtime");
										%>
										<td align="center"><table width="150" height="153"
												border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td height="126" align="center"><a href="<%=tupian%>"
														target="_blank"><img src="<%=tupian%>" width="109"
															height="126" border="0" /></a></td>
												</tr>
												<tr>
													<td height="26" align="center"><%=mingcheng%></td>
												</tr>
											</table></td>
										<%
											if (i == 4) {
													i = 0;
													out.print("</tr><tr>");
												}
											}
										%>
									</tr>
								</table>

								<p align="center">
									&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record%>条/页 <a
										href="xiaoyuanfengguanglisttp.jsp?page=1">首页</a> <a
										href="xiaoyuanfengguanglisttp.jsp?page=<%=curpage - 1%>">上一页</a>
									<A href="xiaoyuanfengguanglisttp.jsp?page=<%=curpage + 1%>">下一页</A>
									<a href="xiaoyuanfengguanglisttp.jsp?page=<%=zys%>">尾页</A> 当前第<FONT
										color=red><%=curpage%></FONT>页/共<FONT color=red><%=zys%></FONT>页
								</p>








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


