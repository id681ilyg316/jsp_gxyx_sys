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
<%
	String id = request.getParameter("id");
%>
<script language="javascript">
	function checklyb() {
		if (document.formlyb.cheng.value == "") {
			alert("请输入昵称");
			document.formlyb.cheng.focus();
			return false;
		}
		if (document.formlyb.neirong.value == "") {
			alert("请输入留言内容");
			document.formlyb.neirong.focus();
			return false;
		}
		/**
		if (document.formlyb.youxiang.value != "") {
			var strEmail = document.getElementById("youxiang").value;
			var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
			var email_Flag = reg.test(strEmail);
			if (email_Flag) {

			} else {
				alert("对不起，您输入的邮箱地址格式错误。");
				return false;
			}
		}
		if (document.formlyb.QQ.value != "") {
			var strQQ = document.getElementById("QQ").value;
			var regQQ = /^[1-9]\d{4,8}$/;
			var qq_Flag = regQQ.test(strQQ);
			if (qq_Flag) {

			} else {
				alert("对不起，您输入的QQ号码格式错误。");
				return false;
			}
		}
		
		if (document.formlyb.dianhua.value != "") {
			var strPhone = document.getElementById("dianhua").value;
			var reg = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
			phone_Flag = reg.test(strPhone);
			if (phone_Flag) {
			} else {
				alert("对不起，您输入的电话号码格式错误。");
				return false;
			}
		}
		**/
	}
</script>
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
										<td width="15%"><a href="lyblist.jsp"><font
												class="red STYLE2">查看已有留言</font></a></td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td height="725" valign="top" class="boder"><form
									name="formlyb" action="liuyanban_add_post.jsp">
									<table width="92%" border="1" align="center" cellpadding="3"
										cellspacing="1" bordercolor="#00FFFF"
										style="border-collapse: collapse">
										<tr>
											<td width="12%">昵称：</td>
											<td width="88%"><input name='cheng' type='text'
												id='cheng' value='' /> *</td>
										</tr>
										<tr>
											<td>头像：</td>
											<td><input name="xingbie" type="radio" value="1" checked>
												<img src="img/1.gif" width="64" height="71"> <input
												type="radio" name="xingbie" value="2"> <img
												src="img/2.gif" width="64" height="71"> <input
												type="radio" name="xingbie" value="3"> <img
												src="img/3.gif" width="64" height="71"> <input
												type="radio" name="xingbie" value="4"> <img
												src="img/4.gif" width="64" height="71"> <input
												type="radio" name="xingbie" value="5"> <img
												src="img/5.gif" width="64" height="71"></td>
										</tr>
										<tr>
											<td>QQ：</td>
											<td><input name='QQ' type='text' id='QQ' value='' /></td>
										</tr>
										<tr>
											<td>邮箱：</td>
											<td><input name='youxiang' type='text' id='youxiang'
												value='' /></td>
										</tr>
										<tr>
											<td>电话：</td>
											<td><input name='dianhua' type='text' id='dianhua'
												value='' /></td>
										</tr>
										<tr>
											<td>内容：</td>
											<td><textarea name="neirong" cols="50" rows="10"
													id="neirong"></textarea> *</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><input type="submit" name="Submit4" value="提交"
												onClick="return checklyb();"
												style="height: 19px; border: solid 1px #000000; color: #666666" />
												<input type="reset" name="Submit22" value="重置"
												style="height: 19px; border: solid 1px #000000; color: #666666" /></td>
										</tr>
									</table>
								</form></td>
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

