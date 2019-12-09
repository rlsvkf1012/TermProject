<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	// �Ķ���� ���� ���� �κ�
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String division = request.getParameter("division");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/tpdatabase?useSSL=false";
		String dbId = "root";
		String dbPass = "football12";
		
		// DB�� ������ ���� Connection ��ü�� ���� �κ�
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		// ������ �����ϴ� �κ�
		String sql = "insert into member values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		pstmt.setString(5, phone);
		pstmt.setString(6, division);
		pstmt.executeUpdate();
		
		// ���� ������ ��µǴ� ����
		str = "member ���̺� ���ο� ȸ���� ����߽��ϴ�.";
	} catch(Exception e) {
		e.printStackTrace();
		str = "member ���̺� ���ο� ȸ�� ��Ͽ� �����߽��ϴ�.";
	} finally {
		if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn!=null)try{conn.close();}catch(SQLException sqle){}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���</title>
</head>
<body>
	<%=str %>
</body>
</html>