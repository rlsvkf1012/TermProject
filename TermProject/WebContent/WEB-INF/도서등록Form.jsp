<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

	<title>������� </title>

	<!-- css --> 
	<link href='' rel='stylesheet' style='text.css'/>
	<script type="text/javascript">
	
	// ��� ��ư�� Ŭ���ϸ� Home ȭ������ �̵�
	function goAdminHome(){
		location.href="adminHome.jsp";
	}	
	</script>
	
</head>
<body>

	<br><br>
	<b><font size="6" color="gray">������� </font></b>
	<br><br><br>
	
	<form action="�������Pro.jsp" name="register" method="post">
		<table>
			<tr>
				<td id="title">������ȣ</td>
				<td>
					<input type="text" name="bnum" maxlength="13">
				</td>
			</tr>
			<tr>
				<td id="title">ISBN</td>
				<td>
					<input type="text" name="ISBN" maxlength="13">
				</td>
			</tr>		
			<tr>
				<td id="title">å ����</td>
				<td>
					<input type="text" name="btitle" maxlength="20">
				</td>
			</tr>			
			<tr>
				<td id="title">����</td>
				<td>
					<input type="text" name="author" maxlength="20">
				</td>
			</tr>			
			<tr>
				<td id="title">���ǻ�</td>
				<td>
					<input type="text" name="publication" maxlength="20">
				</td>
			</tr>			
		</table>
		<br>		
		<input type="submit" value="���">
		<input type="button" value="���" onclick="goAdminHome()">		
	</form>	

</body>
</html>