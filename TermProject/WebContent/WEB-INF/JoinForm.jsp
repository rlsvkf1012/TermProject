<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

	<title> 회원가입 </title>

	<!-- css --> 
	<link href='' rel='stylesheet' style='text.css'/>
	
	<script type="text/javascript">
	
	// 아이디, 비밀번호가 입력되었는지 확인
	function checkvalue()
	{
		if(!document.userInfo.id.value){
			alert("아이디를 입력하세요.");
			return false;
		}
		
		if(!document.userInfo.password.value){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		// 비밀번호 재입력
		if(document.userInfo.password.value!=document.userInfo.passwordcheck.value){
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
	
	// 취소 버튼을 클릭하면 로그인 화면으로 이동
	function goLoginForm(){
		location.href="LoginForm.jsp";
	}	
	</script>
	
</head>
<body>

	<br><br>
	<b><font size="6" color="gray">회원가입</font></b>
	<br><br><br>
	
	<form action="JoinPro.jsp" name="memberInfo" method="post">
		<table>
			<tr>
				<td id="title">아이디 </td>
				<td>
					<input type="text" name="id" maxlength="9">
				</td>
			</tr>			
			<tr>
				<td id="title">비밀번호 </td>
				<td>
					<input type="password" name="password" maxlength="10">
				</td>
			</tr>
			
			<tr>
				<td id="title"> 비밀번호 확인 </td>
				<td>
					<input type="password" name="passwordcheck" maxlength="10">
				</td>
			</tr>
			
			<tr>
				<td id="title"> 이름 </td>
				<td>
					<input type="text" name="name" maxlength="40">
				</td>
			</tr>
			
			<tr>
				<td id="title"> 이메일 </td>
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
				<td id="title"> 전화번호 </td>
				<td>
					<input type="text" name="phonenumber" maxlength="11">
				</td>
			</tr>
			
			<tr>
				<td id="title"> 회원구분 </td>
				<td>
					<select name="type">
						<option>학부</option>
						<option>대학원</option>
						<option>교직원</option>
					</select>
				</td>
			</tr>
		</table>
		<br>
		<input type="submit" value="가입">
		<input type="button" value="취소" onclick="goLoginForm()">		
	</form>	

</body>
</html>