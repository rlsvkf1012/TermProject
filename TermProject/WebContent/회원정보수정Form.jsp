<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원정보수정</title>

<link rel = "stylesheet" href="css/bootstrap.css">

<style>
tr{
  border-bottom: 10px solid #e9e9e9e9;
}
</style>
	
<script type="text/javascript">
	function goBack(){
		location.href="내정보Form.jsp";
	}	
</script>	

</head>
<body style ="padding-top: 20px">
<div class="container">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<div class="jumbotron" style="padding-top: 20px; text-align:center">
		<form action="회원정보수정Pro.jsp" name="내정보수정" method="post">
	<h3 style="text-align: center">내 정보 수정</h3><br><br><br>
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
					<input type="text" name="phone" maxlength="11">
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
		</table><br>
				<input type="submit" value="수정">
		<input type="button" value="취소" onclick="goBack()">		
	</form>	
			</div>
		</div>
	</div>	
</body>
</html>