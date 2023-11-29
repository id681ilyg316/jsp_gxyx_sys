<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8" session="true"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<META content="MSHTML 6.00.2800.1106" name=GENERATOR>

</HEAD>
<script language="javascript">
	function loadimage() {
		document.getElementById("randImage").src = "image.jsp?" + Math.random();
	}
	function checkuserlog() {
		if (document.formlog.username.value == ""
				|| document.formlog.pwd1.value == ""
				|| document.formlog.rand.value == "") {
			alert('请输入完整');
			return false;
		}
	}

	function loadimage() {
		document.getElementById("randImage").src = "image.jsp?" + Math.random();
	}
</script>
<TABLE cellSpacing=0 cellPadding=0 width=189 border=0>
	<TBODY>
		<TR>
			<TD width="189" height="44" background="qtimages/index_r4_c1.gif"><table
					width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="32%">&nbsp;</td>
						<td width="68%" class="red STYLE2">系统公告</td>
					</tr>
				</table></TD>
		</TR>
		<TR>
			<TD class=introline height=111>

				<TABLE height=100 cellSpacing=0 cellPadding=0 width="100%" border=0>
					<TBODY>
						<TR>
							<TD align=left height=118><marquee border="0" direction="up"
									height="138" onMouseOut="start()" onMouseOver="stop()"
									scrollamount="1" scrolldelay="50">
									<TABLE width="92%" height="100%" border=0 align=center
										cellPadding=0 cellSpacing=5>
										<TBODY>
											<TR>
												<TD>
													<%
														String sqlxtgg = "select * from dx where leibie='系统公告'";
														ResultSet RS_resultxtgg = connDbBean.executeQuery(sqlxtgg);
														while (RS_resultxtgg.next()) {
															out.print(RS_resultxtgg.getString("content"));
														}
													%>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</marquee></TD>
						</TR>
					</TBODY>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD vAlign=top height=11><IMG height=11
				src="qtimages/index_r13_c1.jpg" width=189></TD>
		</TR>
		<TR>
			<TD align=middle background=qtimages/index_r16_c1.gif height=28>您当前IP：<%=request.getLocalAddr()%></TD>
		</TR>
		<TR>
			<TD height=3></TD>
		</TR>
		<TR>
			<TD width="189" height="32" background="qtimages/index_r23_c1.gif"><table
					width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="32%">&nbsp;</td>
						<td width="68%" class="red STYLE2">学生登陆</td>
					</tr>
				</table></TD>
		</TR>
		<TR>
			<TD class="introline">
				<%
					if ((String) request.getSession().getAttribute("username") == null
							|| (String) request.getSession().getAttribute("username") == "") {
				%>
				<table width="96%" border="0" align="center" cellpadding="3"
					cellspacing="1" bordercolor="#EFCE7B"
					style="border-collapse: collapse">
					<form name="formlog" action="userlog_post.jsp">
						<tr>
							<td width="25%" height="30">用户名</td>
							<td width="75%" height="30"><input name="username"
								type="text" id="username"
								Style="border-right: #cadcb2 1px solid; border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid; width: 80px; color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px"
								size="12"></td>
						</tr>
						<tr>
							<td height="30">密码</td>
							<td height="30"><input name="pwd1" type="password" id="pwd1"
								Style="border-right: #cadcb2 1px solid; border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid; width: 80px; color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px"></td>
						</tr>
						<tr style="display: none">
							<td height="30">权限</td>
							<td height="30"><select name="cx" id="cx"
								Style="border-right: #cadcb2 1px solid; border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid; width: 100px; color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px">
									<option value="学生">学生</option>
							</select></td>
						</tr>
						<tr>
							<td height="30">验证码</td>
							<td height="30"><input type="text" name="rand" id="rand"
								size="5"> <a href="javascript:loadimage();"><img
									alt="看不清请点我！" name="randImage" id="randImage" src="image.jsp"
									width="60" height="20" border="1" align="absmiddle"></a></td>
						</tr>
						<tr>
							<td height="30">&nbsp;</td>
							<td height="30"><input type="submit" name="Submit"
								value="登陆"
								style="height: 19px; border: solid 1px #000000; color: #666666"
								onClick="return checkuserlog()"> <input type="reset"
								name="Submit2" value="重置"
								style="height: 19px; border: solid 1px #000000; color: #666666"></td>
						</tr>
					</form>
				</table> <%
 	} else {
 %>
				<table width="90%" height="82%" border="0" align="center"
					cellpadding="0" cellspacing="0">
					<tr>
						<td width="31%" height="30">用户名</td>
						<td width="69%" height="30"><%=request.getSession().getAttribute("username")%></td>
					</tr>
					<tr>
						<td height="30">权限</td>
						<td height="30"><%=request.getSession().getAttribute("cx")%>
						</td>
					</tr>
					<tr>
						<td height="30" colspan="2" align="center"><input
							type="button" name="Submit3" value="退出"
							onClick="javascript:location.href='logout.jsp';"
							style="height: 19px; border: solid 1px #000000; color: #666666">
							<input type="button" name="Submit32" value="个人后台"
							onClick="javascript:location.href='main.jsp';"
							style="height: 19px; border: solid 1px #000000; color: #666666">
						</td>
					</tr>
				</table> <%
 	}
 %>
			</TD>
		</TR>

		<TR>
			<TD background=qtimages/index_r40_c1.jpg height=8></TD>
		</TR>
		<TR>
			<TD align=middle background=qtimages/index_r16_c1.gif height=28><iframe
					src="http://m.weather.com.cn/m/pn7/weather.htm?id=101210701T "
					width="176" height="20" marginwidth="0" marginheight="0" hspace="0"
					vspace="0" frameborder="0" scrolling="no"></iframe></TD>
		</TR>
		<TR>
			<TD width="189" height="44" background="qtimages/index_r4_c1.gif"><table
					width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="32%">&nbsp;</td>
						<td width="68%" class="red STYLE2">站内搜索</td>
					</tr>
				</table></TD>
		</TR>
		<TR>
			<TD class=introline height=111>

				<TABLE height=100 cellSpacing=0 cellPadding=0 width="100%" border=0>
					<TBODY>
						<TR>
							<TD align=left height=118><table width="100%" height="100"
									border="0" cellpadding="0" cellspacing="0">
									<form action="news.jsp" name="formsearch"
										id="formsearch">
										<tr>
											<td width="19%">标题</td>
											<td width="81%"><input name="keyword" type="text"
												id="keyword" size="18"
												style="height: 19px; border: solid 1px #000000; color: #666666" /></td>
										</tr>
										<tr>
											<td>类别</td>
											<td><select name="lb"
												style="height: 19px; border: solid 1px #000000; color: #666666">
													<%
														String sqllb = "select distinct(leibie) as ss from xinwentongzhi";
														ResultSet RS_resultlb = connDbBean.executeQuery(sqllb);
														String qtlb = "";
														while (RS_resultlb.next()) {
															qtlb = RS_resultlb.getString("ss");
													%>
													<option value="<%=qtlb%>"><%=qtlb%></option>
													<%
														}
													%>
											</select></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><input type="submit" name="Submit4" value="提交"
												style="height: 19px; border: solid 1px #000000; color: #666666" /></td>
										</tr>
									</form>
								</table></TD>
						</TR>
					</TBODY>
				</TABLE>
			</TD>
		</TR>
		<TR>
			<TD width="189" height="32" background="qtimages/index_r41_c1sz.gif"><table
					width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="32%">&nbsp;</td>
						<td width="68%" class="red STYLE2">友情连接</td>
					</tr>
				</table></TD>
		</TR>
		<TR>
			<TD vAlign=top background=qtimages/index_r41_c1.gif><table
					width="98%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="newsline">
					<%
						String sql2 = "";
						sql2 = "select * from youqinglianjie where 1=1";
						sql2 = sql2 + " order by id desc limit 0,4";
						ResultSet RS_result2 = connDbBean.executeQuery(sql2);
						String wangzhanmingcheng = "";
						String wangzhi = "";
						//int i=0;
						while (RS_result2.next()) {
							//i=i+1;
							wangzhanmingcheng = RS_result2.getString("wangzhanmingcheng");
							wangzhi = RS_result2.getString("wangzhi");
					%>
					<tr valign="middle">
						<td width="8%" align="center"><img height="7"
							src="qtimages/index_r9_c9.jpg" width="7" /></td>
						<td width="20%" align="left"><a href="<%=wangzhi%>" class="b"
							target="_blank"><%=wangzhanmingcheng%></a></td>
						<td width="72%" height="24" align="left"><a
							href="<%=wangzhi%>" class="b" target="_blank"><%=wangzhi%></a></td>
					</tr>
					<%
						}
					%>
				</table></TD>
		</TR>
		<TR>
			<TD align=middle><IMG height=11 src="qtimages/index_r13_c1.jpg"
				width=189></TD>
		</TR>
	</TBODY>
</TABLE>