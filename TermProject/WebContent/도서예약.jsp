<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.util.*, java.text.*"%>

<% request.setCharacterEncoding("euc-kr"); %>

<%	
	String bnum = request.getParameter("bnum");
	String resid = (String)session.getAttribute("id");	
	String status = "reserved";
	
	String re ="O";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "football12";
		
		
		//DB와 연동을 위한 Connection 객체를 얻어내는 부분
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		//퀴리문 - rent 테이블 데이터 가져오기
		String sql1 = "select * from library.rent where booknum=?";
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1,bnum);

		rs = pstmt.executeQuery();
		
		//반납예정일 - reserve테이블의 resdate에 넣음
		String rdate = null;	
		while (rs.next()) {
			rdate = rs.getString("rdate");
		}
		
		//퀴리문 - member 테이블 데이터 가져오기
		String sql2 = "select * from library.member where member_id=?";
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1,resid);
		rs = pstmt.executeQuery();
		
		//member구분 - 대출가능일로부터 반납일 계산을 위해
		String member_title = null;
		
		while (rs.next()) {
			member_title = rs.getString("member_title");
		}
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date_rdate = transFormat.parse(rdate);
		 
		// 학부
		Calendar day1 = Calendar.getInstance();
		day1.setTime(date_rdate);
		day1.add(Calendar.DATE, +10);
		String rdate1 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day1.getTime());
		// 대학원
		Calendar day2 = Calendar.getInstance();
		day2.setTime(date_rdate);
		day2.add(Calendar.DATE, +30);
		String rdate2 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day2.getTime());
		// 교직원
		Calendar day3 = Calendar.getInstance();
		day3.setTime(date_rdate);
		day3.add(Calendar.DATE, +60);
		String rdate3 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day3.getTime());
		
		
		
		//쿼리를 수행하는 부분
		String sql3 = "insert into library.reserve values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql3);
		pstmt.setString(1,null);
		pstmt.setString(2,bnum);
		pstmt.setString(3,resid);
		pstmt.setString(4,rdate);
		
		if(member_title.equals("undergraduate")) {
			pstmt.setString(5,rdate1);
		} else if(member_title.equals("postgraduate")) {
			pstmt.setString(5,rdate2);
		} else if(member_title.equals("faculty")) {
			pstmt.setString(5,rdate3);
		}
		
		pstmt.setString(6,status);
		pstmt.executeUpdate(); //쿼리실행
		
		//쿼리를 수행하는 부분
		String sql4 = "update library.book set reserved=? where bnum=?";
		pstmt = conn.prepareStatement(sql4);
		pstmt.setString(1,re);
		pstmt.setString(2,bnum);
		pstmt.executeUpdate(); //쿼리실행
		
		out.println("<script>");
		out.println("location.href='회원도서목록.jsp'");
		out.println("</script>");

	}
	catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn!=null)try{conn.close();}catch(SQLException sqle){}
	}
%>