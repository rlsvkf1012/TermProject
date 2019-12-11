<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	//�Ķ���� ���� ���� �κ�
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
		
		
		//DB�� ������ ���� Connection ��ü�� ���� �κ�
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		//������ �����ϴ� �κ�
		String sql = "insert into library.book values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,bnumber);
		pstmt.setString(2,ISBN);
		pstmt.setString(3,btitle);
		pstmt.setString(4,author);
		pstmt.setString(5,publication);	
		pstmt.setString(6,borrowed);
		pstmt.setString(7,reserved);
		pstmt.executeUpdate(); //��������
		
		//���� ������ ����Ǵ� �κ�
		response.sendRedirect("�������.jsp");

	}catch(Exception e){
		//���� ���н� ����Ǵ� �κ�
		out.println(e);
	}
	finally{//������ ���� �Ǵ� ���� �� ����� �ڿ��� ��ü�ϴ� �κ�
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>