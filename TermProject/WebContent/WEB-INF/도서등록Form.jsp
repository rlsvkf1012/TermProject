<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

	<title>도서등록 </title>

	<!-- css --> 
	<link href='' rel='stylesheet' style='text.css'/>
	<script type="text/javascript">
	
	// 취소 버튼을 클릭하면 Home 화면으로 이동
	function goAdminHome(){
		location.href="adminHome.jsp";
	}	
	</script>
	
</head>
<body>

	<br><br>
	<b><font size="6" color="gray">도서등록 </font></b>
	<br><br><br>
	
	<form action="도서등록Pro.jsp" name="register" method="post">
		<table>
			<tr>
				<td id="title">도서번호</td>
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
				<td id="title">책 제목</td>
				<td>
					<input type="text" name="btitle" maxlength="20">
				</td>
			</tr>			
			<tr>
				<td id="title">저자</td>
				<td>
					<input type="text" name="author" maxlength="20">
				</td>
			</tr>			
			<tr>
				<td id="title">출판사</td>
				<td>
					<input type="text" name="publication" maxlength="20">
				</td>
			</tr>			
		</table>
		<br>		
		<input type="submit" value="등록">
		<input type="button" value="취소" onclick="goAdminHome()">		
	</form>	

</body>
</html>