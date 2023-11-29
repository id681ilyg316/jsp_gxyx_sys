
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
<script src="js/menu.js"></script>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 12px;
}

.STYLE2 {
	font-size: 12px;
	color: #03515d;
}

a:link {
	font-size: 12px;
	text-decoration: none;
	color: #03515d;
}

a:visited {
	font-size: 12px;
	text-decoration: none;
	color: #03515d;
}

.STYLE3 {
	font-size: 12px
}
-->
</style>


</head>

<body>
	<table width="156" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center" valign="top"><table width="100%"
					height="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="33" background="images/main_21.gif">&nbsp;</td>
					</tr>


					<!-- <tr>
        <td height="20" background="images/main_25.gif" id="td1" onClick="show(1)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="13%">&nbsp;</td>
            <td width="72%" height="20"><div align="center">
              <table width="100%" height="21" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><div align="center"><img src="images/top_8.gif" width="16" height="16"></div></td>
                  <td valign="middle"><div align="center" class="STYLE1">系统用户管理</div></td>
                </tr>
              </table>
            </div></td>
            <td width="15%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr id="show1">
        <td align="center" valign="top"><table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_1.gif" width="31" height="31"></div></td>
                  <td width="89" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="yhzhgl.jsp" target="hsgmain">管理员管理</a></span></td>
                    </tr>
                  </table></td>
                </tr>
               
            </table></td>
          </tr>
        </table></td>
      </tr>
      
	  
	   <tr>
        <td height="20" background="images/main_25.gif" id="td2" onClick="show(2)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="13%">&nbsp;</td>
            <td width="72%" height="20"><div align="center">
              <table width="100%" height="21" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><div align="center"><img src="images/top_8.gif" width="16" height="16"></div></td>
                  <td valign="middle"><div align="center" class="STYLE1">校园新闻管理</div></td>
                </tr>
              </table>
            </div></td>
            <td width="15%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr id="show2" style="display:none">
        <td align="center" valign="top"><table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
               
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_2.gif" width="31" height="31"></div></td>
                  <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="xinwentongzhi_add.jsp?lb=校园新闻" target="hsgmain">校园新闻添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_2.gif" width="31" height="31"></div></td>
                  <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="xinwentongzhi_list.jsp?lb=校园新闻" target="hsgmain">校园新闻查询</a></span></td>
                    </tr>
                  </table></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
	  
	  
	    <tr>
        <td height="20" background="images/main_25.gif" id="td3" onClick="show(3)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="13%">&nbsp;</td>
            <td width="72%" height="20"><div align="center">
              <table width="100%" height="21" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><div align="center"><img src="images/top_8.gif" width="16" height="16"></div></td>
                  <td valign="middle"><div align="center" class="STYLE1">校园风光管理</div></td>
                </tr>
              </table>
            </div></td>
            <td width="15%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr id="show3" style="display:none">
        <td align="center" valign="top"><table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_1.gif" width="31" height="31"></div></td>
                  <td width="89" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="xiaoyuanfengguang_add.jsp" target="hsgmain">校园风光添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_2.gif" width="31" height="31"></div></td>
                  <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="xiaoyuanfengguang_list.jsp" target="hsgmain">校园风光查询</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                
               
            </table></td>
          </tr>
        </table></td>
      </tr>
	  -->


					<!--   <tr >
        <td height="20" background="images/main_25.gif" id="td3" onClick="show(4)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="13%">&nbsp;</td>
            <td width="72%" height="20"><div align="center">
              <table width="100%" height="21" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><div align="center"><img src="images/top_8.gif" width="16" height="16"></div></td>
                  <td valign="middle"><div align="center" class="STYLE1">宿舍楼信息</div></td>
                </tr>
              </table>
            </div></td>
            <td width="15%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr id="show4" style="display:none">
        <td align="center" valign="top"><table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_1.gif" width="31" height="31"></div></td>
                  <td width="89" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="sushelouxinxi_add.jsp" target="hsgmain">宿舍楼添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_1.gif" width="31" height="31"></div></td>
                  <td width="89" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="sushelouxinxi_list.jsp" target="hsgmain">宿舍楼查询</a></span></td>
                    </tr>
                  </table></td>
                </tr>
               
            </table></td>
          </tr>
        </table></td>
      </tr>
	  
	  
	  
	  <tr >
        <td height="20" background="images/main_25.gif" id="td3" onClick="show(5)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="13%">&nbsp;</td>
            <td width="72%" height="20"><div align="center">
              <table width="100%" height="21" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><div align="center"><img src="images/top_8.gif" width="16" height="16"></div></td>
                  <td valign="middle"><div align="center" class="STYLE1">班级信息管理</div></td>
                </tr>
              </table>
            </div></td>
            <td width="15%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr id="show5" style="display:none">
        <td align="center" valign="top"><table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
                
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_1.gif" width="31" height="31"></div></td>
                  <td width="89" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="banjixinxi_add.jsp" target="hsgmain">班级信息添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_2.gif" width="31" height="31"></div></td>
                  <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="banjixinxi_list.jsp" target="hsgmain">班级信息查询</a></span></td>
                    </tr>
                  </table></td>
                </tr>
               
            </table></td>
          </tr>
        </table></td>
      </tr>
	  -->
					<tr>
						<td height="20" background="images/main_25.gif" id="td3"
							onClick="show(6)"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="13%">&nbsp;</td>
									<td width="72%" height="20"><div align="center">
											<table width="100%" height="21" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td><div align="center">
															<img src="images/top_8.gif" width="16" height="16">
														</div></td>
													<td valign="middle"><div align="center" class="STYLE1">留言管理</div></td>
												</tr>
											</table>
										</div></td>
									<td width="15%">&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr id="show6" style="display: none">
						<td align="center" valign="top"><table width="145" border="0"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td><table width="130" border="0" align="center"
											cellpadding="0" cellspacing="0">
											<tr>
												<td width="41" height="35"><div align="center">
														<img src="images/left_1.gif" width="31" height="31">
													</div></td>
												<td width="89" height="35"><table width="100%"
														border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td height="23" style="cursor: hand"
																onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span
																class="STYLE2">&nbsp;<a href="liuyanban_list.jsp"
																	target="hsgmain">留言管理</a></span></td>
														</tr>
													</table></td>
											</tr>


										</table></td>
								</tr>
							</table></td>
					</tr>

					<!--   <tr>
        <td height="20" background="images/main_25.gif" id="td3" onClick="show(7)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="13%">&nbsp;</td>
            <td width="72%" height="20"><div align="center">
              <table width="100%" height="21" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><div align="center"><img src="images/top_8.gif" width="16" height="16"></div></td>
                  <td valign="middle"><div align="center" class="STYLE1">专业信息查看</div></td>
                </tr>
              </table>
            </div></td>
            <td width="15%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr id="show7" style="display:none">
        <td align="center" valign="top"><table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_1.gif" width="31" height="31"></div></td>
                  <td width="89" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="zhuanyexinxi_add.jsp" target="hsgmain">专业信息添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_1.gif" width="31" height="31"></div></td>
                  <td width="89" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="zhuanyexinxi_list.jsp" target="hsgmain">专业信息查询</a></span></td>
                    </tr>
                  </table></td>
                </tr>
               
            </table></td>
          </tr>
        </table></td>
      </tr>-->

					<tr>
						<td height="20" background="images/main_25.gif" id="td3"
							onClick="show(8)"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="13%">&nbsp;</td>
									<td width="72%" height="20"><div align="center">
											<table width="100%" height="21" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td><div align="center">
															<img src="images/top_8.gif" width="16" height="16">
														</div></td>
													<td valign="middle"><div align="center" class="STYLE1">新生报到查询</div></td>
												</tr>
											</table>
										</div></td>
									<td width="15%">&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr id="show8" style="display: none">
						<td align="center" valign="top"><table width="145" border="0"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td><table width="130" border="0" align="center"
											cellpadding="0" cellspacing="0">
											<tr>
												<td width="41" height="35"><div align="center">
														<img src="images/left_1.gif" width="31" height="31">
													</div></td>
												<td width="89" height="35"><table width="100%"
														border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td height="23" style="cursor: hand"
																onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span
																class="STYLE2">&nbsp;<a
																	href="xinshengbaodao_add.jsp" target="hsgmain">新生报到添加</a></span></td>
																	
														</tr>
													</table></td>
											</tr>
											<tr>
												<td width="41" height="35"><div align="center">
														<img src="images/left_1.gif" width="31" height="31">
													</div></td>
												<td width="89" height="35"><table width="100%"
														border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td height="23" style="cursor: hand"
																onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span
																class="STYLE2">&nbsp;<a
																	href="xinshengbaodao_list.jsp" target="hsgmain">新生报到查询</a></span></td>
														</tr>
													</table></td>
											</tr>

										</table></td>
								</tr>
							</table></td>
					</tr>


					<tr>
						<td height="20" background="images/main_25.gif" id="td3"
							onClick="show(9)"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="13%">&nbsp;</td>
									<td width="72%" height="20"><div align="center">
											<table width="100%" height="21" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td><div align="center">
															<img src="images/top_8.gif" width="16" height="16">
														</div></td>
													<td valign="middle"><div align="center" class="STYLE1">宿舍分配查询</div></td>
												</tr>
											</table>
										</div></td>
									<td width="15%">&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr id="show9" style="display: none">
						<td align="center" valign="top"><table width="145" border="0"
								align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td><table width="130" border="0" align="center"
											cellpadding="0" cellspacing="0">
											<tr>
												<td width="41" height="35"><div align="center">
														<img src="images/left_1.gif" width="31" height="31">
													</div></td>
												<td width="89" height="35"><table width="100%"
														border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td height="23" style="cursor: hand"
																onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span
																class="STYLE2">&nbsp;<a
																	href="xinshengbaodao_list3.jsp" target="hsgmain">宿舍分配</a></span></td>
														</tr>
													</table></td>
											</tr>

										</table></td>
								</tr>
							</table></td>
					</tr>

					<!--  <tr>
        <td height="20" background="images/main_25.gif" id="td2" onClick="show(10)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="13%">&nbsp;</td>
            <td width="72%" height="20"><div align="center">
              <table width="100%" height="21" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><div align="center"><img src="images/top_8.gif" width="16" height="16"></div></td>
                  <td valign="middle"><div align="center" class="STYLE1">大学公告管理</div></td>
                </tr>
              </table>
            </div></td>
            <td width="15%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr id="show10" style="display:none">
        <td align="center" valign="top"><table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
               
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_2.gif" width="31" height="31"></div></td>
                  <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="xinwentongzhi_add.jsp?lb=大学公告" target="hsgmain">大学公告添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_2.gif" width="31" height="31"></div></td>
                  <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="xinwentongzhi_list.jsp?lb=大学公告" target="hsgmain">大学公告查询</a></span></td>
                    </tr>
                  </table></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
	  
	  
	   <tr>
        <td height="20" background="images/main_25.gif" id="td2" onClick="show(11)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="13%">&nbsp;</td>
            <td width="72%" height="20"><div align="center">
              <table width="100%" height="21" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><div align="center"><img src="images/top_8.gif" width="16" height="16"></div></td>
                  <td valign="middle"><div align="center" class="STYLE1">入校需知管理</div></td>
                </tr>
              </table>
            </div></td>
            <td width="15%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr id="show11" style="display:none">
        <td align="center" valign="top"><table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
               
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_2.gif" width="31" height="31"></div></td>
                  <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="xinwentongzhi_add.jsp?lb=入校需知" target="hsgmain">入校需知添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_2.gif" width="31" height="31"></div></td>
                  <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="xinwentongzhi_list.jsp?lb=入校需知" target="hsgmain">入校需知查询</a></span></td>
                    </tr>
                  </table></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
	  
	  
	  
	   <tr>
        <td height="20" background="images/main_25.gif" id="td3" onClick="show(12)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="13%">&nbsp;</td>
            <td width="72%" height="20"><div align="center">
              <table width="100%" height="21" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><div align="center"><img src="images/top_8.gif" width="16" height="16"></div></td>
                  <td valign="middle"><div align="center" class="STYLE1">系统管理</div></td>
                </tr>
              </table>
            </div></td>
            <td width="15%">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr id="show12" style="display:none">
        <td align="center" valign="top"><table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
               
               <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_1.gif" width="31" height="31"></div></td>
                  <td width="89" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="dx.jsp?lb=系统公告" target="hsgmain">系统公告</a></span></td>
                    </tr>
                  </table></td>
                </tr>
				
				<tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_1.gif" width="31" height="31"></div></td>
                  <td width="89" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="dx.jsp?lb=系统简介" target="hsgmain">系统简介</a></span></td>
                    </tr>
                  </table></td>
                </tr>
				
				<tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_1.gif" width="31" height="31"></div></td>
                  <td width="89" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="youqinglianjie_add.jsp" target="hsgmain">友情连接添加</a></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_2.gif" width="31" height="31"></div></td>
                  <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="youqinglianjie_list.jsp" target="hsgmain">友情连接查询</a></span></td>
                    </tr>
                  </table></td>
                </tr>
				<tr>
                  <td width="41" height="35"><div align="center"><img src="images/left_2.gif" width="31" height="31"></div></td>
                  <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><span class="STYLE2">&nbsp;<a href="dx.jsp?lb=新生报到模板" target="hsgmain">新生报到模板</a></span></td>
                    </tr>
                  </table></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>-->


					<tr>
						<td height="20" background="images/main_25.gif" id="td3"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="13%">&nbsp;</td>
									<td width="72%" height="20"><div align="center">
											<table width="100%" height="21" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="18%"><div align="center"></div></td>
													<td width="82%" valign="middle"><div align="center"
															class="STYLE1"></div></td>
												</tr>
											</table>
										</div></td>
									<td width="15%">&nbsp;</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="39" align="center"><p class="STYLE3">
								<br> 版权所有：xxxxx
							</p>
							<p class="STYLE3">指导老师：xxxxx</p></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>

