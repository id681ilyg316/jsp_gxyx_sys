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

<title>用户登录</title>

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
<link href="css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
<body>
	<div class="header"></div>
	<div class="loginWraper">
		<div id="loginform" class="loginBox">
			<form name="form1" action="adminyanzheng.jsp"
				class="form form-horizontal">
				<div class="row cl">
					<label class="form-label col-3"><i class="Hui-iconfont">帐号</i></label>
					<div class="formControls col-8">
						<input name="username" type="text" id="username"
							class="input-text size-L" />

					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-3"><i class="Hui-iconfont">密码</i></label>
					<div class="formControls col-8">
						<input name="pwd" type="password" id="pwd"
							class="input-text size-L" />

					</div>
				</div>

				<div class="row cl">
					<label class="form-label col-3"><i class="Hui-iconfont">类型</i></label>
					<div class="formControls col-8">
						<select name="cx" id="cx" class="input-text size-L">
							<option value="管理员">管理员</option>
							<option value="财务处">财务处</option>
							<option value="辅导员">辅导员</option>
						</select> <input name="login" type="hidden" id="login" value="1">
					</div>
				</div>

				<div class="row">
					<div class="formControls col-8 col-offset-3"></div>
				</div>
				<div class="row">
					<div class="formControls col-8 col-offset-3">
						<input type="submit" name="Submit" value="登陆"
							class="btn btn-default radius size-L"> <input
							type="reset" name="Submit2" value="重置"
							class="btn btn-success radius size-L">

					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>

