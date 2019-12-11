<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>도서 삭제</title>
</head>
<body>
	<H2> book 테이블에 도서 삭제 </H2>
	<form method="post" action="deleteBookPro.jsp">
		ISBN : <input type="text" name="isbn" maxlength="15"><br/>
		번호 : <input type="text" name="bnum" maxlength="15"><br/>
		<input type="submit" value="입력완료">
	</form>
</body>
</html>