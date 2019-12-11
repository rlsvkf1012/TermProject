<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style>
body {
	background: #fff;
}

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

nav {
	text-align: center;
}
}
</style>
<meta name="viewport" content="width=devide-width, initial-scale=3">
<link rel="stylesheet" href="css/bootstrap.css">

<title>도서목록조회</title>
</head>

<body>
	<h3 align="center">도서목록</h3>
	<br>
	<br>

	<form action="도서검색Pro.jsp" name="search" method="post">
		<div class="search" style="text-align: center">
			책 제목 : <input type="text" name="title" placeholder="책 제목 입력">&emsp;
			ISBN : <input type="text" name="ISBN" placeholder="ISBN 입력">
			<button type="submit" value="검색">검색</button>
		</div>
	</form>
	<br>
	<br>


	<table class="blueone" style="margin-left: auto; margin-right: auto;">
		<tr>
			<th>도서번호</th>
			<th>ISBN</th>
			<th>책 제목</th>
			<th>저자</th>
			<th>출판사</th>
			<th>대출가능</th>
			<th>예약가능</th>
			<th></th>
			<th></th>
		</tr>
		<%
			request.setCharacterEncoding("euc-kr");

			String stitle = request.getParameter("title");
			String sISBN = request.getParameter("ISBN");

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPass = "5826";

				//DB와 연동을 위한 Connection 객체를 얻어내는 부분
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

				String sql = "select * from library.book where btitle =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, stitle);
				//pstmt.setString(2,sISBN);

				// rs 저장
				rs = pstmt.executeQuery(sql);

				// 테이블 출력
				while (rs.next()) {
					String bnum = rs.getString("bnum");
					String ISBN = rs.getString("ISBN");
					String btitle = rs.getString("btitle");
					String author = rs.getString("author");
					String publication = rs.getString("publication");
					String borrowed = rs.getString("borrowed");
					String reserved = rs.getString("reserved");
		%>
		<tr>
			<td><%=bnum%></td>
			<td><%=ISBN%></td>
			<td><%=btitle%></td>
			<td><%=author%></td>
			<td><%=publication%></td>
			<td><%=borrowed%></td>
			<td><%=reserved%></td>
			<td><a href="도서수정.jsp">수정</a></td>
			<td><a href="도서삭제.jsp?bnum=<%=rs.getString("bnum")%>">삭제</a></td>
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
<br>
<br>
<nav>
	<a href="도서등록Form.jsp">도서등록</a>
</nav>
<nav>
	<a href="adminHome.jsp">홈 화면으로</a>
</nav>
</html>