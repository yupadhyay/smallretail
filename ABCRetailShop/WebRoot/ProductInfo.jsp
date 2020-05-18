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
  
  <body background="Customer.gif">
  <%!boolean isError3=false; %>
 <%!StringBuffer errorString=new StringBuffer(); %>
<%
	String name = request.getParameter("pname");
	int qoh = Integer.parseInt(request.getParameter("qoh"));
	int qoh_threshold = Integer.parseInt(request.getParameter("qoh_threshold"));
	double original_price =  Double.parseDouble(request.getParameter("original_price")); 
	int discount_category = Integer.parseInt(request.getParameter("discount_category"));
	int sid = Integer.parseInt(request.getParameter("sid"));
	Connection con=null;
	PreparedStatement stmt = null;
	String statement;
	try {
			con = DataBaseConnection.getConnection();
			statement = "insert into products2 values(prod.nextval,'"+name+"',"+qoh+","+qoh_threshold+","
			+original_price+","+discount_category+","+sid+")";
			stmt = con.prepareStatement(statement);
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			isError3=true;
			errorString.append(e.getMessage());
		} catch (ClassNotFoundException e) {
			isError3=true;
			errorString.append(e.getMessage());
		}
				
 %>
  <%
     if(isError3) {    
    %>
    <B><%=new String(errorString) %></B>
    <br><br>
    <%errorString.setLength(0);}else {%><br><br><p align="center"><font size="5"><b>Product Created Sucessfully</b></font> </p><br>
    <table align="center" border="1">
<tr>
<td><b>PNAME</b></td>
<td><%=request.getParameter("pname")%></td>
</tr>
<tr>
<td><b>QOH</b></td>
<td><%=request.getParameter("qoh")%></td>
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
<tr>
<td><b>SID</b></td>
<td><%=request.getParameter("sid")%></td>
</tr>   
    
 </table>
    <%} %>
    <p align="center">
    <a href="Manager.jsp">Go Back to purchase Page</a>

 <br>
  </body>
</html>
