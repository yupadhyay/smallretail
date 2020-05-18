<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="ABCRetailShop.MakePurchase"%>
<%@page import="ABCRetailShop.EmployeeBean"%>
<%@page import="ABCRetailShop.ProductBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'purchaseInfo.jsp' starting page</title>
    
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
   <br><br><br><br><br>
    <%!double total_price;
       int temp_qty;
       int qoh_threshold;
     %>
    
<%
   MakePurchase purchase = new MakePurchase();
   int pid =  Integer.parseInt((String)session.getAttribute("pid"));
   int qty = Integer.parseInt((String)session.getAttribute("qty"));
   temp_qty = new ProductBean(pid).getQoh();
   qoh_threshold = new ProductBean(pid).getQohThreshold();
   total_price=purchase.getTotalPrice(pid,qty);  
   %>
   <p align="center"><b>PURCHASE INFORMATION</b></p>
   <br>
   <%if(temp_qty<qoh_threshold){ %>
   <p align="center"><font color="red" size=4><b>ATTENSION !!!!!!!  The current quantity on hand is  <%=temp_qty %>  New order of product needs to be placed</font>
   <p></p><p></p>
   <%} %>
   <table align="center" border="1">
   <tr>
   <td><B>CID</B></td>
   <td><%=session.getAttribute("cid") %></td>
   </tr>
   <tr>
   <td><B>PID</B></td>
   <td><%=session.getAttribute("pid") %></td>
   </tr>
   <tr>
   <td><B>Product Name</B></td>
   <td><%=new ProductBean(Integer.parseInt((String)session.getAttribute("pid"))).getName()%></td>
   </tr>
   <tr>
   <td><B>QTY</B></td>
   <td><%=session.getAttribute("qty") %></td>
   </tr>
   <tr>
   <td><B>Total Price</B></td>
   <td>
   
   <%=total_price%>   
   </td>

 

   </tr> 
   <tr>  
   <%!String URL; %>
   
   <%   
   String position = (String)session.getAttribute("position");   
   if(position.compareToIgnoreCase("clerk")==0){
   URL="employee.jsp";
   }else{
   URL="Manager.jsp";
   }   
    %>
   <tr>
   <td>
   <b><a href=<%=URL%>>Make More Purchase</a></b>
   </td>
   <td></td>
   </tr>   
   </table>
  </body>
</html>
