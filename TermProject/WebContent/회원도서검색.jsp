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
</style>
<meta name="viewport" content="width=devide-width, initial-scale=3">
<link rel="stylesheet" href="css/bootstrap.css">

<title>�����˻�</title>
</head>

<body>
	<h3 align="center">�˻��� �������</h3><br><br>
	<table class="blueone" style="margin-left: auto; margin-right: auto;">
		<tr>
			<th>������ȣ</th>
			<th>ISBN</th>
			<th>å ����</th>
			<th>����</th>
			<th>���ǻ�</th>
			<th>���Ⱑ��</th>
			<th>���࿩��</th>
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
				String dbPass = "football12";

				//DB�� ������ ���� Connection ��ü�� ���� �κ�
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

				if (sISBN.equals("")) {
					String sql = "select * from library.book where btitle=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,stitle);
				} else if (stitle.equals("")) {
					String sql = "select * from library.book where ISBN=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,sISBN);
				} else {
					String sql = "select * from library.book where btitle=? && ISBN=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,stitle);
					pstmt.setString(2,sISBN);
				}

				// rs ����
				rs = pstmt.executeQuery();

				// ���̺� ���
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
			
			<% if (borrowed.equals("X")){ %>
				<td>���� ��</td>
			<% } else { %>
				<td><a href="��������.jsp?bnum=<%=rs.getString("bnum")%>">����</a></td>
			<% } %>
			<% if (borrowed.equals("O")){ %>
				<td></td>
			<% } else { %>
				<td><a href="��������.jsp?bnum=<%=rs.getString("bnum")%>">����</a></td>
			<% } %>
			
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
<nav><a href="Home.jsp">Ȩ ȭ������</a></nav>

</html>