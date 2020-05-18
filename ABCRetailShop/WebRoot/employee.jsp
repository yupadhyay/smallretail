<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="ABCRetailShop.DataBaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ABCRetailShop.EmployeeBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>

<script language="javascript">
var xmlHttp
function productInfo()
{ 

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="SearchedProduct.jsp";

var w = employee.pid.selectedIndex;
var str = employee.pid.options[w].text;
 //var str=document.productSelect.value;
url=url+"?q="+str;
xmlHttp.onreadystatechange=stateChanged2;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}
function searchCustomer(str)
{ 
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="VerifyCustomer.jsp";
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
var w = employee.pid.selectedIndex;
var str = employee.pid.options[w].text;

if(isNaN(str)){
alert('Invalid PID');
return;

}


if(employee.txt1.value=='')
{
alert('CID cannot be empty');
document.all.txt1.focus();
return;
}
else if(employee.txt3.value=='')
{
alert('QTY cannot be empty');
document.all.txt3.focus();
return;
}





 var field = employee.txt1;
                
            if (isNaN(field.value)) {
                 alert('Pls enter valid CID ');
                 document.all.txt1.focus();
                 return;
            }


var field2 = employee.txt3;
                
            if (isNaN(field2.value)) {
                 alert('Pls enter valid QTY');
                 document.all.txt3.focus();
                return;
            }

else
{
	//login.action="adf.asp"
	employee.submit();		
}






}
</script> 
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Retail Business Store</title>


</head>
<font  size=6 face="Arial"><marquee direction=right  ><b>Retail Business Management System</b></marquee> </font>
<body bgcolor=#33CCFF background=untitled.bmp >

<form name=employee method=post action=PurchaseStatus.jsp>

<br>

<b>
<br>
</b>
<p align="center">
<b>Welcome  

<%!String ename; %>
<% 
String eid = (String)session.getAttribute("username");
EmployeeBean emp = new EmployeeBean();
ename = emp.getName(Integer.parseInt(eid));
 %>
 

 <font size=5><%=ename.toUpperCase() %></font>
 </b>
</p>
<br>
<table align="center">
<tr>
<td width="400">
<b><i><font face="Arial">Enter CID</font></i></b><i><b>: </b>
<input type =text name=txt1 onkeyup="searchCustomer(this.value);">
<img height="9" src="dot.gif" width="9">
</i>
</td>
</tr>
</table>

<div id="txtHint" align="center"></div>
<table align="center">
<tr>
<td width="405">
<font face="Arial"><i><b>Enter PID:
</b></i></font>
<select name="pid" onchange=productInfo()>
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
<img height="9" src="dot.gif" width="9"><br>


</td>
</tr>
</table>
<div id="txtHint2" align="center"></div>
<table align="center">
<tr>
<td width="400">
<font face="Arial"><i><b>Enter QTY:
</b></i></font>
<input type =text name=txt3>
<img height="9" src="dot.gif" width="9"><br></td>
</tr>
</table>
<table align="center">
<tr></tr><tr></tr><tr></tr>
<tr>
<td width="400">
<input type=button name=txt4 value="Make Purchase" onclick="abc()"> 
<input type=reset name=cancel value="Reset" onclick="history.go(0)">
</td>
</tr>
</table>
</form>
</body>

</html>