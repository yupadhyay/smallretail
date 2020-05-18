<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ABCRetailShop.DataBaseConnection"%>
<%@page import="java.sql.SQLException"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Customer.jsp' starting page</title>
    
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
  <%!boolean isError4=false; %>
 <%!StringBuffer errorString=new StringBuffer(); %>
<%
	String name = request.getParameter("sname");
	String city = request.getParameter("city");
	String telephone = request.getParameter("telephone");
	Connection con=null;
	PreparedStatement stmt = null;
	String statement;
	try {
			con = DataBaseConnection.getConnection();
			statement = "insert into suppliers2 values(supp.nextval,'"+name+"','"+city+"','"+telephone+"')";
			stmt = con.prepareStatement(statement);
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			isError4=true;
			errorString.append(e.getMessage());
		} catch (ClassNotFoundException e) {
			isError4=true;
			errorString.append(e.getMessage());
		}
				
 %>
 <%!String position; %>
    <%!String URL; %>
    
    <%
    position=(String)session.getAttribute("position");
    if(position.compareToIgnoreCase("clerk")==0) URL="employee.jsp";
    else URL="Manager.jsp";
    if(isError4) {    
    %>
    <B><%=new String(errorString) %></B>
    <br><br>
    <%errorString.setLength(0);isError4=false;}else {%><p align="center"><br><br><b>Supplier Created Sucessfully</b><br></p>
    <table align="center" border="1">
<tr>
<td><b>NAME</b></td>
<td><%=request.getParameter("sname")%></td>
</tr>
<tr>
<td><b>CITY</b></td>
<td><%=request.getParameter("city")%></td>
</tr>
<tr>
<td><b>TELEPHONE</b></td>
<td><%=request.getParameter("telephone")%></td>
</tr>
   
 </table>
    
    
    
    <%} %>
  <p align="center">  <a href=<%=URL%>>Go Back to purchase Page</a></p>
    

 <br>
  </body>
</html>
