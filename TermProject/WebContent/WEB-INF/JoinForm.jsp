<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

	<title> ȸ������ </title>

	<!-- css --> 
	<link href='' rel='stylesheet' style='text.css'/>
	
	<script type="text/javascript">
	
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
	}
	
	// ��� ��ư�� Ŭ���ϸ� �α��� ȭ������ �̵�
	function goLoginForm(){
		location.href="LoginForm.jsp";
	}	
	</script>
	
</head>
<body>

	<br><br>
	<b><font size="6" color="gray">ȸ������</font></b>
	<br><br><br>
	
	<form action="JoinPro.jsp" name="memberInfo" method="post">
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
					<input type="text" name="email" maxlength="50">
					<select name="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
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
						<option>�к�</option>
						<option>���п�</option>
						<option>������</option>
					</select>
				</td>
			</tr>
		</table>
		<br>
		<input type="submit" value="����">
		<input type="button" value="���" onclick="goLoginForm()">		
	</form>	

</body>
</html>