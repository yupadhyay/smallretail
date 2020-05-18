<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="ABCRetailShop.DataBaseConnection"%>
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
    
    <title>My JSP 'SearchProduct.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
 <script type="text/javascript">
var xmlHttp

function productInfo()
{ 

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="SalesReportInfo.jsp";
var w = myProduct.productSelect.selectedIndex;
var str = myProduct.productSelect.options[w].text;
 //var str=document.productSelect.value;
url=url+"?q="+str;
xmlHttp.onreadystatechange=stateChanged;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function stateChanged() 
{ 
if (xmlHttp.readyState==4)
{ 
document.getElementById("txtHint").innerHTML=xmlHttp.responseText;
}
}

function GetXmlHttpObject()
{
var xmlHttp=null;
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
return xmlHttp;
}
 
 
 
 </script>

  </head>
  
  <body background="searching.gif">
  <br><br><br>
  <form name="myProduct">
  <p align="center">Select Product ID:
 <select name="productSelect"  onchange="productInfo()">
 <option>-SELECT-</option>
<%
Connection con=null;
con = DataBaseConnection.getConnection();
String statement = "select distinct pid from purchases2";
PreparedStatement stmt = con.prepareStatement(statement);
ResultSet rs = stmt.executeQuery();
while(rs.next()){ 
 %>
 
 <option><%=rs.getString(1) %></option>
 <%}rs.close();
 stmt.close();
 con.close(); %>
</select>
  <br>
  <br>
  <p>
<div id="txtHint"><b></b></div>

 <p align="center">  <a href=Manager.jsp>Go Back to purchase Page</a></p>
 </form>
  </body>
</html>
