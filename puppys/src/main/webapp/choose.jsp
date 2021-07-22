<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
String gamecount = request.getParameter("gamecount");
String result = request.getParameter("result");
String val1 = request.getParameter("val1");
String val2 = request.getParameter("val2");

int val3;

Connection conn = null;
PreparedStatement pst = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=Asia/Seoul&useSSL=false","root","1234");
	String order1 =  "update player set gamecount = gamecount+1 where id= '" +session.getAttribute("myid")+"'";
	pst = conn.prepareStatement(order1);
	pst.executeUpdate();
	
	String order2,order3,order4;
	
	if(result.equals(val1)){
		order2 = "update select_model set wincount = wincount+1 where id="+val1;
		order3 = "update select_model set losecount = losecount+1 where id="+val2;
		val3=Integer.parseInt(val1);
	} else{
		order2 = "update select_model set wincount = wincount+1 where id="+val2;
		order3 = "update select_model set losecount = losecount+1 where id="+val1;
		val3=Integer.parseInt(val2);
	}
	
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	pst=conn.prepareStatement(order3);
	pst.executeUpdate();
	
	order4 = "update player set game"+String.valueOf(Integer.parseInt(gamecount)+1)+"="+String.valueOf(val3)+" where id='"+session.getAttribute("myid")+"'";
	pst = conn.prepareStatement(order4);
	pst.executeUpdate();
	
	response.sendRedirect("game.jsp");
} catch(Exception e){
	e.printStackTrace();
	}
	
%>