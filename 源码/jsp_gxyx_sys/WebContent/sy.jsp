<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>用户登录</title>


</head>

<body>
	<table width="66%" height="68%" border="0" cellpadding="5"
		cellspacing="5">
		<tr>
			<td valign="top"><p>欢迎进入〉〉〉</p>
				<p>
					<br> 新生报道系统
				</p>
				<p class="td2">联系人:某某大学招生办</p>
				<p class="td2">电话:0351-6014101 6014965</p>
				<p class="td2">邮编:030024</p>
				<p class="td2">
					地址:幸福路一号<a href="mailto:zhouyufay@126.com"></a>
				</p>
				<p class="welcome">&nbsp;</p></td>
		</tr>
	</table>
	<p class="welcome">&nbsp;</p>
</body>
</html>

