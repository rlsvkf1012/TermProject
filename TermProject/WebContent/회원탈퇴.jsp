<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%	
	String id = null;
	if(session.getAttribute("id")!=null){
	id=(String)session.getAttribute("id");
	}else{
	out.println("<script>");
	out.println("location.href=loginForm.jsp");
	out.println("</script>");
	}
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "5826";
		
		
		//DB와 연동을 위한 Connection 객체를 얻어내는 부분
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		//쿼리를 수행하는 부분
		String sql = "delete from library.member where member_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.executeUpdate(); //쿼리실행
		
		//쿼리 성공시 수행되는 부분
		out.println("<script>");
		out.println("location.href='로그아웃.jsp'");
		out.println("</script>");
		
	}
	catch(Exception e){
		out.println(e);
	}
%>
