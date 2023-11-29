
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


<title></title>
<script language="javascript" src="images/qkjs.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	color: #767a7a;
	font-size: 12px;
}
-->
</style>

</head>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="22" height="30"><img src="images/main_38.gif"
				width="22" height="30" /></td>
			<td background="images/main_40.gif"><table width="100%"
					border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="200" height="30">&nbsp;</td>
						<td width="580"><div align="center" class="STYLE1">版权所有：新生报到系统
							</div></td>
						<td width="331"><div align="right" class="STYLE1">
								今天是：
								<SCRIPT language=javascript>
									setCalendar();
								</SCRIPT>
							</div></td>
					</tr>
				</table></td>
			<td width="28"><img src="images/main_43.gif" width="28"
				height="30" /></td>
		</tr>
	</table>
</body>
</html>

