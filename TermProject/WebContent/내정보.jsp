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
<title>��������ȸ</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<span class="navbar-text"> <%=id %> �� �ݰ����ϴ� !
		</span>
		<ul id="nav" class="nav navbar-nav">
			<li><a href="�α׾ƿ�.jsp">�α׾ƿ�</a></li>
		</ul>
	</nav>
	
	<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
	<div class="jumbotron" style="padding-top: 20px; text-align:center">
	<h3 style="text-align: center">�� ����</h3><br><br>
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

		//DB�� ������ ���� Connection ��ü�� ���� �κ�
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String sql = "select * from library.member where member_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id2);
		rs = pstmt.executeQuery();

		// ���̺� ���
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
			<td>���̵�</td>
			<td><%=id%></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><%=passwd%></td>
		</tr>
		<tr>
			<td>�̸�</td>
			<td><%=name%></td>
		</tr>
		<tr>
			<td>�̸���</td>
			<td><%=email%></td>
		</tr>
		<tr>
			<td>��ȭ��ȣ</td>
			<td><%=phonenumber%></td>
		</tr>
		<tr>
			<td>ȸ������</td>
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
	<button type="button" class = "btn btn-info btn-sm" onclick="location.href='ȸ����������Form.jsp'" >�����ϱ�</button>
	<button type="button" class = "btn btn-info btn-sm" onclick="location.href='Home.jsp'" >Ȩ����</button>
	</div>
	</div>
	</div>
	
</body>
</html>