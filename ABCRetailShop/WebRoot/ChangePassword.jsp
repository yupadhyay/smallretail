<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="ABCRetailShop.Login"%>
<%@page import="java.awt.Window"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ChangePassword.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body background="untitled.bmp">
<script type="text/javascript">
function close(){

window.close();
document.close();


}

</script>
   <%!StringBuffer sb = new StringBuffer();%>
  <%!String oldPassword; %>
  <%!String newPassword; %>	
  <%!Login login = new Login();  %> 
   <%!String URL; %>   
   <%!int username;%>
   
  <%
  
   	oldPassword = request.getParameter("oldPassword"); 
   	newPassword = request.getParameter("newPassword1");
  	username =Integer.parseInt((String)session.getAttribute("username")); 
  
  boolean check = login.checkPassword(username,oldPassword);
  if(!check){%>
 <p align=center><B><font color=red>Password Does Not Match Please try again </font></b></p>
 <p align=center><a href=ChangePassword.html>Try again</a></p>  
  <%}
  else{
  
  login.changePassword(username,newPassword);
  String position =(String)session.getAttribute("position");
  if(position.compareToIgnoreCase("clerk")==0){
  URL="employee.jsp";
  }
  else{
  URL="Manager.jsp";
  }%>
  <p align="center"><b>Password Changed Successfully</b></p>
  <p align="center"><a href="login.html" target="login.html" onclick=close() >Login again</a></p> 
  
  <% } %>
  </body>
</html>
