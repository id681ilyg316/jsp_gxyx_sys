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
		String id = request.getParameter("id");
		String sql = "update jiaofeijilu set xuehao='" + xuehao + "',xingming='" + xingming + "',banji='" + banji
				+ "',zhuanye='" + zhuanye + "',xuenian='" + xuenian + "',xueqi='" + xueqi + "',feiyongleixing='"
				+ feiyongleixing + "',feiyongjine='" + feiyongjine + "',beizhu='" + beizhu + "' where id= " + id;
		connDbBean.executeUpdate(sql);
		out.print("<script>alert('修改成功!!');location.href='jiaofeijilu_list.jsp';</script>");
	%>
</body>
</html>


