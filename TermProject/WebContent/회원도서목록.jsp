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
<meta name="viewport" content="width=device-width, initial-scale=3">
<link rel="stylesheet" href="css/bootstrap.css">

<title>ȸ�����������ȸ</title>
</head>

<body>
	<nav class="navbar navbar-default">
		<span class="navbar-text"> <%=id %> �� �ݰ����ϴ� ! </span>
		<ul id="nav" class="nav navbar-nav">
			<li><a href="�α׾ƿ�.jsp">�α׾ƿ�</a></li>
		</ul>
	</nav>
	<h3 align="center">�������</h3><br><br>
	
		<form action="ȸ�������˻�.jsp" name="search" method="post">
		<div class="search" style="text-align:center">
		å ���� : <input type="text" name="title" placeholder="å ���� �Է�">&emsp; 
		ISBN : <input type="text" name="ISBN" placeholder="ISBN �Է�"> 	
		<button type="submit" value="�˻�">�˻�</button>
		</div>
		</form><br><br>
	
	
	<table class="blueone" style="margin-left: auto; margin-right: auto;">
		<tr>
			<th>������ȣ</th>
			<th>ISBN</th>
			<th>å ����</th>
			<th>����</th>
			<th>���ǻ�</th>
			<th>���Ⱑ��</th>
			<th>���డ��</th>
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

				String sql = "select * from library.book";
				pstmt = conn.prepareStatement(sql);

				// rs ����
				rs = pstmt.executeQuery(sql);

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
			<td><a href="��������.jsp?bnum=<%=rs.getString("bnum")%>">����</a></td>
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