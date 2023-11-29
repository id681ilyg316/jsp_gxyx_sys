<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="connDbBean" scope="page" class="db.db" />
<%
	String datetime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>系统后台</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5.js"></script>
    <script type="text/javascript" src="lib/PIE_IE678.js"></script>
    <![endif]-->
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="skin/default/skin.css" rel="stylesheet" type="text/css"
	id="skin" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet"
	type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
<script type="text/javascript">
	function logout() {
		if (confirm("您确定要退出系统后台吗？"))
			top.location = "Login.jsp";
		return false;
	}

	function startTime() {
		//获取当前系统日期  
		var today = new Date()
		var h = today.getHours()
		var m = today.getMinutes()
		var s = today.getSeconds()
		//调用checkTime（）函数，小于十的数字前加0  
		m = checkTime(m)
		s = checkTime(s)
		//s设置层txt的内容  
		document.getElementById('txtsj').innerHTML = h + ":" + m + ":" + s
		//过500毫秒再调用一次  
		t = setTimeout('startTime()', 500)
		//小于10，加0  
		function checkTime(i) {
			if (i < 10) {
				i = "0" + i
			}
			return i
		}
	}
</script>
</head>

<body onload="startTime()">
	<header class="Hui-header cl"> <a class="Hui-logo l"
		title="H-ui.admin v2.3" href="main.jsp">新生报道系统</a> <span
		class="Hui-subtitle l"></span> <nav class="mainnav cl" id="Hui-nav">
	<ul>
		<li class="dropDown dropDown_click">您好！欢迎使用本系统，当前时间：<%=datetime%>
			<span id="txtsj"></span> &nbsp;&nbsp;&nbsp; 当前登录用户： <%=request.getSession().getAttribute("username")%>
			&nbsp;用户角色：<%=request.getSession().getAttribute("cx")%>
		</li>
	</ul>
	</nav>
	<ul class="Hui-userbar">

		<li class="dropDown dropDown_hover"></li>
		<li id="Hui-msg"><a href="#" target="_self" onClick="logout();"><i
				class="Hui-iconfont" style="font-size: 18px">退出系统</i></a></li>

	</ul>
	</header>

	<aside class="Hui-aside"> <input id="divScrollValue"
		type="hidden" value="" />
	<div class="menu_dropdown bk_2">
		<%
			if (request.getSession().getAttribute("cx").equals("管理员")) {
		%>
		<dl id="menu-article">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 系统用户管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='yhzhgl.jsp' href="javascript:void(0)">管理员管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-article1">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 校园新闻管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='xinwentongzhi_add.jsp?lb=校园新闻'
						href="javascript:void(0)">校园新闻添加</a></li>
					<li><a _href='xinwentongzhi_list.jsp?lb=校园新闻'
						href="javascript:void(0)">校园新闻查询</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-article2">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 校园风光管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='xiaoyuanfengguang_add.jsp'
						href="javascript:void(0)">校园风光添加</a></li>
					<li><a _href='xiaoyuanfengguang_list.jsp'
						href="javascript:void(0)">校园风光查询</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-article3">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 宿舍楼信息 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='sushelouxinxi_add.jsp' href="javascript:void(0)">宿舍楼添加</a></li>
					<li><a _href='sushelouxinxi_list.jsp'
						href="javascript:void(0)">宿舍楼查询</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-article4">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 班级信息管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='banjixinxi_add.jsp' href="javascript:void(0)">班级信息添加</a></li>
					<li><a _href='banjixinxi_list.jsp' href="javascript:void(0)">班级信息查询</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-article5">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 留言管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='liuyanban_list.jsp' href="javascript:void(0)">留言管理</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-article6">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 专业信息查看 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='zhuanyexinxi_add.jsp' href="javascript:void(0)">专业信息添加</a></li>
					<li><a _href='zhuanyexinxi_list.jsp' href="javascript:void(0)">专业信息查询</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-article7">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 新生报到管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='xinshengbaodao_add.jsp'
						href="javascript:void(0)">新生报到添加</a></li>
					<li><a _href='xinshengbaodao_list.jsp'
						href="javascript:void(0)">新生报到查询</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-article8">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 宿舍分配管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='xinshengbaodao_list3.jsp'
						href="javascript:void(0)">宿舍分配</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-article9">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 大学公告管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='xinwentongzhi_add.jsp?lb=大学公告'
						href="javascript:void(0)">大学公告添加</a></li>
					<li><a _href='xinwentongzhi_list.jsp?lb=大学公告'
						href="javascript:void(0)">大学公告查询</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-article10">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 入校需知管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='xinwentongzhi_add.jsp?lb=入校需知'
						href="javascript:void(0)">入校需知添加</a></li>
					<li><a _href='xinwentongzhi_list.jsp?lb=入校需知'
						href="javascript:void(0)">入校需知查询</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-article11">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 系统管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='dx.jsp?lb=系统公告' href="javascript:void(0)">系统公告</a></li>
					<li><a _href='dx.jsp?lb=系统简介' href="javascript:void(0)">学校简介</a></li>
					<li><a _href='youqinglianjie_add.jsp'
						href="javascript:void(0)">友情连接添加</a></li>
					<li><a _href='youqinglianjie_list.jsp'
						href="javascript:void(0)">友情连接查询</a></li>
					<li><a _href='dx.jsp?lb=新生报到模板' href="javascript:void(0)">新生报到模板</a></li>
				</ul>
			</dd>
		</dl>


		<%
			} else if (request.getSession().getAttribute("cx").equals("财务处")) {
		%>
		<dl id="Dl3">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 个人密码管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='mod.jsp' href="javascript:void(0)">个人密码管理</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="Dl4">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 学生缴费管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='xinshengbaodao_list2.jsp'
						href="javascript:void(0)">学生缴费添加</a></li>
					<li><a _href='jiaofeijilu_list.jsp' href="javascript:void(0)">缴费记录查询</a></li>
				</ul>
			</dd>
		</dl>
		<%
			} else if (request.getSession().getAttribute("cx").equals("学生")) {
		%>
		<dl id="Dl3">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 个人资料管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='xinshengbaodao_updt2.jsp'
						href="javascript:void(0)">个人资料管理</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="Dl4">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 缴费记录查看 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='jiaofeijilu_list2.jsp' href="javascript:void(0)">缴费记录查看</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="Dl4">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 我的宿舍查看 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='xinshengbaodao_updt3.jsp'
						href="javascript:void(0)">我的宿舍查看</a></li>
				</ul>
			</dd>
		</dl>

		<%
			} else if (request.getSession().getAttribute("cx").equals("辅导员")) {
		%>
		<dl id="Dl3">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 留言管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='liuyanban_list.jsp' href="javascript:void(0)">留言管理</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="Dl4">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 新生报到查询 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='xinshengbaodao_add.jsp'
						href="javascript:void(0)">新生报到添加</a></li>
						<li><a _href='xinshengbaodao_list.jsp'
						href="javascript:void(0)">新生报到查询</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="Dl4">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 宿舍分配查询 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a _href='xinshengbaodao_list3.jsp'
						href="javascript:void(0)">宿舍分配</a></li>
				</ul>
			</dd>
		</dl>

		<%
			}
		%>


	</div>
	</aside>
	<div class="dislpayArrow">
		<a class="pngfix" href="javascript:void(0);"
			onClick="displaynavbar(this)"></a>
	</div>
	<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="欢迎页面" data-href="sy.jsp">欢迎页面</span><em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group">
			<a id="js-tabNav-prev" class="btn radius btn-default size-S"
				href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a
				id="js-tabNav-next" class="btn radius btn-default size-S"
				href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
		</div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display: none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="sy.jsp"></iframe>
		</div>
	</div>
	</section>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
	<script type="text/javascript" src="js/H-ui.js"></script>
	<script type="text/javascript" src="js/H-ui.admin.js"></script>
</body>
</html>
