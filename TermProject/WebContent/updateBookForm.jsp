<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ����</title>
</head>
<body>
	<H2> book ���̺� ���� ���� ���� </H2>
	<form method="post" action="updateBookPro.jsp">
		ISBN : <input type="text" name="isbn" maxlength="15"><br/>
		��ȣ : <input type="text" name="bnum" maxlength="15"><br/>
		������ : <input type="text" name="bname" maxlength="30"><br/>
		���� : <input type="text" name="author" maxlength="30"><br/>
		���ǻ� : <input type="text" name="publish" maxlength="30"><br/>
		<input type="submit" value="�Է¿Ϸ�">
	</form>
</body>
</html>