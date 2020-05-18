<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ABCRetailShop.DataBaseConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="ABCRetailShop.ProductBean"%>
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
  
  <body background="Customer.gif">
  <%!boolean isError3=false; %>
 <%!StringBuffer errorString=new StringBuffer();
 String pname;
 int qoh;
  %>
<%
	
	int pid = Integer.parseInt(request.getParameter("pid"));
	pname = new ProductBean(pid).getName();
	boolean qoh_error=false;
	int temp_qoh = new ProductBean(pid).getQoh();
	qoh = Integer.parseInt(request.getParameter("qoh"))+temp_qoh;
	int qoh_threshold = Integer.parseInt(request.getParameter("qoh_threshold"));
	
	if(qoh<=qoh_threshold){	
	response.sendRedirect("ProductEditError.html");
	 qoh_error = true;
	}
	double original_price = Double.parseDouble(request.getParameter("original_price")); 
	int discount_category = Integer.parseInt(request.getParameter("discount_category"));
	Connection con=null;
	PreparedStatement stmt = null;
	String statement;
	if(!qoh_error){
	try {
	
			con = DataBaseConnection.getConnection();
			statement = "update products2 set qoh="+qoh+",qoh_threshold="+qoh_threshold+",orig_price="
			+original_price+",disc_category="+discount_category+" where pid= "+pid;
			stmt = con.prepareStatement(statement);
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			isError3=true;
			errorString.append(e.getMessage());
		} catch (ClassNotFoundException e) {
			isError3=true;
			errorString.append(e.getMessage());
		}
		}
				
 %>
  <%
     if(isError3) {    
    %>
    <B><%=new String(errorString) %></B>
    <br><br>
    <%}else {%><br><br><p align="center"><font size="5"><b>Product Edited Sucessfully</b></font> </p><br>
    <table align="center" border="1">
    
<tr>
<td><b>PID</b></td>
<td><%=request.getParameter("pid")%></td>
</tr>
<tr>
<td><b>PNAME</b></td>
<td><%=pname%></td>
</tr>
<tr>
<td><b>QOH</b></td>
<td><%=qoh%></td>
</tr>
<tr>
<td><b>QOH_THRESHOLD</b></td>
<td><%=request.getParameter("qoh_threshold")%></td>
</tr>
<tr>
<td><b>ORIGINAL PRICE</b></td>
<td><%=request.getParameter("original_price")%></td>
</tr>
<tr>
<td><b>DISCOUNT CATEGORY</b></td>
<td><%=request.getParameter("discount_category")%></td>
</tr>

 </table>
    <%} %>
    <p align="center">
    <a href="Manager.jsp">Go Back to purchase Page</a>

 <br>
  </body>
</html>
