<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}else{
		out.println("<script>");
		out.println("location.href=loginForm.jsp");
		out.println("</script>");
	}
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자메인화면</title>
<link rel = "stylesheet" href="css/bootstrap.css">
</head>
<body>
	<nav class="navbar navbar-default">
		<span class="navbar-text"> <%=id %> 님 반갑습니다 ! </span>
		<ul id="nav" class="nav navbar-nav">
			<li><a href="로그아웃.jsp">로그아웃</a></li>
		</ul>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
		<div class="jumbotron" style="padding-top: 20px; text-align:center">
				<form method="post">
				
			<h3 style="text-align: center">관리자 메뉴</h3><br><br><br>
			<button type="button" class = "btn btn-info" onclick="location.href='Info.jsp'" >회원정보 관리하기</button><br><br><br><br>
			<button type="button" class = "btn btn-info" onclick="location.href='도서목록.jsp'" >도서정보 관리하기</button><br><br><br><br>
			<button type="button" class = "btn btn-info" onclick="location.href='관리자도서현황.jsp'" >도서반납 관리하기</button>
				</form><br><br><br>
			<a href="로그아웃.jsp">로그아웃</a>				
		</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>