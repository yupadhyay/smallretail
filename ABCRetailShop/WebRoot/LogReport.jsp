<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ABCRetailShop.DataBaseConnection"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="oracle.jdbc.OracleTypes"%>
<%@page import="java.sql.SQLException"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CutomerReport.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="Report.gif"> 
 <p align="center"><B>LOG REPORT</B></p>
 <p>
<table align="center" border="1">
<tr>
<th>WHO</th>
<th>TIME</th>
<th>WHAT</th>

<%

Connection con=null;
PreparedStatement stmt = null;
ResultSet rs = null;
String statement;
try {
		con = DataBaseConnection.getConnection();
		//("begin ? := refcursor_jdbc.getstudents(?); end;");
		statement= "begin show_details.show_logs(?);end;";
		CallableStatement cs = con.prepareCall(statement);
		cs.registerOutParameter(1,OracleTypes.CURSOR);
		cs.execute();
		rs=(ResultSet)cs.getObject(1);
		while(rs.next()){%>
		<tr>
		<td align="center"><%=rs.getString(1) %></td>
		<td align="center"><%=rs.getString(2) %></td>
		<td align="center"><%=rs.getString(3) %></td>
		
		
		
		
			<%}
		
	} catch (SQLException e) {
		out.println(e.getMessage());
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		out.println(e.getMessage());
	}finally{
		try {
			
			rs.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
		}
		
	}
 %>


</table>
<p align="center"><a href="Manager.jsp">Back</a></p>
  </body>
</html>
