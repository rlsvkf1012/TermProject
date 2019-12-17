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
	String phone = request.getParameter("phone");
	String title = request.getParameter("type");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPass = "5826";
		
		
		//DB�� ������ ���� Connection ��ü�� ���� �κ�
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		// ������ �����ϴ� �κ�
		String sql = "select member_id, member_pw from library.member where member_id =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		// ���ڵ��� �˻� ����� �۾� ó��
		if(rs.next()) {
			String rId = rs.getString("member_id");
			String rPasswd = rs.getString("member_pw");
			if(id.equals(rId) && passwd.equals(rPasswd)) { // ���̵�,�н����尡 ��ġ�ϴ� ��� ����
				sql = "update library.member set member_name =?, member_email =?, member_tel =?, member_title =? where member_id =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				pstmt.setString(3, phone);
				pstmt.setString(4, title);
				pstmt.setString(5, id);
				pstmt.executeUpdate();
				
				out.println("<script>");
				out.println("location.href='������.jsp'");
				out.println("</script>");
				
			} else{ // �н����尡 ��ġ���� ������
			%><script>alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");</script>
			<%}
			}
			else{ //�������� �ʴ� ���̵��� ���
			%><script>alert("���̵� ��ġ���� �ʽ��ϴ�.");</script>
			<%}
	}catch(Exception e){
		e.printStackTrace();
	} finally {
		if(rs != null)try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>