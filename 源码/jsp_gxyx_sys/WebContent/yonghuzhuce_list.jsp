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
<title>用户注册</title>
<LINK href="css.css" type=text/css rel=stylesheet>
</head>
<body>
	<p>已有用户注册列表：</p>
	<form name="form1" id="form1" action="">
		搜索: 用户名：<input name="yonghuming" type="text" id="yonghuming" size="15"
			style='border: solid 1px #000000; color: #666666' /> 姓名：<input
			name="xingming" type="text" id="xingming" size="15"
			style='border: solid 1px #000000; color: #666666' /> QQ：<input
			name="QQ" type="text" id="QQ" size="15" /> 邮箱：<input name="youxiang"
			type="text" id="youxiang" size="15"
			style='border: solid 1px #000000; color: #666666' /> 电话：<input
			name="dianhua" type="text" id="dianhua" size="15"
			style='border: solid 1px #000000; color: #666666' /> 身份证：<input
			name="shenfenzheng" type="text" id="shenfenzheng" size="15"
			style='border: solid 1px #000000; color: #666666' /> <input
			type="submit" name="Submit" value="查找"
			style='border: solid 1px #000000; color: #666666' />
	</form>
	<table width="100%" border="1" align="center" cellpadding="3"
		cellspacing="1" bordercolor="00FFFF" style="border-collapse: collapse">
		<tr>
			<td width="57" align="center" bgcolor="CCFFFF">序号</td>
			<td width="78" bgcolor='#CCFFFF'>用户名</td>
			<td width="53" bgcolor='#CCFFFF'>密码</td>
			<td width="53" bgcolor='#CCFFFF'>姓名</td>
			<td width="53" bgcolor='#CCFFFF'>性别</td>
			<td width="92" bgcolor='#CCFFFF'>QQ</td>
			<td width="78" bgcolor='#CCFFFF'>邮箱</td>
			<td width="104" bgcolor='#CCFFFF'>电话</td>
			<td width="148" bgcolor='#CCFFFF'>身份证</td>
			<td width="115" bgcolor='#CCFFFF'>头像</td>
			<td width="160" align="center" bgcolor="CCFFFF">添加时间</td>

			<td width="70" align="center" bgcolor="CCFFFF">审核</td>
			<td width="50" align="center" bgcolor="CCFFFF">操作</td>
		</tr>
		<%
			String sql;
			int curpage = 1;//当前页
			int page_record = 10;//每页显示的记录数
			int zgs = 0;
			int zys = 0;
			//用下面的方法（sql查询完成，速度快）
			String hsgnpage = request.getParameter("page");
			String fysql = "select count(id) as ss from yonghuzhuce";
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
				sql = "select  * from yonghuzhuce where 1=1 ";
			} else {
				String tempsql = "select  id from yonghuzhuce order by id desc limit 0," + (curpage - 1) * page_record
						+ "";
				ResultSet tempRS_result = connDbBean.executeQuery(tempsql);
				int tempid = 0;
				String tempidstring = "";
				while (tempRS_result.next()) {
					tempidstring = tempidstring + tempRS_result.getString("id") + ",";
				}
				tempidstring = tempidstring.substring(0, tempidstring.length() - 1);
				sql = "select  * from yonghuzhuce where id not in (" + tempidstring + ")  ";
			}

			if (request.getParameter("yonghuming") == "" || request.getParameter("yonghuming") == null) {
			} else {
				sql = sql + " and yonghuming like '%"
						+ new String(request.getParameter("yonghuming").getBytes("8859_1")) + "%'";
			}
			if (request.getParameter("xingming") == "" || request.getParameter("xingming") == null) {
			} else {
				sql = sql + " and xingming like '%" + new String(request.getParameter("xingming").getBytes("8859_1"))
						+ "%'";
			}
			if (request.getParameter("QQ") == "" || request.getParameter("QQ") == null) {
			} else {
				sql = sql + " and QQ like '%" + new String(request.getParameter("QQ").getBytes("8859_1")) + "%'";
			}
			if (request.getParameter("youxiang") == "" || request.getParameter("youxiang") == null) {
			} else {
				sql = sql + " and youxiang like '%" + new String(request.getParameter("youxiang").getBytes("8859_1"))
						+ "%'";
			}
			if (request.getParameter("dianhua") == "" || request.getParameter("dianhua") == null) {
			} else {
				sql = sql + " and dianhua like '%" + new String(request.getParameter("dianhua").getBytes("8859_1"))
						+ "%'";
			}
			if (request.getParameter("shenfenzheng") == "" || request.getParameter("shenfenzheng") == null) {
			} else {
				sql = sql + " and shenfenzheng like '%"
						+ new String(request.getParameter("shenfenzheng").getBytes("8859_1")) + "%'";
			}
			sql = sql + " order by id desc  limit 0," + page_record + "";
			ResultSet RS_result = connDbBean.executeQuery(sql);
			String id = "";
			String yonghuming = "";
			String mima = "";
			String xingming = "";
			String xingbie = "";
			String chushengnianyue = "";
			String QQ = "";
			String youxiang = "";
			String dianhua = "";
			String shenfenzheng = "";
			String touxiang = "";
			String dizhi = "";
			String beizhu = "";
			String addtime = "";
			String issh = "";
			int i = 0;
			while (RS_result.next()) {
				i = i + 1;
				id = RS_result.getString("id");
				yonghuming = RS_result.getString("yonghuming");
				mima = RS_result.getString("mima");
				xingming = RS_result.getString("xingming");
				xingbie = RS_result.getString("xingbie");
				chushengnianyue = RS_result.getString("chushengnianyue");
				QQ = RS_result.getString("QQ");
				youxiang = RS_result.getString("youxiang");
				dianhua = RS_result.getString("dianhua");
				shenfenzheng = RS_result.getString("shenfenzheng");
				touxiang = RS_result.getString("touxiang");
				dizhi = RS_result.getString("dizhi");
				beizhu = RS_result.getString("beizhu");
				addtime = RS_result.getString("addtime");
				issh = RS_result.getString("issh");
		%>
		<tr>
			<td width="57" align="center"><%=i%></td>
			<td><%=yonghuming%></td>
			<td><%=mima%></td>
			<td><%=xingming%></td>
			<td><%=xingbie%></td>
			<td><%=QQ%></td>
			<td><%=youxiang%></td>
			<td><%=dianhua%></td>
			<td><%=shenfenzheng%></td>
			<td><a href='<%=touxiang%>' target='_blank'><img
					src='<%=touxiang%>' width=88 height=99 border=0 /></a></td>
			<td width="160" align="center"><%=addtime%></td>
			<td width="70" align="center"><a
				href="sh.jsp?id=<%=id%>&yuan=<%=issh%>&tablename=yonghuzhuce"
				onClick="return confirm('确定要执行此操作？');"><%=issh%></a></td>
			<td width="50" align="center"><a
				href="yonghuzhuce_updt.jsp?id=<%=id%>">修改</a><br> <a
				href="yonghuzhuce_detail.jsp?id=<%=id%>">详细</a><br> <a
				href="del.jsp?id=<%=id%>&tablename=yonghuzhuce"
				onClick="return confirm('真的要删除？')">删除</a> <a
				href="yonghuzhuce_detail.jsp?id=<%=id%>" target="_blank"></a></td>
		</tr>
		<%
			}
		%>
	</table>
	<br> 以上数据共<%=i%>条,
	<a style="cursor: hand" onClick="javascript:window.print();">打印本页</a>
	<p align="center">
		&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record%>条/页 <a
			href="yonghuzhuce_list.jsp?page=1">首页</a> <a
			href="yonghuzhuce_list.jsp?page=<%=curpage - 1%>">上一页</a> <A
			href="yonghuzhuce_list.jsp?page=<%=curpage + 1%>">下一页</A> <a
			href="yonghuzhuce_list.jsp?page=<%=zys%>">尾页</A> 当前第<FONT color=red><%=curpage%></FONT>页/共<FONT
			color=red><%=zys%></FONT>页
	</p>
</body>
</html>
