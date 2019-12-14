<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
String id = null;
if(session.getAttribute("id")!=null){
	id=(String)session.getAttribute("id");
}else{
	out.println("<script>");
	out.println("location.href=loginForm.jsp");
	out.println("</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style>  
body { background: #fff; }
.blueone {
  border-collapse: collapse;
}  
.blueone th {
  padding: 10px;
  color: #168;
  border-bottom: 3px solid #168;
  text-align: left;
}
.blueone td {
  color: #669;
  padding: 10px;
  border-bottom: 1px solid #ddd;
}
.blueone tr:hover td {
  color: #004;
  }
nav{text-align:center;}
}
</style>
<meta name="viewport" content="width=devide-width, initial-scale=3">
<link rel="stylesheet" href="css/bootstrap.css">
<title>내정보조회</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<span class="navbar-text"> <%=id %> 님 반갑습니다 !
		</span>
		<ul id="nav" class="nav navbar-nav">
			<li><a href="로그아웃.jsp">로그아웃</a></li>
		</ul>
	</nav>
	
	<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
	<div class="jumbotron" style="padding-top: 20px; text-align:center">
	<h3 style="text-align: center">내 정보</h3><br><br>
<%
	String id2 = id;
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	ResultSet rs = null;

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "5826";

		//DB와 연동을 위한 Connection 객체를 얻어내는 부분
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String sql = "select * from library.member where member_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id2);
		rs = pstmt.executeQuery();

		// 테이블 출력
	while (rs.next()) {
		String id3 = rs.getString("member_id");
		String passwd = rs.getString("member_pw");
		String name = rs.getString("member_name");
		String email = rs.getString("member_email");
		String phonenumber = rs.getString("member_tel");
		String title = rs.getString("member_title");	
%>
		
	<table class="blueone" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td>아이디</td>
			<td><%=id%></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%=passwd%></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=name%></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=email%></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=phonenumber%></td>
		</tr>
		<tr>
			<td>회원구분</td>
			<td><%=title%></td>
		</tr>
		<%
	}
		} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
	<br><br>
	<button type="button" class = "btn btn-info btn-sm" onclick="location.href='회원정보수정.jsp'" >수정하기</button>
	<button type="button" class = "btn btn-info btn-sm" onclick="location.href='Home.jsp'" >홈으로</button>
	</div>
	</div>
	</div>
	
</body>
</html>
