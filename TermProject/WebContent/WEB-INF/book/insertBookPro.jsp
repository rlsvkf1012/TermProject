<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	// 파라미터 값을 얻어내는 부분 
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
		
		// DB와 연동을 위한 Connection 객체를 얻어내는 부분
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		// 쿼리를 수행하는 부분
		String sql = "insert into book values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bid);
		pstmt.setString(2, isbn);
		pstmt.setString(3, bnum);
		pstmt.setString(4, bname);
		pstmt.setString(5, author);
		pstmt.setString(6, publish);
		pstmt.executeUpdate();
		
		// 쿼리 성공시 출력되는 문장
		str = "book 테이블에 새로운 도서를 등록했습니다.";
	} catch(Exception e) {
		e.printStackTrace();
		str = "book 테이블에 새로운 도서 등록에 실패했습니다.";
	} finally {
		if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn!=null)try{conn.close();}catch(SQLException sqle){}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>도서 등록</title>
</head>
<body>
	<%=str %>
</body>
</html>