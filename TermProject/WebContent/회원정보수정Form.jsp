<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ȸ����������</title>

<link rel = "stylesheet" href="css/bootstrap.css">

<style>
tr{
  border-bottom: 10px solid #e9e9e9e9;
}
</style>
	
<script type="text/javascript">
	function goBack(){
		location.href="������Form.jsp";
	}	
</script>	

</head>
<body style ="padding-top: 20px">
<div class="container">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<div class="jumbotron" style="padding-top: 20px; text-align:center">
		<form action="ȸ����������Pro.jsp" name="����������" method="post">
	<h3 style="text-align: center">�� ���� ����</h3><br><br><br>
	<table>
			<tr>
				<td id="title">���̵� </td>
				<td>
					<input type="text" name="id" maxlength="9">
				</td>
			</tr>
			<tr>
				<td id="title">��й�ȣ </td>
				<td>
					<input type="password" name="password" maxlength="10">
				</td>
			</tr>
			
			<tr>
				<td id="title"> �̸� </td>
				<td>
					<input type="text" name="name" maxlength="40">
				</td>
			</tr>
			
			<tr>
				<td id="title"> �̸��� </td>
				<td>
					<input type="text" name="email1" maxlength="50">
					<select name="email2">
						<option>@naver.com</option>
						<option>@daum.net</option>
						<option>@gmail.com</option>
						<option>@nate.com</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td id="title"> ��ȭ��ȣ </td>
				<td>
					<input type="text" name="phone" maxlength="11">
				</td>
			</tr>
			
			<tr>
				<td id="title"> ȸ������ </td>
				<td>
					<select name="type">
						<option>undergraduate</option>
						<option>postgraduate</option>
						<option>faculty</option>
					</select>
				</td>
			</tr>
		</table><br>
				<input type="submit" value="����">
		<input type="button" value="���" onclick="goBack()">		
	</form>	
			</div>
		</div>
	</div>	
</body>
</html>