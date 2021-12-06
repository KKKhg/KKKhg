<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 게임</title>
<!-- <link rel="stylesheet" type="text/css" href="/guguDan/css/shape.css"> -->

<script>
	var answer=document.getElementById("answer");
	var action=0;		/* timer 실행여부 0=미실행,1=실행중*/
	var actionKey=0;    /* timer 실행여부에 따라 리셋해줌. */
	var n1;
	var n2;
	var inputN;			/* 입력받은 숫자 */
	var score=0;		/* 점수 */
	
	/* 타이머 */
	function countDownTimer(){
		var target = +new Date()+2000;
		var timer=null;
		
		function count(){
			action=1;
			var now=new Date();
			var remain=(target-now);
			
			var sec=Math.floor(remain/1000);	
			var millisec=Math.floor(remain%1000/10);
			if (millisec<10){ millisec="0"+millisec; }
			
			document.getElementById("timer").innerHTML=sec+" : ";
			document.getElementById("timer").innerHTML+= millisec;
			
			if (remain <= 0 || actionKey==1){
					document.getElementById("timer").innerHTML= "0 : 00";
				if (remain<=0 || failkey==1){
					if(failkey!=1) document.getElementById("message").innerHTML="~~ 시 간 초 과 ~~ ";
					document.getElementById("answer").disabled=true;
					name = prompt("Score : "+score+" 점"+"\n등록할 닉네임을 입력하세요. 공백은 등록되지 않습니다.");
					if(name!=null && name!="") {
						document.getElementById("score").value=score;
						document.getElementById("name").value=name;
						document.getElementById("form").submit();
					}
				}//if_시간초과
				clearInterval(timer);
				actionKey=0;
				action=0;
			}//if_fail
		}//count_타이머실행
		
		timer=setInterval(count,10);
		
	}//countDownTimer
	
	/* 난수생성 */
	var randomGame = {}; 
		randomGame.gameStart=function() {
		
			n1 = Math.floor(Math.random()*9+1);
			n2 = Math.floor(Math.random()*9+1);
			
			document.getElementById("n1").innerHTML = n1;
			document.getElementById("x").innerHTML = "x";
			document.getElementById("n2").innerHTML = n2;
			document.getElementById("eq").innerHTML = "=";
		}//gameStart

	
	function start() {
		document.getElementById("answer").disabled=false;
		document.getElementById("answer").value=null;
		answerFocus();
		randomGame.gameStart();
		failkey=0;
		if(action==1) {
			actionKey=1;
		} else{ 
			document.getElementById("scoreM").innerHTML="점수 : 0 점";
			score=0;
		}
		countDownTimer();
	}//start

	/* 입력값 받아와서 정오확인 및 start or fail */
	function input() {
		inputN=document.getElementById("answer").value;
		if (n1*n2==inputN) {
			score += 10;
			document.getElementById("scoreM").innerHTML='점수 : '+score+' 점';
			document.getElementById("message").innerHTML="**  잘했어요! 정답입니다~  **";
			start();
		}
		else {
			failkey=1;
			actionKey=1;
			document.getElementById("answer").disabled=true;
			document.getElementById("message").innerHTML="~~ 오 답 ~~ ";
		}
	}//input
		
	/* 엔터키로 입력 */
	function enterKey(){
		if(window.event.keyCode==13) input(); 
	}
	
	/* 오토포커스 */
	function answerFocus() {
		document.getElementById("answer").focus();
	}

	/* 스페이스바 start */
	window.onkeydown = function()	{
		if(event.keyCode == 32 && document.getElementById("answer").disabled==true ) start()
	};
	
/* 
	var gameButton = document.getElementById("gameButton");
	if (gameButton.addEventListener("click", function() {
		if (n1*n2==inputN) return true;
		else return false;
	})) score = 10;
	else socre=0; */
		
</script>

<style>

@font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

/* Shape */

* { margin: 0; padding: 0; border: 0; font-family: CookieRun-Regular}

.cen {text-align: center; align-content: center;}

.bodycon { width: 100%; height: 100%; }

.subject {margin: 15px auto;}

.content { width: 60%; height: 80%; position: absolute; left: 20%; top: 10%; background-color: MintCream;
			border-radius: 10%; }

.bodycon::after {width: 100%; height: 100%; position: absolute; background-image: url("/guguDan/img/bg.png"); content:"";
			opacity: 40%; left: 0; top: 0;  z-index: -1;} 

/* 메인 */
.main{height: 30%; margin-top: 30px; margin-bottom: 20px;  }

#timer{font-size: 40px; font-weight: 800;}

.startbutton {width: 100px; height: 30px; background-color: red; color: yellow; 
			 border-radius: 10%; font-size: 20px; font-weight: 300;}

.startbutton:hover { cursor: pointer; border: 2px solid yellow;}

.startbutton:active {border-width: 4px;}

#n1,#n2,#x,#eq { font-size: 50px; font-weight: 300; margin-right: 20px;}

#answer {width: 100px; height: 50px; outline-color: lightgray; outline-width: 1px; font-size: 40px;}

#answer:focus { outline-color: darkred; outline-width: 3px;}

#message {font-size: 20px; font-weight: 800; color: deeppink;}

#scoreM {font-size: 25px; font-weight: 1000; color: red;}

/* 스코어보드 */
.scoreboard { align-content: center; }

table { width: 60%; border-collapse: collapse; margin: 5px 0 20% 20%;}

.subject-scoreboard {font-size: 35px; color: gray; font-weight: bold;}

.colranking{ width: 20%;}

.colname { width: 50%;}

.colscore { width: 30%;}

.tablerow { height: 28px;}

.tableheader{ text-shadow: 2px 2px 2px white; background-color: gray; height: 30px; font-size: 25px;
			border-top: 3px solid black; border-bottom: 1px solid gray;}

.tabledata {border-bottom: 1px solid black; border-top: 1px solid gray;}

.tabledata:last-child {border-bottom: 3px solid black;}

.tabledata:nth-child(2) {color: red; font-weight: bold;}

.tabledata:nth-child(3) {color: purple; font-weight: bold;}

.tabledata:nth-child(4) {color: orange; font-weight: bold;}

.tabledata:nth-child(2n+1){background-color: #fffae6;}

.tabledata:nth-child(2n){background-color: #f5f5f5;}

</style>

</head>
<body>
<div class="bodycon">
	<div class="cen content">
		<!-- 제목 -->
		<div class="subject"><h1>구구단 게임</h1></div>	
		<!-- 네비 -->
<!-- 		<div class="nav right">
			<button class="nav-button now" type="button" onclick="">메인</button>
			<button class="nav-button" type="button" onclick="">내정보</button>
			<button class="nav-button" type="button" onclick="">로그아웃</button>
		</div>  -->
		
		<!-- 메인 -->
		<div class="main">
			<span id="message">SpaceBar를 눌러 게임을 시작하세요.</span><br>
			<span id = scoreM>&nbsp;</span><br> 
			<form action="/guguDan/insert" method="get" id="form">
				<input id="name" name="name" type="hidden">
				<input id="score" name="score" type="hidden">
			</form>
			<span id="timer">0 : 00</span><br>
			<button class="startbutton" onclick="start()">START</button>
			<div class="game">
				<span id="n1">0</span> <span id="x">x</span> <span id="n2">0</span> <span id="eq">=</span> 
				<input id="answer" type="text" disabled="disabled" onkeydown="enterKey()">
			</div>
		</div>
		
		<!-- 스코어보드 -->
		<div class="scoreboard">		
			<span class="subject-scoreboard">ScoreBoard</span>
			<table> 
			<tr class="tablerow tableheader"><th class="colranking">Ranking</th><th class="colname">Name</th><th class="colscore">Score</th></tr>
			<c:forEach var="vo" items="${list }" varStatus="var">			
			<tr class="tablerow tabledata"><td class="colranking">${var.count}</td><td class="colname">${vo.name }</td><td class="colscore">${vo.score}</td></tr>
			</c:forEach>
			
		<!-- 	create table record(
			name varchar(10),
			score int(10)); -->
			</table>
		</div>
	</div>
</div>
</body>
</html>