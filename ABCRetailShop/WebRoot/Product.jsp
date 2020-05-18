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
function abc()
{
if(product.pname.value=='')
{
alert('Product Name cannot be empty');
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
if(parseInt(product.qoh.value)<=parseInt(product.qoh_threshold.value)){
alert('QOH THRESHOLD CAN NOT BE GREATER THAN QOH');
product.qoh_threshold.focus();
return;
}
var w = product.sid.selectedIndex;
var strp = product.sid.options[w].text;

if(isNaN(strp)){
alert('Invalid SID');
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
<form name=product method="post" action="ProductInfo.jsp">
<p><br></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp; </p>
<font  size=6 face="Arial"><marquee direction=right  ><b>Retail Business Management System</b></marquee> </font>


<p>&nbsp;&nbsp; </p>
<table align="center">

<tr>
<td width="200">
<p align="center"><font face="Arial" size="4" color="red"><i><b>Enter Name:
</b></i></font>
</td>
<td height="32" >
<p align="justify">
<input type =text name=pname>
<img height="9" src="dot.gif" width="9"></td>
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

<tr>
<td width =200>
<p align="center"><font face="Arial" size="4" color="red"><i><b>&nbsp;&nbsp;&nbsp; Enter SID: 
</b></i></font>
</td>
<td height="32" >
<p align="justify">
<select name=sid>
<option>-SELECT-</option>
<%
Connection con=null;
con = DataBaseConnection.getConnection();
String statement = "select sid from suppliers2";
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


<td>
</td>
 
<tr>
<td><input type=button name=txt5 value="Create Product" onclick="abc()"></td>
<td><input type=reset name=cancel value="Reset"></td>
</table>
</form>
</body>
</html>
