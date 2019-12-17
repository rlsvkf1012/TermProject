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
<title> 회원가입 </title>
<link rel = "stylesheet" href="css/bootstrap.css">
	
	<script type="text/javascript">
	
	/*
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
	}*/
	
	// 취소 버튼을 클릭하면 로그인 화면으로 이동
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
	<h3 style="text-align: center">회원가입</h3><br><br><br>

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
				<td id="title"> 전화번호 </td>
				<td>
					<input type="text" name="phonenumber" maxlength="11">
				</td>
			</tr>
			
			<tr>
				<td id="title"> 회원구분 </td>
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
		<input type="submit" value="가입">
		<input type="button" value="취소" onclick="goLoginForm()">		
	</form>	
			</div>
		</div>
	</div>	
</body>
</html>