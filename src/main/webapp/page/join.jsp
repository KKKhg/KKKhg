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
form {margin-top: 40px;}

.jointext {font-size: 20px; position:relative; right: 260px;}
	
input {width: 600px; height: 50px; border: 2px solid lightgray; font-size: 15px}

.joininput:focus {outline-color: limegreen;}

.joinsubmit { color: white; background-color: limegreen; margin-top: 25px; margin-bottom: 20px;  }

.joinbutton:hover {cursor: pointer; border: 3px solid lightgray;} 

.joinresethome {background-color: lightgray; margin-bottom: 20px;}

.joinresethome:hover {border: 1px solid gray;}

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
			<form action="#" method="post">
				<div>
					<span class="jointext"><b>아이디&nbsp;&nbsp;&nbsp;</b></span> <br>
					<input class="joininput" type="text" name="id" maxlength="15" > <br>
				</div>
				<div>
					<span class="jointext"><b>비밀번호</b></span> <br>
					<input class="joininput" type="password" name="password" maxlength="20" >
				</div>
				<div>
					<span class="jointext"><b>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></span> <br>
					<input class="joininput" type="text" name="name" maxlength="15" >
				</div>
				
				<input class="joinsubmit joinbutton" type="submit" value="가입하기"><br>
				<input class="joinbutton joinresethome" type="reset" value="취소"><br>
				<input class="joinbutton joinresethome" type="button" value="Home" onclick="location.href=''"> 
			</form>
		</div>
		
		
	</div>
</div>







</body>
</html>