<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
String i = request.getParameter("myid");
String p = request.getParameter("pass");

Connection conn = null;
PreparedStatement pst = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=Asia/Seoul&useSSL=false","root","1234");
	String query = "insert into player values(?,?,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)";
	pst = conn.prepareStatement(query);
	pst.setString(1, i);
	pst.setString(2, p);
	pst.executeUpdate();
	
	response.sendRedirect("index.jsp");
} catch(Exception e) {
	
}
%>
