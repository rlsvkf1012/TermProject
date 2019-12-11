<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=devide-width, initial-scale=3">
<link rel = "stylesheet" href="css/bootstrap.css">
<title> 로그인 </title>

</head>
<body style=margin:80px>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-jtop: 20px;">
				<form action="LoginPro.jsp" method="post">
			
					<img src="./images/logo.jpg" style="object-fit:contain" class="form-control">	
					<br>
					<h3 style="text-align: center"> 도서관리 시스템  </h3> <br>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디(학번)을 입력하세요" name="id" maxlength="10">
					</div>
					<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="password" maxlength="10">
					</div>
					<button type="submit" class="btn btn-info btn-block"> 로그인  </button>
					<button type="button" onclick="location.href='JoinForm.jsp'"class="btn btn-info btn-block"> 회원가입 </button>
				</form>
			</div>
		</div>
		
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>