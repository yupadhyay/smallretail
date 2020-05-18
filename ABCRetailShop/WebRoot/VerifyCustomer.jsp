<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ABCRetailShop.DataBaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException{
String id = request.getParameter("q");
StringBuffer sb = new StringBuffer();
Connection con=null;
boolean added=false;
ResultSet rs=null;
try{
con = DataBaseConnection.getConnection();
String statement = "select * from customers2 where cid = '"+id+"'";
PreparedStatement stmt = con.prepareStatement(statement);
rs = stmt.executeQuery();

while(rs.next()){
added=true;
break;
}
if (added) { 
		sb.append("<b><font color=green> CID FOUND </font></b>");
           response.setContentType("text/xml"); 
           response.setHeader("Cache-Control", "no-cache"); 
           response.getWriter().write(sb.toString()); 
       } else { 
       		sb.append("<b><font color=red> CID NOT FOUND </font></b>");
           response.setContentType("text/xml"); 
           response.setHeader("Cache-Control", "no-cache"); 
           response.getWriter().write(sb.toString()); 
 } 
}catch(SQLException e){
sb.append("<b><font color=red>INVALID CID</font></b>");
response.setContentType("text/xml"); 
response.setHeader("Cache-Control", "no-cache"); 
response.getWriter().write(sb.toString()); 
}finally{
//rs.close();
con.close();
}
//}
%>