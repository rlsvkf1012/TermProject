<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%	
	//파라미터 값을 얻어내는 부분
	String bnum = request.getParameter("bnum");
	String ISBN = request.getParameter("ISBN");
	String btitle = request.getParameter("btitle");
	String author = request.getParameter("author");
	String publication = request.getParameter("publication");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "5826";
		
		
		//DB와 연동을 위한 Connection 객체를 얻어내는 부분
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		// 쿼리를 수행하는 부분
		String sql = "select bnum from library.book where bnum =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bnum);
		rs = pstmt.executeQuery();
		
		// 레코드의 검색 결과로 작업 처리
		if(rs.next()) {
			String rbnum = rs.getString("bnum");
			if(rbnum.equals(bnum)){ // 책 번호가 일치하는 경우 수행
				sql = "update library.book set ISBN=?, btitle=?, author=?, publication=? where bnum=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ISBN);
				pstmt.setString(2, btitle);
				pstmt.setString(3, author);
				pstmt.setString(4, publication);
				pstmt.setString(5, bnum);
				pstmt.executeUpdate();
				
				out.println("<script>");
				out.println("location.href='도서목록.jsp'");
				out.println("</script>");
				
			} else{ // 도서번호가 일치하지 않으면
			%><script>alert("도서번호가 일치하지 않습니다.");</script>
			<%}
			}
			else{ //존재하지 않는 아이디일 경우
			%><script>alert("도서번호가 존재하지 않습니다.");</script>
			<%}
	}catch(Exception e){
		e.printStackTrace();
	} finally {
		if(rs != null)try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>