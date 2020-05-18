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
boolean added=false;
while(rs.next()){
sb.append("<font color=red><b>"+rs.getString(2)+"</font></b>");
added = true;
}
if (added) { 
           response.setContentType("text/xml"); 
           response.setHeader("Cache-Control", "no-cache"); 
           response.getWriter().write(sb.toString()); 
       } else { 
           response.setStatus(HttpServletResponse.SC_NO_CONTENT); 
           }
 } catch(NumberFormatException e){
 sb.append("<font color=red><b>Invalid PID</b></font>");
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