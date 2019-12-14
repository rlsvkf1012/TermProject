<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%	
	//파라미터 값을 얻어내는 부분
	String id = request.getParameter("id");
	String passwd = request.getParameter("password");
	String name = request.getParameter("name");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1+email2;
	String phone = request.getParameter("phone");
	String title = request.getParameter("type");
	
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
		String sql = "select member_id, member_pw from library.member where member_id =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		// 레코드의 검색 결과로 작업 처리
		if(rs.next()) {
			String rId = rs.getString("member_id");
			String rPasswd = rs.getString("member_pw");
			if(id.equals(rId) && passwd.equals(rPasswd)) { // 아이디,패스워드가 일치하는 경우 수행
				sql = "update library.member set member_name =?, member_email =?, member_tel =?, member_title =? where member_id =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				pstmt.setString(3, phone);
				pstmt.setString(4, title);
				pstmt.setString(5, id);
				pstmt.executeUpdate();
				
				out.println("<script>");
				out.println("location.href='내정보.jsp'");
				out.println("</script>");
				
			} else{ // 패스워드가 일치하지 않으면
			%><script>alert("비밀번호가 일치하지 않습니다.");</script>
			<%}
			}
			else{ //존재하지 않는 아이디일 경우
			%><script>alert("아이디가 일치하지 않습니다.");</script>
			<%}
	}catch(Exception e){
		e.printStackTrace();
	} finally {
		if(rs != null)try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>
