<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>도서 정보 수정</title>
</head>
<body>
	<H2> book 테이블에 도서 정보 수정 </H2>
	<form method="post" action="updateBookPro.jsp">
		ISBN : <input type="text" name="isbn" maxlength="15"><br/>
		번호 : <input type="text" name="bnum" maxlength="15"><br/>
		도서명 : <input type="text" name="bname" maxlength="30"><br/>
		저자 : <input type="text" name="author" maxlength="30"><br/>
		출판사 : <input type="text" name="publish" maxlength="30"><br/>
		<input type="submit" value="입력완료">
	</form>
</body>
</html>