<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
Connection conn=null;
PreparedStatement pst = null;


try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=Asia/Seoul&useSSL=false","root","1234");
	String order1="update player set game1=0 where id='"+session.getAttribute("myid")+"'";
	pst = conn.prepareStatement(order1);
	pst.executeUpdate();
	
	String order2;
	order2="update player set game2=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	String order3;
	order2="update player set game3=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	String order4;
	order2="update player set game4=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	String order5;
	order2="update player set game5=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	String order6;
	order2="update player set game6=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	String order7;
	order2="update player set game7=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	String order8;
	order2="update player set game8=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	String order9;
	order2="update player set game9=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	String order10;
	order2="update player set game10=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	String order11;
	order2="update player set game11=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	String order12;
	order2="update player set game12=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	String order13;
	order2="update player set game13=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	String order14;
	order2="update player set game14=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	String order15;
	order2="update player set game15=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	String order16;
	order2="update player set gamecount=0 where id='"+session.getAttribute("myid")+"'";
	pst=conn.prepareStatement(order2);
	pst.executeUpdate();
	
	
	response.sendRedirect("game.jsp");
	} catch(Exception e){
	e.printStackTrace();
	}
	%>