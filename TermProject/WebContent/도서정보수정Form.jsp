<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ȸ����������</title>

<link rel = "stylesheet" href="css/bootstrap.css">

<style>
tr{
  border-bottom: 10px solid #e9e9e9e9;
}
</style>
	
<script type="text/javascript">
	function goBack(){
		location.href="adminHome.jsp";
	}	
</script>	

</head>
<body style ="padding-top: 20px">
<div class="container">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<div class="jumbotron" style="padding-top: 20px; text-align:center">
		<form action="������������Pro.jsp" name="������������" method="post">
	<h3 style="text-align: center">���� ���� ����</h3><br><br><br>
	<table>
			<tr>
				<td id="title">������ȣ</td>
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
				<td id="title">å ����</td>
				<td>
					<input type="text" name="btitle" maxlength="20">
				</td>
			</tr>			
			<tr>
				<td id="title">����</td>
				<td>
					<input type="text" name="author" maxlength="20">
				</td>
			</tr>			
			<tr>
				<td id="title">���ǻ�</td>
				<td>
					<input type="text" name="publication" maxlength="20">
				</td>
			</tr>			
		</table><br>
				<input type="submit" value="����">
		<input type="button" value="���" onclick="goBack()">		
	</form>	
			</div>
		</div>
	</div>	
</body>
</html>