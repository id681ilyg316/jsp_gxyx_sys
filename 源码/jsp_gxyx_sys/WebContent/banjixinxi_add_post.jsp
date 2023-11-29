<%@ page language="java"  pageEncoding="UTF-8" import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
    

  </head>
  
  <body>
  <%
 

String banji=request.getParameter("banji");String banzhuren=request.getParameter("banzhuren");String renshu=request.getParameter("renshu");String beizhu=request.getParameter("beizhu");
 ResultSet RS_result=connDbBean.executeQuery("select * from banjixinxi where banji='"+banji+"'");

 if(RS_result.next())
{
out.print("<script>alert('该班级已经存在,请换其他班级!');window.history.go(-1);</script>");
	}
else{

	
  	  	String sql="insert into banjixinxi(banji,banzhuren,renshu,beizhu) values('"+banji+"','"+banzhuren+"','"+renshu+"','"+beizhu+"') ";
  	  	
  	  	connDbBean.executeUpdate(sql);
  	  	out.print("<script>alert('添加成功!!');location.href='banjixinxi_add.jsp';</script>");
  	  
	}
 RS_result.close();


 %>
  </body>
</html>

