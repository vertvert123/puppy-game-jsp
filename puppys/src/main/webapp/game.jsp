<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
Connection conn = null;
Statement st = null;
ResultSet rs = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=Asia/Seoul&useSSL=false","root","1234");
	st=conn.createStatement();
	rs=st.executeQuery("select * from player where id='"+session.getAttribute("myid")+"'");
	rs.next();
	
	String num1 = "game"+String.valueOf((rs.getInt("gamecount")-7)*2-1);
	String num2 = "game"+String.valueOf((rs.getInt("gamecount")-7)*2);
%>
<%=session.getAttribute("myid")%>
님의 제 
<%=rs.getInt("gamecount")+1 %>경기

<%
if(rs.getInt("gamecount")==0) {
%>
<form action="choose.jsp">
<input type=hidden name=gamecount value=<%=rs.getInt("gamecount") %>>
<input type=hidden name=val1 value=1>
<input type=hidden name=val2 value=2>
<table>
<tr>
<td><img src=img/1.jpg></td>
<td><img src=img/2.jpg></td>
</tr>
<tr>
<td align="center"><input type="radio" name="result" value="1"></td>
<td align="center"><input type="radio" name="result" value="2"></td>
</tr>
<tr>
<td colspan="2">
<div>
<input type="submit" value="투표하기">
</div></td>
</tr>
 
</table>
</form>
<%
}else if(rs.getInt("gamecount")<8){
%>

<form action="choose.jsp">
<input type=hidden name=gamecount value=<%=rs.getInt("gamecount")%>>
<input type=hidden name=val1 value=<%=rs.getInt("gamecount")*2+1%>>
<input type=hidden name=val2 value=<%=rs.getInt("gamecount")*2+2%>>
<table>
<tr>
<td><img src=img/<%=rs.getInt("gamecount")*2+1%>.jpg /></td>
<td><img src=img/<%=rs.getInt("gamecount")*2+2%>.jpg /></td>
</tr>
<tr>
<td align="center"><input type="radio" name="result" value=<%=rs.getInt("gamecount")*2+1%>></td>
<td align="center"><input type="radio" name="result" value=<%=rs.getInt("gamecount")*2+2%>></td>
</tr>
<tr>
<td colspan="2">
<div>
<input type="submit" value="투표하기">
</div></td>
</tr>
 
</table>
</form>
<%
}else if(rs.getInt("gamecount")<15){
%>
<form action="choose.jsp">
<input type=hidden name=gamecount value=<%=rs.getInt("gamecount")%>>
<input type=hidden name=val1 value=<%=rs.getInt(num1)%>>
<input type=hidden name=val2 value=<%=rs.getInt(num2)%>>
<table>
<tr>
<td><img src=img/<%=rs.getInt(num1)%>.jpg /></td>
<td><img src=img/<%=rs.getInt(num2)%>.jpg /></td>
</tr>
<tr>
<td align="center"><input type="radio" name="result" value=<%=rs.getInt(num1)%>></td>
<td align="center"><input type="radio" name="result" value=<%=rs.getInt(num2)%>></td>
</tr>
<tr>
<td colspan="2">
<div>
<input type="submit" value="투표하기">
</div></td>
</tr>
 
</table>
</form>
<%
}else {
response.sendRedirect("victory.jsp");
}
 
}catch(Exception e) {
 
}
 
%>
</body>
</html>