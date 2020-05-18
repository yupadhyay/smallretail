<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ABCRetailShop.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException{
String name = request.getParameter("q");
if(name!=null) name=name.trim().toLowerCase();
StringBuffer sb = new StringBuffer();
Connection con=null;
boolean added=false;
con = DataBaseConnection.getConnection();
String statement = "select * from employees2 where lower(ename) like '"+name+"%'";
PreparedStatement stmt = con.prepareStatement(statement);
ResultSet rs = stmt.executeQuery();

sb.append("<table border=1 align=center>");
sb.append("<th>EID<th>NAME<th>CITY<th>TELEPHONE<th>POSITION");
while(rs.next()){

sb.append("<tr><td>"+rs.getString(1)+"</td>");
sb.append("<td>"+rs.getString(2)+"</td>");
sb.append("<td>"+rs.getString(3)+"</td>");
sb.append("<td>"+rs.getString(4)+"</td>");
sb.append("<td>"+rs.getString(5)+"</td>");

added=true;
}
sb.append("</table>");
if (added) { 
           response.setContentType("text/xml"); 
           response.setHeader("Cache-Control", "no-cache"); 
           response.getWriter().write(sb.toString()); 
       } else { 
           response.setStatus(HttpServletResponse.SC_NO_CONTENT); 
 } 
rs.close();
con.close();
//}
%>