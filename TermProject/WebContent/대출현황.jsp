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
<title>�� ����</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<span class="navbar-text"> <%=id%> �� �ݰ����ϴ� !
		</span>
		<ul id="nav" class="nav navbar-nav">
			<li><a href="�α׾ƿ�.jsp">�α׾ƿ�</a></li>
		</ul>
	</nav>

	<div class="container">
		<div class="col-lg-12"></div>
		<div class="col-lg-12">
			<div class="jumbotron" style="padding-top: 20px; text-align: center">
				<h3 style="text-align: center">���� ��Ȳ</h3>
				<br>
				<br>

				<table class="blueone" style="margin-left: auto; margin-right: auto;">
					<tr>
						<th>������ȣ</th>
						<th>���̵�</th>
						<th>������</th>
						<th>�ݳ���</th>
						<th>����</th>
						<th></th>
					</tr>
					<%
						String memid1 = id;
						request.setCharacterEncoding("euc-kr");
						Connection conn = null;
						PreparedStatement pstmt = null;
						String str = "";
						ResultSet rs = null;

						try {
							String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC&useSSL=false";
							String dbId = "root";
							String dbPass = "5826";

							//DB�� ������ ���� Connection ��ü�� ���� �κ�
							Class.forName("com.mysql.jdbc.Driver");
							conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

							String sql = "select * from library.rent";
							pstmt = conn.prepareStatement(sql);
							rs = pstmt.executeQuery();

							// ���̺� ���
							while (rs.next()) {
								// int rent_id = rs.getInt("rent_id");
								String booknum = rs.getString("booknum");
								String memid = rs.getString("memid");
								String borrow_date = rs.getString("borrow_date");
								String return_date = rs.getString("rdate");
								String status = rs.getString("status");
					%>
					<tr>
						<td><%=booknum%></td>
						<td><%=memid%></td>
						<td><%=borrow_date%></td>
						<td><%=return_date%></td>
						<td><%=status%></td>
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
				<button type="button" class="btn btn-info btn-sm" onclick="location.href='adminHome.jsp'">������ Ȩ����</button>
			</div>
		</div>
	</div>
</body>
</html>