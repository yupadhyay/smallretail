<%@page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ABCRetailShop.DataBaseConnection"%>
<%@page import="java.sql.CallableStatement"%>
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
    
    <title>My JSP 'PurchaseStatus.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background=untitled.bmp>
 <%!boolean isError1=false; %>
 <%!StringBuffer errorString=new StringBuffer(); %>
 <%
Connection con=null;
PreparedStatement stmt = null;
ResultSet rs = null;
double totalPrice;
String statement;
int pid = Integer.parseInt(request.getParameter("pid"));
int cid = Integer.parseInt(request.getParameter("txt1"));
int qty = Integer.parseInt(request.getParameter("txt3"));
int eid = Integer.parseInt((String)session.getAttribute("username"));
session.setAttribute("pid",request.getParameter("pid"));
session.setAttribute("cid",request.getParameter("txt1"));
session.setAttribute("qty",request.getParameter("txt3"));

	try {
		con=DataBaseConnection.getConnection();
		String procedure = "begin add_tuple.add_purchase(:1,:2,:3,:4); end;";
		CallableStatement cs = con.prepareCall(procedure);
		cs.setInt(1, eid);
		cs.setInt(2, pid);
		cs.setInt(3, cid);
		cs.setInt(4, qty);
		cs.executeQuery();
		
		
	} catch (SQLException e) {
		isError1=true;
		if(e.getErrorCode()==20001){
			errorString.append("<p><B><font color=red>ERROR!!!! Insufficient Quantity in stock Please refer Manager</font></B></p>");	
		}
	
		// if(e.getErrorCode()==2291){
			//errorString.append("<p><B><font color=red>Customer Does Not Exists Create New Customer</font></B></p>");
		//}
		if(e.getErrorCode()==20002){
			errorString.append("<p><B><font color=red>ERROR !!!! current quantity on hand is "+new ProductBean(pid).getQoh()+" a new order need to be placed</font></B></p>");
		}
		else{
			errorString.append("<p><B><font color=red>"+e.getMessage()+"</font></B></p>");
		}
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		try {			
			con.close();
		} catch (SQLException e) {
			isError1=true;
			errorString.append(e.getMessage());
		}
	}   
    %>
    <%!String position; %>
    <%!String URL; %>
    
    <%
    position=(String)session.getAttribute("position");
    if(position.compareToIgnoreCase("clerk")==0) URL="employee.jsp";
    else URL="Manager.jsp";    
    if(isError1) {  
    %>
    <%=errorString.toString()%>
    <br><br>
    <a href=<%=URL%>>Go Back to purchase Page</a>
    <%isError1=false;errorString.setLength(0);}else response.sendRedirect("purchaseInfo.jsp"); %>
  </body>
</html>
