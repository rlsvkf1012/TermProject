<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	} else {
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
<meta name="viewport" content="width=device-width, initial-scale=3">
<link rel="stylesheet" href="css/bootstrap.css">
<title>내 도서</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<span class="navbar-text"> <%=id%> 님 반갑습니다 !
		</span>
		<ul id="nav" class="nav navbar-nav">
			<li><a href="로그아웃.jsp">로그아웃</a></li>
		</ul>
	</nav>

	<div class="container">
		<div class="col-lg-12"></div>
		<div class="col-lg-12">
			<div class="jumbotron" style="padding-top: 20px; text-align: center">
				<h3 style="text-align: center">예약 현황</h3>
				<br>
				<br>

				<table class="blueone" style="margin-left: auto; margin-right: auto;">
					<tr>
						<th>도서번호</th>
						<th>아이디</th>
						<th>대출일</th>
						<th>반납(예정)일</th>
						<th>상태</th>
						<th></th>
					</tr>
					<%
						String memid1 = id;
						request.setCharacterEncoding("euc-kr");
						String bnum = request.getParameter("bnum");
						String mid = (String)session.getAttribute("id");
						Connection conn = null;
						PreparedStatement pstmt = null;
						String str = "";
						ResultSet rs = null;

						try {
							String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC&useSSL=false";
							String dbId = "root";
							String dbPass = "football12";

							//DB와 연동을 위한 Connection 객체를 얻어내는 부분
							Class.forName("com.mysql.jdbc.Driver");
							conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

							String sql = "select * from library.reserve WHERE resid=?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1,memid1);
							rs = pstmt.executeQuery();
							
							// 테이블 출력
							while (rs.next()) {
								String booknum = rs.getString("bnum");
								String resid = rs.getString("resid");
								String borrow_date = rs.getString("resdate");
								String return_date = rs.getString("returndate");
								String status = rs.getString("status");
					%>
					<tr>
						<td><%=booknum%></td>
						<td><%=resid%></td>
						<td><%=borrow_date%></td>
						<td><%=return_date%></td>
						<td><%=status%></td>
						<% if(status.equals("reserved")){ %>
						<td><a href="대기자현황.jsp?res_id=<%=rs.getString("res_id")%>">대기자현황</a></td><%}%>
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
				<br>
				<br>
				<button type="button" class = "btn btn-info btn-sm" onclick="location.href='Home.jsp'" >홈으로</button>
			</div>
		</div>
	</div>
</body>
</html>