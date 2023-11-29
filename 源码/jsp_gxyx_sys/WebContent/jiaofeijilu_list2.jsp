
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


</head>
<%
	String sql;
	ResultSet RS_result;
%>
<body>
	<p>已有缴费记录列表：</p>
	<form name="form1" id="form1" action="">
		搜索:&nbsp; 学年： <select name='xuenian' id='xuenian'>
			<option value="">所有</option>
			<option value="2014">2014</option>
			<option value="2013">2013</option>
			<option value="2012">2012</option>
			<option value="2011">2011</option>
		</select> 学期： <select name='xueqi' id='xueqi'>
			<option value="">所有</option>
			<option value="1">1</option>
			<option value="2">2</option>
		</select> 费用类型： <select name='feiyongleixing' id='feiyongleixing'>
			<option value="">所有</option>
			<option value="学杂费">学杂费</option>
			<option value="住宿费">住宿费</option>
			<option value="教材费">教材费</option>
			<option value="保险费">保险费</option>
		</select> <input type="submit" name="Submit" value="查找"
			style='border: solid 1px #000000; color: #666666' />
	</form>

	<table width="100%" border="1" align="center" cellpadding="3"
		cellspacing="1" bordercolor="00FFFF" style="border-collapse: collapse">
		<tr>
			<td width="30" align="center" bgcolor="CCFFFF">序号</td>
			<td bgcolor='#CCFFFF'>学号</td>
			<td bgcolor='#CCFFFF'>姓名</td>
			<td bgcolor='#CCFFFF'>班级</td>
			<td bgcolor='#CCFFFF'>专业</td>
			<td bgcolor='#CCFFFF'>学年</td>
			<td bgcolor='#CCFFFF'>学期</td>
			<td bgcolor='#CCFFFF'>费用类型</td>
			<td bgcolor='#CCFFFF'>费用金额</td>
			<td bgcolor='#CCFFFF'>备注</td>
			<td bgcolor='#CCFFFF' width='80' align='center'>是否审核</td>
			<td width="138" align="center" bgcolor="CCFFFF">时间</td>

			<td width="60" align="center" bgcolor="CCFFFF">操作</td>
		</tr>
		<%
			int curpage = 1;//当前页
			int page_record = 10;//每页显示的记录数
			int zgs = 0;
			int zys = 0;
			//用下面的方法（sql查询完成，速度快）
			String hsgnpage = request.getParameter("page");
			String fysql = "select count(id) as ss from jiaofeijilu where xuehao='"
					+ request.getSession().getAttribute("username") + "'";
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
				sql = "select  * from jiaofeijilu where xuehao='" + request.getSession().getAttribute("username")
						+ "' ";
			} else {
				String tempsql = "select  id from jiaofeijilu where xuehao='"
						+ request.getSession().getAttribute("username") + "' order by id desc limit 0,"
						+ (curpage - 1) * page_record + "";
				ResultSet tempRS_result = connDbBean.executeQuery(tempsql);
				int tempid = 0;
				String tempidstring = "";
				while (tempRS_result.next()) {
					tempidstring = tempidstring + tempRS_result.getString("id") + ",";
				}
				tempidstring = tempidstring.substring(0, tempidstring.length() - 1);
				sql = "select  * from jiaofeijilu where id not in (" + tempidstring + ") and xuehao='"
						+ request.getSession().getAttribute("username") + "' ";
			}

			if (request.getParameter("xingming") == "" || request.getParameter("xingming") == null) {
			} else {
				sql = sql + " and xingming like '%" + new String(request.getParameter("xingming").getBytes("8859_1"))
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
			if (request.getParameter("xuenian") == "" || request.getParameter("xuenian") == null) {
			} else {
				sql = sql + " and xuenian like '%" + new String(request.getParameter("xuenian").getBytes("8859_1"))
						+ "%'";
			}
			if (request.getParameter("xueqi") == "" || request.getParameter("xueqi") == null) {
			} else {
				sql = sql + " and xueqi like '%" + new String(request.getParameter("xueqi").getBytes("8859_1")) + "%'";
			}
			if (request.getParameter("feiyongleixing") == "" || request.getParameter("feiyongleixing") == null) {
			} else {
				sql = sql + " and feiyongleixing like '%"
						+ new String(request.getParameter("feiyongleixing").getBytes("8859_1")) + "%'";
			}
			sql = sql + " order by id desc  limit 0," + page_record + "";

			RS_result = connDbBean.executeQuery(sql);
			String id = "";
			String xuehao = "";
			String xingming = "";
			String banji = "";
			String zhuanye = "";
			String xuenian = "";
			String xueqi = "";
			String feiyongleixing = "";
			String feiyongjine = "";
			String beizhu = "";
			String issh = "";
			String addtime = "";
			int i = 0;
			double feiyongjinez = 0;

			while (RS_result.next()) {
				i = i + 1;
				id = RS_result.getString("id");
				xuehao = RS_result.getString("xuehao");
				xingming = RS_result.getString("xingming");
				banji = RS_result.getString("banji");
				zhuanye = RS_result.getString("zhuanye");
				xuenian = RS_result.getString("xuenian");
				xueqi = RS_result.getString("xueqi");
				feiyongleixing = RS_result.getString("feiyongleixing");
				feiyongjine = RS_result.getString("feiyongjine");
				beizhu = RS_result.getString("beizhu");
				issh = RS_result.getString("issh");
				addtime = RS_result.getString("addtime");
				feiyongjinez = feiyongjinez + Float.valueOf(feiyongjine).floatValue();
		%>
		<tr>
			<td width="30" align="center"><%=i%></td>
			<td><%=xuehao%></td>
			<td><%=xingming%></td>
			<td><%=banji%></td>
			<td><%=zhuanye%></td>
			<td><%=xuenian%></td>
			<td><%=xueqi%></td>
			<td><%=feiyongleixing%></td>
			<td><%=feiyongjine%></td>
			<td><%=beizhu%></td>
			<td width='80' align='center'><%=issh%></td>
			<td width="138" align="center"><%=addtime%></td>
			<td width="60" align="center"><a
				href="jiaofeijilu_updt.jsp?id=<%=id%>"></a> <a
				href="jiaofeijilu_detail.jsp?id=<%=id%>">详细</a> <a
				href="del.jsp?id=<%=id%>&tablename=jiaofeijilu"
				onClick="return confirm('真的要删除？')"></a></td>
		</tr>
		<%
			}
		%>
	</table>
	<p>
		数据统计：共计费用金额:<%=feiyongjinez%>；
	</p>
	<br> 以上数据共<%=i%>条,
	<a style="cursor: hand" onClick="javascript:window.print();">打印本页</a>
	<p align="center">
		&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record%>条/页 <a
			href="jiaofeijilu_list2.jsp?page=1">首页</a> <a
			href="jiaofeijilu_list2.jsp?page=<%=curpage - 1%>">上一页</a> <A
			href="jiaofeijilu_list2.jsp?page=<%=curpage + 1%>">下一页</A> <a
			href="jiaofeijilu_list2.jsp?page=<%=zys%>">尾页</A> 当前第<FONT color=red><%=curpage%></FONT>页/共<FONT
			color=red><%=zys%></FONT>页
	</p>
</body>
</html>

