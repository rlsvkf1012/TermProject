<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%	
	String delete_id = request.getParameter("id");
	Connection conn = null;
	PreparedStatement pstmt = null;
	//String id = request.getParameter("del");
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "5826";
		
		
		//DB�� ������ ���� Connection ��ü�� ���� �κ�
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		//������ �����ϴ� �κ�
		String sql = "delete from library.member where member_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, delete_id);
		pstmt.executeUpdate(); //��������
		
		//���� ������ ����Ǵ� �κ�
		response.sendRedirect("Info.jsp");
	}
	catch(Exception e){
		out.println(e);
	}
%>