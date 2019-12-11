<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 수정</title>
</head>
<body>
	<H2> member 테이블에 회원 정보 수정 </H2>
	<form method="post" action="updateMemberPro.jsp">
		아이디 : <input type="text" name="id" maxlength="15"><br/>
		패스워드 : <input type="password" name="passwd" maxlength="15"><br/>
		이름 : <input type="text" name="name" maxlength="15"><br/>
		이메일 : <input type="text" name="email" maxlength="30"><br/>
		전화번호 : <input type="text" name="phone" maxlength="15"><br/>
		구분 : <input type="text" name="division" maxlength="15"><br/>
		<input type="submit" value="입력완료">
	</form>
</body>
</html>