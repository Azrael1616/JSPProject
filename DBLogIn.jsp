<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
%>
   <%
 //1. jdbc driver 등록
 Class.forName("org.mariadb.jdbc.Driver");
 
 //2. db 와 연결(Connection) 생성
 String url = "jdbc:mariadb://localhost:3333/injedb";
 String user = "inje";
 String pwd = "4551";
 
 Connection con = DriverManager.getConnection(url, user, pwd);
 
 //3. db 연동
 String sql = "select * from login";
 Statement stmt = con.createStatement();
 
 //3-1. sql 실행 결과 확인
 ResultSet rs = stmt.executeQuery(sql);
 
   %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DB 연결</title>
</head>
<body>
	<table>
		<tr>
			<th>id</th>
			<th>pwd</th>
		</tr>
		<tr>
		<%
		//4. 결과셋 확인
		while(rs.next()){
		String id = rs.getString("id");
		String passwd = rs.getString("pwd");
	%>
	<td><%=id %></td>
	<td><%= passwd %></td>
	</tr>
	<% } %>
   </table>
   <%
//5. DB 연결 해지
rs.close();
stmt.close();
con.close();
%>

</body>
</html>