<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*, java.text.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%	
	String booknum = request.getParameter("booknum");
	String O = "O";
	String complete="complete";
	Timestamp comd = new Timestamp(System.currentTimeMillis());
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String cdate = simpleDate.format(comd);
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
		String sql = "update library.rent set status=?, rdate=? where booknum=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,complete);
		pstmt.setString(2,cdate);
		pstmt.setString(3,booknum);
		pstmt.executeUpdate(); //쿼리실행
		
		//쿼리를 수행하는 부분
		String sql1 = "update library.book set borrowed=? where bnum=?";
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1,O);
		pstmt.setString(2,booknum);
		pstmt.executeUpdate(); //쿼리실행
		
		out.println("<script>");
		out.println("location.href='관리자도서현황.jsp'");
		out.println("</script>");
	}
	catch(Exception e){
		out.println(e);
	}finally{
		if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn!=null)try{conn.close();}catch(SQLException sqle){}
	}
%>