<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ����</title>
</head>
<body>
	<H2> member ���̺� ȸ�� ���� ���� </H2>
	<form method="post" action="updateMemberPro.jsp">
		���̵� : <input type="text" name="id" maxlength="15"><br/>
		�н����� : <input type="password" name="passwd" maxlength="15"><br/>
		�̸� : <input type="text" name="name" maxlength="15"><br/>
		�̸��� : <input type="text" name="email" maxlength="30"><br/>
		��ȭ��ȣ : <input type="text" name="phone" maxlength="15"><br/>
		���� : <input type="text" name="division" maxlength="15"><br/>
		<input type="submit" value="�Է¿Ϸ�">
	</form>
</body>
</html>