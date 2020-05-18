<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="ABCRetailShop.DataBaseConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
  
  <body background="untitled.bmp">
  <%!boolean isError2=false; %>
 <%!StringBuffer errorString=new StringBuffer();
 int eid; %>
<%
	String name = request.getParameter("ename");
	String city = request.getParameter("city");
	String telephone = request.getParameter("telephone");
	String empPosition = request.getParameter("position");
	Connection con=null;
	ResultSet rs =null;
	CallableStatement cs =null;
	try {
			con=DataBaseConnection.getConnection();
			String procedure = "begin add_tuple.add_employee(:1,:2,:3,:4); end;";
			cs = con.prepareCall(procedure);
			cs.setString(1, name);
			cs.setString(2, city);
			cs.setString(3, telephone);
			cs.setString(4, empPosition);
			cs.executeQuery();
			
			String statement = "select emp.currval from dual";
			PreparedStatement stmt = con.prepareStatement(statement);
			rs = stmt.executeQuery();
			while(rs.next()){
			eid=rs.getInt(1);
			} 
			
		} catch (SQLException e) {
			isError2=true;
			errorString.append(e.getMessage());
		} catch (ClassNotFoundException e) {
			isError2=true;
			errorString.append(e.getMessage());
		}finally{
			cs.close();
			rs.close();
			con.close();
		}
				
 %>
 
    <%
     if(isError2) {    
    %>
    <B><%=new String(errorString) %></B>
    <br><br>
    <%errorString.setLength(0);}else {%><p align="center"><br><br><b>Employee Created Sucessfully with login name as ID and Initial Password as NAME</b><br></p>
    <table align="center" border="1">
    
<tr>
<td><b>ID</b></td>
<td><%=eid%></td>
</tr>
<tr>
<td><b>NAME</b></td>
<td><%=request.getParameter("ename")%></td>
</tr>
<tr>
<td><b>CITY</b></td>
<td><%=request.getParameter("city")%></td>
</tr>
<tr>
<td><b>TELEPHONE</b></td>
<td><%=request.getParameter("telephone")%></td>
</tr>
<tr>
<td><b>POSITION</b></td>
<td><%=request.getParameter("position")%></td>
</tr>

    
 </table>
    
    
    
    <%} %>
  <p align="center"> <a href="Manager.jsp">Go Back to purchase Page</a></p>
    

 <br>
  </body>
</html>
