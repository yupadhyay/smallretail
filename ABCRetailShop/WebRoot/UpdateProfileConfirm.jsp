<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="ABCRetailShop.EmployeeBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UpdateProfileConfirm.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
   int eid = Integer.parseInt((String)session.getAttribute("username"));
   String ename = request.getParameter("ename");
   String city = request.getParameter("city");
   String telephone = request.getParameter("telephone");
  EmployeeBean employeeBean = new EmployeeBean();
  employeeBean.updateEmployee(eid,city,telephone);
  response.sendRedirect(request.getParameter("url"));  
   %>
  </body>
</html>
