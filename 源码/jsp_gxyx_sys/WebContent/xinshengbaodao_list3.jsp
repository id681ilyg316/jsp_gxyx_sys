
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
<LINK href="css.css" type=text/css rel=stylesheet>
<script language="javascript" src="js/Calendar.js"></script>

</head>
<%
	String sql;
	ResultSet RS_result;
%>
<body>
	<p>已有新生报到列表：</p>
	<form name="form1" id="form1" action="">
		搜索:&nbsp;&nbsp;学号：<input name="xuehao" type="text" id="xuehao"
			style='border: solid 1px #000000; color: #666666' size='15' />&nbsp;&nbsp;姓名：<input
			name="xingming" type="text" id="xingming"
			style='border: solid 1px #000000; color: #666666' size='15' /> 性别：<select
			name="xingbie" id="xingbie"><option value="">所有</option>
			<option value="男">男</option>
			<option value="女">女</option></select> 班级：<select name='banji' id='banji'><option
				value="">所有</option>
			<%
				sql = "select banji from banjixinxi order by id desc";
				RS_result = connDbBean.executeQuery(sql);
				while (RS_result.next()) {
			%><option
				value="<%=RS_result.getString("banji")%>"><%=RS_result.getString("banji")%></option>
			<%
				}
			%></select> 专业：<select name='zhuanye' id='zhuanye'><option value="">所有</option>
			<%
				sql = "select zhuanye from zhuanyexinxi order by id desc";
				RS_result = connDbBean.executeQuery(sql);
				while (RS_result.next()) {
			%><option
				value="<%=RS_result.getString("zhuanye")%>"><%=RS_result.getString("zhuanye")%></option>
			<%
				}
			%></select> 宿舍楼：<select name='sushelou' id='sushelou'><option
				value="">所有</option>
			<%
				sql = "select louhao from sushelouxinxi order by id desc";
				RS_result = connDbBean.executeQuery(sql);
				while (RS_result.next()) {
			%><option
				value="<%=RS_result.getString("louhao")%>"><%=RS_result.getString("louhao")%></option>
			<%
				}
			%></select>&nbsp;&nbsp;房间号：<input name="fangjianhao" type="text"
			id="fangjianhao" style='border: solid 1px #000000; color: #666666'
			size='15' />&nbsp;&nbsp;床位号：<input name="chuangweihao" type="text"
			id="chuangweihao" style='border: solid 1px #000000; color: #666666'
			size='15' /> <input type="submit" name="Submit" value="查找"
			style='border: solid 1px #000000; color: #666666' />
	</form>

	<table width="100%" border="1" align="center" cellpadding="3"
		cellspacing="1" bordercolor="00FFFF" style="border-collapse: collapse">
		<tr>
			<td width="30" align="center" bgcolor="CCFFFF">序号</td>
			<td bgcolor='#CCFFFF'>学号</td>
			<td bgcolor='#CCFFFF'>姓名</td>
			<td bgcolor='#CCFFFF'>密码</td>
			<td bgcolor='#CCFFFF' width='40' align='center'>性别</td>
			<td bgcolor='#CCFFFF'>班级</td>
			<td bgcolor='#CCFFFF'>专业</td>
			<td bgcolor='#CCFFFF'>籍贯</td>
			<td bgcolor='#CCFFFF'>地址</td>
			<td bgcolor='#CCFFFF'>宿舍楼</td>
			<td bgcolor='#CCFFFF'>房间号</td>
			<td bgcolor='#CCFFFF'>床位号</td>
			<td bgcolor='#CCFFFF' width='80' align='center'>是否审核</td>
			<td width="60" align="center" bgcolor="CCFFFF">操作</td>
		</tr>
		<%
			int curpage = 1;//当前页
			int page_record = 10;//每页显示的记录数
			int zgs = 0;
			int zys = 0;
			//用下面的方法（sql查询完成，速度快）
			String hsgnpage = request.getParameter("page");
			String fysql = "select count(id) as ss from xinshengbaodao";
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
				sql = "select  * from xinshengbaodao where 1=1 ";
			} else {
				String tempsql = "select  id from xinshengbaodao order by id desc limit 0,"
						+ (curpage - 1) * page_record + "";
				ResultSet tempRS_result = connDbBean.executeQuery(tempsql);
				int tempid = 0;
				String tempidstring = "";
				while (tempRS_result.next()) {
					tempidstring = tempidstring + tempRS_result.getString("id") + ",";
				}
				tempidstring = tempidstring.substring(0, tempidstring.length() - 1);
				sql = "select  * from xinshengbaodao where id not in (" + tempidstring + ")  ";
			}

			if (request.getParameter("xuehao") == "" || request.getParameter("xuehao") == null) {
			} else {
				sql = sql + " and xuehao like '%" + new String(request.getParameter("xuehao").getBytes("8859_1"))
						+ "%'";
			}
			if (request.getParameter("xingming") == "" || request.getParameter("xingming") == null) {
			} else {
				sql = sql + " and xingming like '%" + new String(request.getParameter("xingming").getBytes("8859_1"))
						+ "%'";
			}
			if (request.getParameter("xingbie") == "所有" || request.getParameter("xingbie") == null) {
			} else {
				sql = sql + " and xingbie like '%" + new String(request.getParameter("xingbie").getBytes("8859_1"))
						+ "%'";
			}
			if (request.getParameter("banji") == "" || request.getParameter("banji") == null) {
			} else {
				sql = sql + " and banji like '%" + new String(request.getParameter("banji").getBytes("8859_1")) + "%'";
			}
			if (request.getParameter("zhuanye") == "" || request.getParameter("zhuanye") == null) {
			} else {
				sql = sql + " and zhuanye like '%" + new String(request.getParameter("zhuanye").getBytes("8859_1"))
						+ "%'";
			}
			if (request.getParameter("sushelou") == "" || request.getParameter("sushelou") == null) {
			} else {
				sql = sql + " and sushelou like '%" + new String(request.getParameter("sushelou").getBytes("8859_1"))
						+ "%'";
			}
			if (request.getParameter("fangjianhao") == "" || request.getParameter("fangjianhao") == null) {
			} else {
				sql = sql + " and fangjianhao like '%"
						+ new String(request.getParameter("fangjianhao").getBytes("8859_1")) + "%'";
			}
			if (request.getParameter("chuangweihao") == "" || request.getParameter("chuangweihao") == null) {
			} else {
				sql = sql + " and chuangweihao like '%"
						+ new String(request.getParameter("chuangweihao").getBytes("8859_1")) + "%'";
			}
			sql = sql + " order by id desc  limit 0," + page_record + "";

			RS_result = connDbBean.executeQuery(sql);
			String id = "";
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
			String issh = "";
			String addtime = "";
			int i = 0;
			//difengysfiqfgieuheze 
			while (RS_result.next()) {
				i = i + 1;
				id = RS_result.getString("id");
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
				issh = RS_result.getString("issh");
				addtime = RS_result.getString("addtime");
				//zoxngxetxoxngjxvi
		%>
		<tr>
			<td width="30" align="center"><%=i%></td>
			<td><%=xuehao%></td>
			<td><%=xingming%></td>
			<td><%=mima%></td>
			<td align='center'><%=xingbie%></td>
			<td><%=banji%></td>
			<td><%=zhuanye%></td>
			<td><%=jiguan%></td>
			<td><%=dizhi%></td>
			<td><%=sushelou%></td>
			<td><%=fangjianhao%></td>
			<td><%=chuangweihao%></td>
			<td width='80' align='center'><a
				href="sh.jsp?id=<%=id%>&yuan=<%=issh%>&tablename=xinshengbaodao"
				onClick="return confirm('您确定要执行此操作？')"><%=issh%></a></td>
			<td width="60" align="center"><a
				href="xinshengbaodao_updtlb.jsp?id=<%=id%>">宿舍分配</a> <a
				href="xinshengbaodao_detail.jsp?id=<%=id%>">详细</a> <a
				href="del.jsp?id=<%=id%>&tablename=xinshengbaodao"
				onClick="return confirm('真的要删除？')">删除</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		//yougongzitongji
	%>
	<br> 以上数据共<%=i%>条,
	<a style="cursor: hand" onClick="javascript:window.print();">打印本页</a>
	<p align="center">
		&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record%>条/页 <a
			href="xinshengbaodao_list3.jsp?page=1">首页</a> <a
			href="xinshengbaodao_list3.jsp?page=<%=curpage - 1%>">上一页</a> <A
			href="xinshengbaodao_list3.jsp?page=<%=curpage + 1%>">下一页</A> <a
			href="xinshengbaodao_list3.jsp?page=<%=zys%>">尾页</A> 当前第<FONT
			color=red><%=curpage%></FONT>页/共<FONT color=red><%=zys%></FONT>页
	</p>
</body>
</html>

