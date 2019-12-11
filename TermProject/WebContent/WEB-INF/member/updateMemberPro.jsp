<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	// 파라미터 값을 얻어내는 부분
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
		
		// DB와 연동을 위한 Connection 객체를 얻어내는 부분
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		// 쿼리를 수행하는 부분
		String sql = "select id, passwd from member where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		// 레코드의 검색 결과로 작업 처리
		if(rs.next()) {
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");
			if(id.equals(rId) && passwd.equals(rPasswd)) { // 패스워드가 일치하는 경우 수행
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
<title>회원 정보 수정</title>
</head>
<body>
	member 테이블의 회원 정보를 수정했습니다.
</body>
</html>
<%
			} else { // 패스워드가 일치하지 않는 경우 실행
				out.println("패스워드가 틀렸습니다.");
			}
		} else { // 존재하지 않는 아이디인 경우
			out.println("아이디가 틀렸습니다.");
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(rs != null)try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>