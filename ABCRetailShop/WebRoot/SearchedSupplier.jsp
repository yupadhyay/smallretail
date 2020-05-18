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
con = DataBaseConnection.getConnection();
StringBuffer sb = new StringBuffer();
try{
int sid = Integer.parseInt(request.getParameter("q"));
String statement = "select * from suppliers2 where sid = "+sid;
PreparedStatement stmt = con.prepareStatement(statement);
ResultSet rs = stmt.executeQuery();
ResultSetMetaData md = rs.getMetaData();
boolean added=false;

sb.append("<table align=center border=1>");
sb.append("<th>"+md.getColumnName(1)+"<th>"+md.getColumnName(2)+"<th>"+md.getColumnName(3)+"<th>"+md.getColumnName(4));
while(rs.next()){
sb.append("<tr><td>"+rs.getString(1)+"</td>");
sb.append("<td>"+rs.getString(2)+"</td>");
sb.append("<td>"+rs.getString(3)+"</td>");
sb.append("<td>"+rs.getString(4)+"</td></tr>");
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
 sb.append("<p align=center><font color=red><b>Invalid SID</b></font></p>");
 response.setContentType("text/xml"); 
 response.setHeader("Cache-Control", "no-cache"); 
 response.getWriter().write(sb.toString()); 
 }catch(NullPointerException e){
 sb.append("<font color=red><b>Invalid SID</b></font>");
 response.setContentType("text/xml"); 
 response.setHeader("Cache-Control", "no-cache"); 
 response.getWriter().write(sb.toString()); 
 
 } finally{
//rs.close();
con.close();
}
%>