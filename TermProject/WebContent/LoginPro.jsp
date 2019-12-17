<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	//파라미터 값을 얻어내는 부분
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	ResultSet rs = null;

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "5826";

		//DB와 연동을 위한 Connection 객체를 얻어내는 부분
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		//쿼리를 수행하는 부분
		String sql = "select * from library.member where member_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			if(password.equals(rs.getString("member_pw"))){
				session.setAttribute("id",id);
				out.println("<script>");
				out.println("location.href='Home.jsp'");
				out.println("</script>");
			}
		}
		out.println("<script>");
		out.println("location.href='LoginForm.jsp'");
		out.println("</script>");
				

	} catch (Exception e) {
		//쿼리 실패시 수행되는 부분
		out.println(e);
	}
%>