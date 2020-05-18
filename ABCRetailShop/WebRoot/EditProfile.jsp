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
    
    <title>My JSP 'EditProfile.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <%!int eid; %>
  <%!String Name; %>
  <%!String city; %>
  <%!String telephone; %>
  <%!String position1; %>
  <%!String URL; %>
  
   <%
  eid = Integer.parseInt((String)session.getAttribute("username"));
  EmployeeBean employeeBean = new EmployeeBean();
  employeeBean.setEmployee(eid);
  Name = employeeBean.getName();
  city = employeeBean.getCity();
  telephone = employeeBean.getTelephone();
  position1 = employeeBean.getPosition();
  if(position1.compareToIgnoreCase("clerk")==0){
  URL = "employee.jsp";
  }
  else{
  URL = "Manager.jsp";
  }
   %>
   
   <script type="text/javascript">
   function check(){
   if(isNaN(update.telephone.value)){
   alert('not a valid telefone number');
   update.telephone.focus();
   return;
   }
   else{
   alert("Employee Updated Sucessfully");  
   update.submit();   
   }
   }
   
   </script>
  
  <body background=untitled.bmp>
  <form action=UpdateProfileConfirm.jsp?url=<%=URL%> method="post" name=update>
  <br><br><br><br>
   <table align="center">
   <tr>
   <td>
   <b>EID</b>
   </td>
   <td>
   <input type="text" name="eid" value=<%=eid %> disabled="disabled">
   </td>
   </tr>
   <tr>
   <td>
   <b>NAME</b>
   </td>
   <td>
   <input type="text" name="ename" disabled="disabled"  value=<%=Name%>>
   </td>
   </tr>
   <tr>
   <td>
   <b>CITY</b>
   </td>
   <td>
   <input type="text" name="city">
   </td>
   </tr>
   <tr>
   <td>
   <b>TELEPHONE</b>
   </td>
   <td>
   <input type="text" name="telephone">
   </td>
   </tr>
   <tr>
   <td>
   <b>POSITION</b>
   </td>
   <td>
   
    <input type="text" name="poition" disabled="disabled" value=<%=position1 %>>
   </td>
   </tr>
   <tr>
   <td>
   </td>
   <td>
   </td></tr>
    <tr align="center">
   <td>
   <input type="button" value="Update Profile" onclick="check();">
   </td>
   </tr>
   </table>
   </form>
   <p align="center">
   <a href=<%=URL%>>Back</a>
  
  </body>
  
  
</html>
