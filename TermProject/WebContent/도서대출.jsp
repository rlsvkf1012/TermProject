<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.util.*, java.text.*"%>

<% request.setCharacterEncoding("euc-kr"); %>

<%	
	String bnum = request.getParameter("bnum");
	String mid = (String)session.getAttribute("id");	
	String status = "borrow";
	
	Timestamp borrowed = new Timestamp(System.currentTimeMillis());
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String bdate = simpleDate.format(borrowed);
	// �к�
	Calendar day1 = Calendar.getInstance();
	day1.add(Calendar.DATE, +10);
	String rdate1 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day1.getTime());
	// ���п�
	Calendar day2 = Calendar.getInstance();
	day2.add(Calendar.DATE, +30);
	String rdate2 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day2.getTime());
	// ������
	Calendar day3 = Calendar.getInstance();
	day2.add(Calendar.DATE, +60);
	String rdate3 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day3.getTime());
	String x ="X";
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "5826";
		
		
		//DB�� ������ ���� Connection ��ü�� ���� �κ�
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		//������ �����ϴ� �κ�
		String sql = "insert into library.rent values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,bnum);
		pstmt.setString(2,mid);
		pstmt.setString(3,bdate);
		pstmt.setString(4,rdate1);
		pstmt.setString(5,status);
		pstmt.executeUpdate(); //��������
		
		//������ �����ϴ� �κ�
		String sql1 = "update library.book set borrowed=? where bnum=?";
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1,x);
		pstmt.setString(2,bnum);
		pstmt.executeUpdate(); //��������
		
		out.println("<script>");
		out.println("location.href='ȸ���������.jsp'");
		out.println("</script>");

	}
	catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn!=null)try{conn.close();}catch(SQLException sqle){}
	}
%>




