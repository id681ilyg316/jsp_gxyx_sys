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
										<td width="9%">&nbsp;</td>
										<td width="76%" class="red STYLE2">在线留言</td>
										<td width="15%"><a href="lyb.jsp"><font
												class="red STYLE2">我要留言</font></a></td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td height="725" valign="top" class="boder"><p
									align="center">
									<%
										String sql;
										int curpage = 1;//当前页
										int page_record = 5;//每页显示的记录数
										int zgs = 0;
										int zys = 0;
										//用下面的方法（sql查询完成，速度快）
										String hsgnpage = request.getParameter("page");
										String fysql = "select count(id) as ss from liuyanban";
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
											sql = "select  * from liuyanban where 1=1 ";
											sql = sql + " order by id desc limit 0," + page_record + "";
										} else {
											String tempsql = "select  id from liuyanban order by id desc limit 0," + (curpage - 1) * page_record
													+ "";
											ResultSet tempRS_result = connDbBean.executeQuery(tempsql);
											int tempid = 0;
											String tempidstring = "";
											while (tempRS_result.next()) {
												tempidstring = tempidstring + tempRS_result.getString("id") + ",";
											}
											if (tempidstring == "") {
												sql = "select * from liuyanban";
											} else {
												tempidstring = tempidstring.substring(0, tempidstring.length() - 1);
												sql = "select  * from liuyanban where id not in (" + tempidstring + ")  ";
											}
										}

										ResultSet RS_result = connDbBean.executeQuery(sql);
										String id = "";
										String nicheng = "";
										String xingbie = "";
										String QQ = "";
										String youxiang = "";
										String dianhua = "";
										String neirong = "";
										String huifuneirong = "";
										String addtime = "";
										int i = 0;

										while (RS_result.next()) {
											i = i + 1;
											id = RS_result.getString("id");
											nicheng = RS_result.getString("cheng");
											xingbie = RS_result.getString("xingbie");
											QQ = RS_result.getString("QQ");
											youxiang = RS_result.getString("youxiang");
											dianhua = RS_result.getString("dianhua");
											neirong = RS_result.getString("neirong");
											huifuneirong = RS_result.getString("huifuneirong");
											addtime = RS_result.getString("addtime");
									%>
								</p>
								<table width="98%" border="0" align="center" cellpadding="0"
									cellspacing="1" bgcolor="#6EA6C1" class="tb">
									<!--DWLayoutTable-->
									<tr>
										<td width="85" rowspan="4" align="center" valign="middle"
											bgcolor="#FFFFFF"><img width='70' height='70' src=img/<%=xingbie%>.gif border=0></td>
										<td height="20" align="left" valign="middle" bgcolor="#FFFFFF">&nbsp;
											&nbsp; 留言于:<%=addtime%> &nbsp;
										</td>
									</tr>
									<tr>
										<td height="78" align="left" valign="top" bgcolor="#FFFFFF">&nbsp;<%=neirong%></td>
									</tr>
									<tr>
										<td align="left" valign="middle" bgcolor="#FFFFFF"
											style="height: 25px">&nbsp; &nbsp;昵称：<%=nicheng%> &nbsp;
											&nbsp;电话：<%=dianhua%>&nbsp;&nbsp;邮 箱:<%=youxiang%> &nbsp; QQ:<%=QQ%>&nbsp;
											&nbsp;
										</td>
									</tr>
									<tr>
										<td align="left" valign="middle" bgcolor="#FFFFFF"
											style="height: 25px">&nbsp; &nbsp;管理员回复：<%=huifuneirong%></td>
									</tr>
								</table> <%
 	}
 %>
								<p align="center">
									&nbsp;&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record%>条/页 <a
										href="lyblist.jsp?page=1">首页</a> <a
										href="lyblist.jsp?page=<%=curpage - 1%>">上一页</a> <A
										href="lyblist.jsp?page=<%=curpage + 1%>">下一页</A> <a
										href="lyblist.jsp?page=<%=zys%>">尾页</A> 当前第<FONT color=red><%=curpage%></FONT>页/共<FONT
										color=red><%=zys%></FONT>页
								</p>
								<p align="center">&nbsp;</p></td>
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

