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

<title>徐州工程学院中心校区菜品评测系统</title>
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
<script language="javascript" src="js/Calendar.js"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript">
	function up(tt) {
		var pop = new Popup({
			contentType : 1,
			isReloadOnClose : false,
			width : 300,
			height : 50
		});
		pop.setContent("contentUrl", "upload.jsp?Result=" + tt);
		pop.setContent("title", "文件上传");
		pop.build();
		pop.show();
	}
</script>
<script language="javascript">
	function check() {
		if (document.form1.yonghuming.value == "") {
			alert("请输入用户名");
			document.form1.yonghuming.focus();
			return false;
		}
		if (document.form1.mima.value == "") {
			alert("请输入密码");
			document.form1.mima.focus();
			return false;
		}
		if (document.form1.mima2.value != document.form1.mima.value) {
			alert("两次密码不一致，请重试");
			document.form1.mima.focus();
			return false;
		}
		if (document.form1.xingming.value == "") {
			alert("请输入姓名");
			document.form1.xingming.focus();
			return false;
		}

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
										<td width="8%">&nbsp;</td>
										<td width="92%" class="red STYLE2">用户注册</td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td height="725" valign="top" class="boder"><table
									width="98%" border="1" align="center" cellpadding="3"
									cellspacing="1" bordercolor="#5B994C"
									style="border-collapse: collapse">
									<form name="form1" method="post"
										action="yonghuzhuce_add_post.jsp">
										<tr>
											<td>用户名：</td>
											<td><input name='yonghuming' type='text' id='yonghuming'
												value='' /> &nbsp;*</td>
										</tr>
										<tr>
											<td>密码：</td>
											<td><input name='mima' type='password' id='mima'
												value='' /> &nbsp;* 确认密码： <input name='mima2'
												type='password' id='mima2' value='' /></td>
										</tr>
										<tr>
											<td>姓名：</td>
											<td><input name='xingming' type='text' id='xingming'
												value='' /> &nbsp;*</td>
										</tr>
										<tr>
											<td>性别：</td>
											<td><select name='xingbie' id='xingbie'
												style="height: 19px; border: solid 1px #000000; color: #666666">
													<option value="男">男</option>
													<option value="女">女</option>
											</select></td>
										</tr>
										<tr>
											<td>出生年月：</td>
											<td><input name='chushengnianyue' type='text'
												id='chushengnianyue' value='' readonly='readonly'
												onClick="getDate(document.form1.chushengnianyue,'2')"
												need='1' /></td>
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
											<td>身份证：</td>
											<td><input name='shenfenzheng' type='text'
												id='shenfenzheng' value='' /></td>
										</tr>
										<tr>
											<td>头像：</td>
											<td><input name='touxiang' type='text' id='touxiang'
												size='50' value='' /> &nbsp; <input name="button"
												type='button' onClick="up('touxiang')" value='上传'
												style="height: 19px; border: solid 1px #000000; color: #666666" /></td>
										</tr>
										<tr>
											<td>地址：</td>
											<td><input name='dizhi' type='text' id='dizhi' value=''
												size='50' /></td>
										</tr>
										<tr>
											<td>备注：</td>
											<td><textarea name='beizhu' cols='50' rows='5'
													id='beizhu'></textarea></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><input type="submit" name="Submit5" value="提交"
												onClick="return check();"
												style="height: 19px; border: solid 1px #000000; color: #666666" />
												<input type="reset" name="Submit22" value="重置"
												style="height: 19px; border: solid 1px #000000; color: #666666" /></td>
										</tr>
									</form>
								</table>
								<p></p></td>
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

