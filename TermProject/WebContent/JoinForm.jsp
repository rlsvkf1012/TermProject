<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
tr{
  border-bottom: 10px solid #e9e9e9e9;
}
</style>
<title> ȸ������ </title>
<link rel = "stylesheet" href="css/bootstrap.css">
	
	<script type="text/javascript">
	
	/*
	// ���̵�, ��й�ȣ�� �ԷµǾ����� Ȯ��
	function checkvalue()
	{
		if(!document.userInfo.id.value){
			alert("���̵� �Է��ϼ���.");
			return false;
		}
		
		if(!document.userInfo.password.value){
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}
		
		// ��й�ȣ ���Է�
		if(document.userInfo.password.value!=document.userInfo.passwordcheck.value){
			alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
			return false;
		}
	}*/
	
	// ��� ��ư�� Ŭ���ϸ� �α��� ȭ������ �̵�
	function goLoginForm(){
		location.href="LoginForm.jsp";
	}	
	</script>	
</head>


<body style ="padding-top: 20px">>
<div class="container">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<div class="jumbotron" style="padding-top: 20px; text-align:center">
				<form action="JoinPro.jsp" name="memberInfo" method="post">
	<br><br>
	<h3 style="text-align: center">ȸ������</h3><br><br><br>

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
				<td id="title"> ��й�ȣ Ȯ�� </td>
				<td>
					<input type="password" name="passwordcheck" maxlength="10">
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
					<input type="text" name="phonenumber" maxlength="11">
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
		</table>
		<br>
		<input type="submit" value="����">
		<input type="button" value="���" onclick="goLoginForm()">		
	</form>	
			</div>
		</div>
	</div>	
</body>
</html>