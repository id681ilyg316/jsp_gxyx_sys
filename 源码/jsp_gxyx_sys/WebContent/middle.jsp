<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<style>
.navPoint {
	COLOR: white;
	CURSOR: hand;
	FONT-FAMILY: Webdings;
	FONT-SIZE: 9pt
}
</style>
<script>
function switchSysBar(){ 
var locate=location.href.replace('middel.jsp','');
var ssrc=document.all("img1").src.replace(locate,'');
if (ssrc=="images/main_30.gif")
{ 
document.all("img1").src="images/main_30_1.gif";
document.all("frmTitle").style.display="none" 
} 
else
{ 
document.all("img1").src="images/main_30.gif";
document.all("frmTitle").style.display="" 
} 
} 
</script>
</head>

<body>
	<table width="100%" height="100%" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="156" id=frmTitle noWrap name="fmTitle" align="center"
				valign="top"><iframe name="I1" height="100%" width="156"
					src="mygo.jsp" border="0" frameborder="0" scrolling="no">
					浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
			<td width="4" valign="middle" background="images/main_27.gif"
				onclick=switchSysBar()><SPAN class=navPoint id=switchPoint
				title=关闭/打开左栏><img src="images/main_30.gif" name="img1"
					width=4 height=47 id=img1></SPAN></td>
			<td align="center" valign="top"><iframe name="hsgmain"
					height="100%" width="100%" border="0" frameborder="0" src="sy.jsp">
					浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
		</tr>
	</table>
</body>
</html>
