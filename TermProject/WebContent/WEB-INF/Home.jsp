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

<title>메인페이지</title>
<link rel = "stylesheet" href="css/bootstrap.css">

</head>
<body>
	<nav class="navbar navbar-default">
		<span class="navbar-text"> <%=id %> 님 반갑습니다 ! </span>
		<ul id="nav" class="nav navbar-nav">
			<li><a href="logout.jsp">로그아웃</a></li>
		</ul>
	</nav>
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
		<div class="jumbotron" style="padding-top: 20px; text-align:center">
				<form method="post">
				
			<h3 style="text-align: center">사용자 메뉴</h3><br><br><br>
			<button type="button" class = "btn btn-info" onclick="location.href='Info.jsp'" > 도 서  정 보 </button><br><br><br><br>
			<button type="button" class = "btn btn-info" onclick="location.href='Book.jsp'" >내 도서 관리</button><br><br><br><br>
			<button type="button" class = "btn btn-info" onclick="location.href='rent.jsp'" >내 정보 관리</button>
				</form><br><br><br>		
			<% if(id.equals("admin")){ %>
    		<a href="adminHome.jsp">관리자 메뉴 보기</a><%}%>
		</div>
		</div>
	</div>	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>



</body>
</html>