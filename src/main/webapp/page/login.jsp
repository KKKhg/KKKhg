<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 게임</title>
<link rel="stylesheet" type="text/css" href="/guguDan/css/shape.css">
<style type="text/css">

/* 메인 */
form {margin-top: 100px;}

.main-input {width: 600px; height: 50px; border: 2px solid lightgray; font-size: 15px; margin: 5px auto;}
	
.main-input:focus { outline-color: limegreen;}
	
.main-button { width: 300px; height: 50px; border: 1px solid lightgray; background-color: limegreen;
				color: white; margin-bottom: 25px; }
	
.main-button:hover, .main-button:active {cursor: pointer; border: 2px solid lightgray; } 
	



</style>

</head>
<body>
<div class="bodycon">
	<div class="cen content">
	
	
		<!-- 제목 -->
		<div class="subject"><h1>구구단 게임</h1></div>	
		<!-- 네비 -->
		<div class="nav right">
			<button class="nav-button now" type="button" onclick="">메인</button>
			<button class="nav-button" type="button" onclick="">내정보</button>
			<button class="nav-button" type="button" onclick="">로그아웃</button>
		</div>
		
		<!-- 메인 -->
		<div class="main">
			<form action="" method="post">
				<div>
					<input class="main-input" type="text" name="id" maxlength="15" placeholder="아이디">
				</div>
				<div>
					<input class="main-input" type="password" name="password" maxlength="20" placeholder="비밀번호">
				</div>
				<br>
				
				<button class="main-button" type="submit">로그인</button>
				<button class="main-button" type="button">회원가입</button>
			</form>
		
		
		</div>
		
		
	</div>
</div>







</body>
</html>