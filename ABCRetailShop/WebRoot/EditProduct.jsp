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
<script language="javascript">
var xmlHttp
function getProductInfo()
{ 

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="ProductInformation.jsp";

var w = product.pid.selectedIndex;
var str = product.pid.options[w].text;
 //var str=document.productSelect.value;
url=url+"?q="+str;
xmlHttp.onreadystatechange=stateChanged2;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function stateChanged2() 
{ 
if (xmlHttp.readyState==4)
{ 
document.getElementById("txtHint2").innerHTML=xmlHttp.responseText;
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

function abc()
{
if(isNaN(product.qoh.value)){
alert('Invalid QOH');
product.qoh.focus();
return;
}
if(isNaN(product.qoh_threshold.value)){
alert('Invalid QOH_THRESHOLD');
product.qoh_threshold.focus();
return;
}
if(isNaN(product.original_price.value)){
alert('Invalid Original Price');
product.original_price.focus();
return;
}

if(document.all.qoh.value=="")
{
 alert('QOH cannot be Null');
 document.all.qoh.focus();
 return;
}
if(document.all.qoh_threshold.value=="")
{
 alert('QOH Threshold cannot be Null');
 document.all.qoh_threshold.focus();
 return;
}
if(document.all.original_price.value=="")
{
 alert('Original Price cannot be Null');
 document.all.original_price.focus();
 return;
}



var w1 = product.pid.selectedIndex;
var str1 = product.pid.options[w1].text;

if(isNaN(str1)){
alert('Invalid PID');
return;
} 
else
{
	//login.action="adf.asp"
	product.submit();		
}

}
</script> 
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Retail Business Store</title>


</head>

<body background="Customer.gif">
<form name=product method="post" action="EditProductInfo.jsp">
<p><br></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp; </p>
<font  size=6 face="Arial"><marquee direction=right  ><b>Retail Business Management System</b></marquee> </font>


<p>&nbsp;&nbsp; </p>
<table align="center">
<tr>
<td width =200>
<p align="center"><font face="Arial" size="4" color="red"><i><b>&nbsp;&nbsp;&nbsp; Select PID: 
</b></i></font>
</td>
<td height="32" >
<p align="justify">
<select name=pid onchange="getProductInfo()">
<option>-SELECT-</option>
<%
Connection con=null;
con = DataBaseConnection.getConnection();
String statement = "select pid from products2";
PreparedStatement stmt = con.prepareStatement(statement);
ResultSet rs = stmt.executeQuery();
while(rs.next()){ 
 %>
 
 <option><%=rs.getString(1) %></option>
 <%}rs.close();
 stmt.close();
 con.close(); %>


</select> 
</tr> 
<tr>
<td width="200">
<p align="center"><font face="Arial" size="4" color="red"><i><b>Enter Name:
</b></i></font>
</td>
<td height="32" >
<p align="justify">
<div id="txtHint2"><b></b></div>
</td>
</tr>
<tr>
<td width =200>
<p align="center"><font face="Arial" size="4" color="red"><i><b>&nbsp;&nbsp;&nbsp; Enter Qoh: 
</b></i></font>
</td>
<td height="32" >
<p align="justify">
<input type =text name=qoh> </td>
</tr> 
<tr>
<td width =200>
<p align="center"><font face="Arial" size="4" color="red"><i><b>&nbsp;&nbsp;&nbsp; Enter Qoh_Threshold: 
</b></i></font>
</td>
<td height="32" >
<p align="justify">
<input type =text name=qoh_threshold> </td>
</tr> 
<tr>
<td width =200>
<p align="center"><font face="Arial" size="4" color="red"><i><b>&nbsp;&nbsp;&nbsp; Enter Original Price: 
</b></i></font>
</td>
<td height="32" >
<p align="justify">
<input type =text name=original_price> </td>
</tr> 

<tr>
<td width =200>
<p align="center"><font face="Arial" size="4" color="red"><i><b>&nbsp;&nbsp;&nbsp; Enter Discount_Category: 
</b></i></font>
</td>
<td height="32" >
<p align="justify">
<select name=discount_category> 
<option value="1">1</option>
<option value="2">2</option>
<option value ="3">3</option>
<option value ="4">4</option>
</select> 
</tr> 



<td>
</td>
 
<tr>
<td><input type=button name=txt5 value="Edit Product" onclick="abc()" ></td>
<td><input type=reset name=cancel value="Reset" onclick="history.go(0)"></td>
</table>
</form>
</body>
</html>
