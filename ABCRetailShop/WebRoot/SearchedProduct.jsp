<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ABCRetailShop.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%

Connection con=null;
ResultSet rs = null;
StringBuffer sb = new StringBuffer();
try{
con = DataBaseConnection.getConnection();
int pid = Integer.parseInt(request.getParameter("q"));

String statement = "select * from products2 where pid = "+pid;
PreparedStatement stmt = con.prepareStatement(statement);
rs = stmt.executeQuery();
ResultSetMetaData md = rs.getMetaData();
boolean added=false;

sb.append("<table align=center border=1>");
sb.append("<th>"+md.getColumnName(1)+"<th>"+md.getColumnName(2)+"<th>"+md.getColumnName(3)+"<th>"+md.getColumnName(4)
+"<th>"+md.getColumnName(5)+"<th>"+md.getColumnName(6));
while(rs.next()){
sb.append("<tr><td>"+rs.getString(1)+"</td>");
sb.append("<td>"+rs.getString(2)+"</td>");
sb.append("<td>"+rs.getString(3)+"</td>");
sb.append("<td>"+rs.getString(4)+"</td>");
sb.append("<td>"+rs.getString(5)+"</td>");
sb.append("<td>"+rs.getString(6)+"</td></tr>");
added = true;
}
sb.append("</table>");
if (added) { 
           response.setContentType("text/xml"); 
           response.setHeader("Cache-Control", "no-cache"); 
           response.getWriter().write(sb.toString()); 
       } else { 
           response.setStatus(HttpServletResponse.SC_NO_CONTENT); 
           }
 } catch(NumberFormatException e){
 sb.append("<p align=center><font color=red><b>Invalid PID</b></font></p>");
 response.setContentType("text/xml"); 
 response.setHeader("Cache-Control", "no-cache"); 
 response.getWriter().write(sb.toString()); 
 }catch(NullPointerException e){
 sb.append("<font color=red><b>Invalid PID</b></font>");
 response.setContentType("text/xml"); 
 response.setHeader("Cache-Control", "no-cache"); 
 response.getWriter().write(sb.toString()); 
 
 } 
 
 finally{
//rs.close();
con.close();
}
%>