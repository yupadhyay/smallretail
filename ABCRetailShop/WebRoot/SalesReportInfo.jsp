<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ABCRetailShop.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="oracle.jdbc.OracleTypes"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%

Connection con=null;
ResultSet rs = null;
String statement;
con = DataBaseConnection.getConnection();
StringBuffer sb = new StringBuffer();
try{
int pid = Integer.parseInt(request.getParameter("q"));

statement= "begin sales_report.report_monthly_sale(?,?);end;";
CallableStatement cs = con.prepareCall(statement);
cs.registerOutParameter(2,OracleTypes.CURSOR);
cs.setInt(1,pid);
cs.execute();
rs=(ResultSet)cs.getObject(2);
boolean added=false;

sb.append("<table align=center border=1>");
sb.append("<th>PNAME<TH>MONTH<TH>QUANTITY<TH>TOTAL<TH>AVERAGE SALE");
while(rs.next()){
sb.append("<tr><td>"+rs.getString(1)+"</td>");
sb.append("<td>"+rs.getString(2)+"</td>");
sb.append("<td>"+rs.getString(3)+"</td>");
sb.append("<td>"+rs.getString(4)+"</td>");
sb.append("<td>"+rs.getString(5)+"</td></tr>");

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
 sb.append("<p align=center><font color=red><b>Invalid PID</b></font></p>");
 response.setContentType("text/xml"); 
 response.setHeader("Cache-Control", "no-cache"); 
 response.getWriter().write(sb.toString()); 
 
 } 
 
 finally{
//rs.close();
con.close();
}
%>