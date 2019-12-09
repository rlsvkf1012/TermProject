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
	ResultSet rs = null;
	
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/tpdatabase?useSSL=false";
		String dbId = "root";
		String dbPass = "football12";
		
		// DB�� ������ ���� Connection ��ü�� ���� �κ�
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		// ������ �����ϴ� �κ�
		String sql = "select id, passwd from member where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		// ���ڵ��� �˻� ����� �۾� ó��
		if(rs.next()) {
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");
			if(id.equals(rId) && passwd.equals(rPasswd)) { // �н����尡 ��ġ�ϴ� ��� ����
				sql = "update member set name = ?, email = ?, phone = ?, division = ? where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				pstmt.setString(3, phone);
				pstmt.setString(4, division);
				pstmt.setString(5, id);
				pstmt.executeUpdate();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ����</title>
</head>
<body>
	member ���̺��� ȸ�� ������ �����߽��ϴ�.
</body>
</html>
<%
			} else { // �н����尡 ��ġ���� �ʴ� ��� ����
				out.println("�н����尡 Ʋ�Ƚ��ϴ�.");
			}
		} else { // �������� �ʴ� ���̵��� ���
			out.println("���̵� Ʋ�Ƚ��ϴ�.");
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(rs != null)try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>