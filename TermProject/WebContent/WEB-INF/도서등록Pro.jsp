<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	//파라미터 값을 얻어내는 부분
	String bnumber = request.getParameter("bnum");
	String ISBN = request.getParameter("ISBN");
	String btitle = request.getParameter("btitle");
	String author= request.getParameter("author");
	String publication = request.getParameter("publication");
	String borrowed = "O";
	String reserved = "O";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "5826";
		
		
		//DB와 연동을 위한 Connection 객체를 얻어내는 부분
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		//쿼리를 수행하는 부분
		String sql = "insert into library.book values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,bnumber);
		pstmt.setString(2,ISBN);
		pstmt.setString(3,btitle);
		pstmt.setString(4,author);
		pstmt.setString(5,publication);	
		pstmt.setString(6,borrowed);
		pstmt.setString(7,reserved);
		pstmt.executeUpdate(); //쿼리실행
		
		//쿼리 성공시 수행되는 부분
		response.sendRedirect("도서목록.jsp");

	}catch(Exception e){
		//쿼리 실패시 수행되는 부분
		out.println(e);
	}
	finally{//쿼리가 성공 또는 실패 시 사용한 자원을 해체하는 부분
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>