<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%	
	//�Ķ���� ���� ���� �κ�
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
		
		
		//DB�� ������ ���� Connection ��ü�� ���� �κ�
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		// ������ �����ϴ� �κ�
		String sql = "select bnum from library.book where bnum =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bnum);
		rs = pstmt.executeQuery();
		
		// ���ڵ��� �˻� ����� �۾� ó��
		if(rs.next()) {
			String rbnum = rs.getString("bnum");
			if(rbnum.equals(bnum)){ // å ��ȣ�� ��ġ�ϴ� ��� ����
				sql = "update library.book set ISBN=?, btitle=?, author=?, publication=? where bnum=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ISBN);
				pstmt.setString(2, btitle);
				pstmt.setString(3, author);
				pstmt.setString(4, publication);
				pstmt.setString(5, bnum);
				pstmt.executeUpdate();
				
				out.println("<script>");
				out.println("location.href='�������.jsp'");
				out.println("</script>");
				
			} else{ // ������ȣ�� ��ġ���� ������
			%><script>alert("������ȣ�� ��ġ���� �ʽ��ϴ�.");</script>
			<%}
			}
			else{ //�������� �ʴ� ���̵��� ���
			%><script>alert("������ȣ�� �������� �ʽ��ϴ�.");</script>
			<%}
	}catch(Exception e){
		e.printStackTrace();
	} finally {
		if(rs != null)try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null)try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null)try{conn.close();}catch(SQLException sqle){}
	}
%>