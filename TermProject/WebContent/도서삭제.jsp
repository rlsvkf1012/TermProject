<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%	
	String bnum = request.getParameter("bnum");
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
		String sql = "delete from library.book where bnum=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bnum);
		pstmt.executeUpdate(); //��������
		
		//���� ������ ����Ǵ� �κ�
		response.sendRedirect("adminHome.jsp");
	}
	catch(Exception e){
		out.println(e);
	}
%>