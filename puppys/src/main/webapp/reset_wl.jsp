<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
Connection conn=null;
PreparedStatement pst = null;


try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=Asia/Seoul&useSSL=false","root","1234");
	String order1="update select_model set wincount=0";
	pst = conn.prepareStatement(order1);
	pst.executeUpdate();
	
	String order2;
	order2="update select_model set losecount=0";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	
	response.sendRedirect("index.jsp");
	} catch(Exception e){
	e.printStackTrace();
	}
	%>