<%@ page language="java" pageEncoding="UTF-8" import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'adminyanzheng.jsp' starting page</title>


</head>

<body>
	<%
		String xuehao = request.getParameter("xuehao");
		String xingming = request.getParameter("xingming");
		String banji = request.getParameter("banji");
		String zhuanye = request.getParameter("zhuanye");
		String xuenian = request.getParameter("xuenian");
		String xueqi = request.getParameter("xueqi");
		String feiyongleixing = request.getParameter("feiyongleixing");
		String feiyongjine = request.getParameter("feiyongjine");
		String beizhu = request.getParameter("beizhu");
		//gdsosss ResultSet RS_result=connDbBean.executeQuery("select * from jiaofeijilu where xuehao='"+xuehao+"'");

		//gdsosss if(RS_result.next())
		//gdsosss{
		//gdsosssout.print("<script>alert('该学号已经存在,请换其他学号!');window.history.go(-1);</script>");
		//gdsosss	}
		//gdsossselse{

		String sql = "insert into jiaofeijilu(xuehao,xingming,banji,zhuanye,xuenian,xueqi,feiyongleixing,feiyongjine,beizhu) values('"
				+ xuehao + "','" + xingming + "','" + banji + "','" + zhuanye + "','" + xuenian + "','" + xueqi
				+ "','" + feiyongleixing + "','" + feiyongjine + "','" + beizhu + "') ";

		connDbBean.executeUpdate(sql);
		out.print("<script>alert('添加成功!!');location.href='jiaofeijilu_add.jsp';</script>");

		//gdsosss	}
		//gdsosss RS_result.close();
	%>
</body>
</html>

