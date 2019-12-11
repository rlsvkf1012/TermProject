<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	// �Ķ���� ���� ���� �κ� 
	String isbn = request.getParameter("isbn");
	String bnum = request.getParameter("bnum");
	String bname = request.getParameter("bname");
	String author = request.getParameter("author");
	String publish = request.getParameter("publish");
	String bid = isbn + bnum;
	
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
		String sql = "insert into book values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bid);
		pstmt.setString(2, isbn);
		pstmt.setString(3, bnum);
		pstmt.setString(4, bname);
		pstmt.setString(5, author);
		pstmt.setString(6, publish);
		pstmt.executeUpdate();
		
		// ���� ������ ��µǴ� ����
		str = "book ���̺� ���ο� ������ ����߽��ϴ�.";
	} catch(Exception e) {
		e.printStackTrace();
		str = "book ���̺� ���ο� ���� ��Ͽ� �����߽��ϴ�.";
	} finally {
		if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn!=null)try{conn.close();}catch(SQLException sqle){}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���</title>
</head>
<body>
	<%=str %>
</body>
</html>