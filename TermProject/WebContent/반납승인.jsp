<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*, java.text.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%	
	String tmp_rent_id = request.getParameter("rent_id");
	int rent_id = Integer.parseInt(tmp_rent_id);
	
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
		String sql = "update library.rent set status=? where rent_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,complete);
		pstmt.setInt(2,rent_id);
		pstmt.executeUpdate(); //쿼리실행
		
		String sql1 = "select * from library.rent where rent_id=?";
		pstmt = conn.prepareStatement(sql1);
		pstmt.setInt(1,rent_id);
		ResultSet rs = null;
		rs = pstmt.executeQuery();
		
		String booknum = null;
		
		while (rs.next()) {
			booknum = rs.getString("booknum");
		}
		
		//쿼리를 수행하는 부분
		String sql2 = "update library.book set borrowed=? where bnum=?";
		pstmt = conn.prepareStatement(sql2);
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