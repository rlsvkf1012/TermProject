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
	String str = "";
	
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/tpdatabase?useSSL=false";
		String dbId = "root";
		String dbPass = "football12";
		
		// DB와 연동을 위한 Connection 객체를 얻어내는 부분
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		// 쿼리를 수행하는 부분
		String sql = "insert into member values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		pstmt.setString(5, phone);
		pstmt.setString(6, division);
		pstmt.executeUpdate();
		
		// 쿼리 성공시 출력되는 문장
		str = "member 테이블에 새로운 회원을 등록했습니다.";
	} catch(Exception e) {
		e.printStackTrace();
		str = "member 테이블에 새로운 회원 등록에 실패했습니다.";
	} finally {
		if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn!=null)try{conn.close();}catch(SQLException sqle){}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 등록</title>
</head>
<body>
	<%=str %>
</body>
</html>