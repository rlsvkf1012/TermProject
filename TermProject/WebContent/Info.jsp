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

<title>ȸ��������ȸ</title>
</head>

<body>
	<h3 align="center">ȸ�����</h3><br><br>
	<table class="blueone" style="margin-left: auto; margin-right: auto;">
		<tr>
			<th>���̵�</th>
			<th>��й�ȣ</th>
			<th>�̸�</th>
			<th>�̸���</th>
			<th>��ȭ��ȣ</th>
			<th>����</th>
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

				//DB�� ������ ���� Connection ��ü�� ���� �κ�
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

				String sql = "select * from library.member";
				pstmt = conn.prepareStatement(sql);

				// rs ����
				rs = pstmt.executeQuery(sql);

				// ���̺� ���
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
			<td><a href="updateMemberForm.jsp">����</a></td>
			<td><a href="deleteMember.jsp?id=<%=rs.getString("member_id")%>">Ż��</a></td>
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
 <nav><a href="adminHome.jsp">Ȩ ȭ������</a></nav>
</html>