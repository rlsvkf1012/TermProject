<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

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

<title>회원정보조회</title>
</head>

<body>
	<h3 align="center">회원목록</h3><br><br>
	<table class="blueone" style="margin-left: auto; margin-right: auto;">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>구분</th>
			<th></th>
			<th></th>
		</tr>
		<%
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

				String sql = "select * from library.member";
				pstmt = conn.prepareStatement(sql);

				// rs 저장
				rs = pstmt.executeQuery(sql);

				// 테이블 출력
				while (rs.next()) {
					String id = rs.getString("member_id");
					String passwd = rs.getString("member_pw");
					String name = rs.getString("member_name");
					String email = rs.getString("member_email");
					String phonenumber = rs.getString("member_tel");
					String title = rs.getString("member_title");
		%>
		<tr>
			<td><%=id%></td>
			<td><%=passwd%></td>
			<td><%=name%></td>
			<td><%=email%></td>
			<td><%=phonenumber%></td>
			<td><%=title%></td>
			<td><a href="회원정보수정Form.jsp">수정</a></td>
			<td><a href="deleteMember.jsp?id=<%=rs.getString("member_id")%>">탈퇴</a></td>
		</tr>
		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException ex) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException ex) {
					}
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException ex) {
					}
			}
		%>
	</table>	 	
</body>
 <br><br>
 <nav><a href="adminHome.jsp">홈 화면으로</a></nav>
</html>
