<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project</title>
</head>
<body>
<%
if(session.getAttribute("myid")!= null) {
%>
<%=session.getAttribute("myid") %>님 반갑습니다!

<a href=logout.jsp>로그아웃</a><br>
<a href=game.jsp>시작하기</a><br>
<a href=reset_player.jsp>다시하기</a><br>
<a href=reset_wl.jsp>전적초기화</a>      

<%
} else {
%>
<h1>강아지 이상형 월드컵</h1>

<form action="login.jsp">
아이디 : <input type="text" name="myid"/>
비밀번호 : <input type="password" name="pass"/>
<input type="submit" value="login"/>

<a href="signup.jsp">회원가입</a>

<%
}
%>
</form>

<table border=1>
<tr>
<td align=center> 사진</td>
<td width=150  align=center>이름</td>
<td width=100  align=center>전적</td>
</tr>
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
rs = st.executeQuery("select id, name, wincount, losecount from select_model order by id asc");

while(rs.next()) {
%>
<tr>
<td><IMG SRC = img/<%=rs.getInt("id")%>.jpg /></td>
<td align=center><%=rs.getString("name") %></td>
<td align=center><%=rs.getInt("wincount") %>  win<br>
<%=rs.getInt("losecount") %>  lose</td>
</tr>
<%
}
}catch(Exception e){
}
%>
</table>
</body>
</html>