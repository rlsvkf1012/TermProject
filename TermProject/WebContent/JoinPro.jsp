<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	//�Ķ���� ���� ���� �κ�
	String id = request.getParameter("id");
	String passwd = request.getParameter("password");
	String name = request.getParameter("name");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1+email2;
	String phonenumber = request.getParameter("phonenumber");
	String title = request.getParameter("type");
	
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
		String sql = "insert into library.member values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		pstmt.setString(3,name);
		pstmt.setString(4,email);
		pstmt.setString(5,phonenumber);
		pstmt.setString(6,title);		
		pstmt.executeUpdate(); //��������
		
		//���� ������ ����Ǵ� �κ�
		response.sendRedirect("LoginForm.jsp");

	}catch(Exception e){
		//���� ���н� ����Ǵ� �κ�
		out.println(e);
	}
	finally{//������ ���� �Ǵ� ���� �� ����� �ڿ��� ��ü�ϴ� �κ�
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>

