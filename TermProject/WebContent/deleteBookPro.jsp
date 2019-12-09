<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	// �Ķ���� ���� ���� �κ�
	String isbn = request.getParameter("isbn");
	String bnum = request.getParameter("bnum");
	String bid = isbn + bnum;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/tpdatabase?useSSL=false";
		String dbId = "root";
		String dbPass = "football12";
		
		// DB�� ������ ���� Connection ��ü�� ���� �κ�
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		// ������ �����ϴ� �κ�
		String sql = "select bid from book where bid = ?;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bid);
		rs = pstmt.executeQuery();
		
		if(rs.next()) { // ���ʿ� bid�� �����ϴ� ��� ����
			String rBid = rs.getString("bid");
			
			sql = "delete from book where bid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			pstmt.executeUpdate();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
</head>
<body>
	book ���̺��� ������ �����߽��ϴ�.
</body>
</html>
<%
		} else { // �ش� bid ���� ��� ����
			out.println("�������� �ʴ� �����Դϴ�. ISBN�� ��ȣ�� �ٽ� Ȯ���� �ּ���.");
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(rs != null)try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>