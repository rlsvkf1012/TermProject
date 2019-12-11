<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	// 파라미터 값을 얻어내는 부분
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
		
		// DB와 연동을 위한 Connection 객체를 얻어내는 부분
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		// 쿼리를 수행하는 부분
		String sql = "select bid from book where bid = ?;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bid);
		rs = pstmt.executeQuery();
		
		if(rs.next()) { // 기초에 bid가 존재하는 경우 수행
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
<title>도서 삭제</title>
</head>
<body>
	book 테이블의 도서를 삭제했습니다.
</body>
</html>
<%
		} else { // 해당 bid 없을 경우 실행
			out.println("존재하지 않는 도서입니다. ISBN과 번호를 다시 확인해 주세요.");
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(rs != null)try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>