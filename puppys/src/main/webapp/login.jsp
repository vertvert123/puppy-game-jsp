<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
String id = request.getParameter("myid");
String pw = request.getParameter("pass");

Connection conn = null;
ResultSet rs =null;
PreparedStatement pst = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=Asia/Seoul&useSSL=false","root","1234");
	String sql = "select count(*) as cnt from player where id=? and password=?";
	pst = conn.prepareStatement(sql);
	pst.setString(1,id);
	pst.setString(2,pw);
	rs = pst.executeQuery();
	rs.next();
	
	if(rs.getString("cnt").equals("1")) {
		session.setAttribute("myid",id);
		response.sendRedirect("index.jsp");
	} else{
		response.sendRedirect("index.jsp");
	} 
	} catch (Exception e){
		
	}
%>