<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="ABCRetailShop.ValidateLogin"%>
<%@page import="ABCRetailShop.EmployeeBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
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
  String loginName = request.getParameter("login1");
  String password = request.getParameter("password1");
  session.setAttribute("username",loginName);
  ValidateLogin login = new ValidateLogin();
  EmployeeBean employeeBean = new EmployeeBean();
  
  boolean status = login.validate(Integer.parseInt(loginName),password);
  if(status){
  String position = employeeBean.getPosition(Integer.parseInt(loginName));
  session.setAttribute("position",position);
  if(position.compareToIgnoreCase("clerk")==0){ 
  response.sendRedirect("employee.html");
  }
  else if(position.compareToIgnoreCase("manager")==0){
  response.sendRedirect("Manager.html");
  }
  }
  else{
  response.sendRedirect("loginError.html");
  }
   
   %>
  </body>
</html>
