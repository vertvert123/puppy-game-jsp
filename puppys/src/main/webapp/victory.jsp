<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<h1>우승!!</h1>
<%
Connection conn=null;
Statement st=null; 
ResultSet rs =null;

try{
	Class.forName("com.mysql.jdbc.Driver");
} catch(ClassNotFoundException e){
	out.println(e);
}
try{
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=Asia/Seoul&useSSL=false","root","1234");
st=conn.createStatement();
rs = st.executeQuery("select game15 from player where id='"+session.getAttribute("myid")+"'");

while(rs.next()) {
%>
<IMG SRC = img/<%=rs.getInt("game15")%>.jpg /><br>
<%
}
}catch(Exception e){
}
%>
<br>
<a href="index.jsp">메인으로가기</a>